{ config, ... }:

{
  nixpkgs.config.allowUnfree = true;

  hardware.graphics.enable = true;
  hardware.opengl.enable = true;

  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
  };

  boot.blacklistedKernelModules = [ "nouveau" ];

  hardware.nvidia = {

    modesetting.enable = true;

    powerManagement.enable = false;

    open = false;

    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.stable;

  };
}
