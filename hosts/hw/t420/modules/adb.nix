{ ... }:

{
  programs.adb.enable = true;
  users.users.lsqc.extraGroups = [ "adbusers" ];
}
