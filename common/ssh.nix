{ lib, ... }:

{
  services.openssh = {
    enable = true;
    settings = {
      X11Forwarding = true;
      PermitRootLogin = "prohibit-password";
      PasswordAuthentication = lib.mkDefault false;
    };
  };
}
