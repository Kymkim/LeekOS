{config, pkgs, lib, ... }:

{
  options = {
    system-modules.vm = {

      enable = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Whether to enable virtualization tools";
      };

      waydroid.enable = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Whether to enable Waydroid for Android Virtualization";
      };

      qemu.useAntiDetectionPatch = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Whether to use Zhaodice's QEMU Anti Detection Patch";
      };
    
      PCIpassthrough = {
        enable = lib.mkOption {
          default = false;
          type = lib.types.bool;
          description = "Whether to enable PCI passthrough support";
        };

        cpuIOMMU = lib.mkOption {
          default = "";
          example = "amd_iommu";
          type = lib.types.str;
          description = ''
            Turns onn IOMMU for the given argument. 
            Use amd_iommu for AMD CPUs and intel_iommu for Intel CPUs.
          '';
        };

        pciIDs = lib.mkOption {
          default = [];
          example = ["10de:21c4" "10de:1aeb" "10de:1aec" "10de:1aed"];
          type = lib.types.listOf lib.types.str;
          description = ''
            The array of strings of PCI IDs to passthrough.
          '';
        };

        bypassIOMMU = lib.mkOption {
          default = false;
          type = lib.types.bool;
          description = ''
            Use only when your IOMMU groups are not isolated. 
            Use at your own risk at can introduce instability
          '';
        };
      };  

    };

  };

  config = lib.mkMerge [
    (
      lib.mkIf config.system-modules.vm.enable {  
        programs.dconf.enable = true;
      
        users.users.ukimnix.extraGroups = [ "libvirtd" ];
        
        environment.systemPackages = with pkgs; [
          virt-manager
          virt-viewer
          spice 
          spice-gtk
          spice-protocol
          win-virtio
          win-spice
          adwaita-icon-theme
        ];
        
        virtualisation = {
          libvirtd = {
            enable = true;
            qemu = {
              swtpm.enable = true;
              package = lib.mkIf config.system-modules.vm.qemu.useAntiDetectionPatch (
                pkgs.qemu.overrideAttrs (finalAttrs: previousAttrs: {
                  patches = previousAttrs.patches ++ [ ./qemu-8.2.0.patch ]; 
                })
              );
              ovmf.enable = true;
              ovmf.packages = [ pkgs.OVMFFull.fd ];
            };
          };
          spiceUSBRedirection.enable = true;
        };
        services.spice-vdagentd.enable = true;
      }
    )
    (
      lib.mkIf config.system-modules.vm.PCIpassthrough.enable {
        
        assertions = [
          {
            assertion = ((config.system-modules.vm.PCIpassthrough.cpuIOMMU == "amd_iommu")||(config.system-modules.vm.PCIpassthrough.cpuIOMMU == "intel_iommu"));
            message = "Invalid CPU type for IOMMU. Declare CPU type with config.system-modules.vm.cpuIOMMU with either amd_iommu or intel_iommu";
          }
        ];

        boot = {
          initrd.kernelModules = [
            "vfio_pci"
            "vfio"
            "vfio_iommu_type1"
          ];

          kernelParams = [
            (config.system-modules.vm.PCIpassthrough.cpuIOMMU + "=on")
            "iommu=pt"
            ("vfio-pci.ids=" + lib.concatStringsSep "," config.system-modules.vm.PCIpassthrough.pciIDs)
            (lib.mkIf config.system-modules.vm.PCIpassthrough.bypassIOMMU "pcie_acs_override=downstream,multifunction")
          ];

          kernelPatches = lib.mkIf config.system-modules.vm.PCIpassthrough.bypassIOMMU [
            {
              name = "add-acs-overrides";
              patch = ./1001-6.8.0-add-acs-overrides.patch;
            }
          ];
        };

      }
    )
    (
      lib.mkIf config.system-modules.vm.waydroid.enable {
        virtualisation.waydroid.enable = true;
      }
    )
  ];
}