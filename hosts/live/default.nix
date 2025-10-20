{ config, lib, pkgs, ...}:

{
  imports = 
    [
      ../../common/users.nix
    ];

  # use faster compression
  isoImage.squashfsCompression = "gzip -Xcompression-level 1";

  isoImage.makeEfiBootable = true;
  isoImage.makeUsbBootable = true;

  # start ssh service on boot
  systemd.services.sshd.wantedBy = pkgs.lib.mkForce [ "multi-user.target" ];

}
