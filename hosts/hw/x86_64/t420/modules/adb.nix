{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [ androidenv.androidPkgs.platform-tools ];
  users.users.lsqc.extraGroups = [ "adbusers" ];
}
