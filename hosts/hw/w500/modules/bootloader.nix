{ ... }:

{
  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
    enableCryptodisk = true;
  };
}
