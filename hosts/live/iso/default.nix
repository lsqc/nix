{ config, lib, pkgs, ... }:

{
  imports = [ ../../../common/users.nix ];

  system.stateVersion = "25.11";

  # use faster compression
  isoImage.squashfsCompression = "gzip -Xcompression-level 1";

  # uefi support
  isoImage.makeEfiBootable = true;
  isoImage.makeUsbBootable = true;

  # start ssh service on boot
  systemd.services.sshd.wantedBy = pkgs.lib.mkForce [ "multi-user.target" ];

}
