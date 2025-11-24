{ ... }:

{
  fileSystems."/mnt/nya" = {
    device = "files.nya.vodka:~";
    fsType = "nfs";
    options = [ "nofail" ];
  };
}
