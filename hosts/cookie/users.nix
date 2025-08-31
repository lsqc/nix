{ config, pkgs, ...}:

{
  users.users.minecraft = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMia7/SUW02Q7Ajkf2ZDZf7fWIoj0q/IchYZEKkrF8Wb minecraft@cookie.nya.vodka"
    ];
  };

}

