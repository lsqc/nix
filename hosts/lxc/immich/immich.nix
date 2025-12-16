{ ... }:

{
  services.immich = {
    enable = true;
    port = 3000;
    host = "0.0.0.0";
    openFirewall = true;

    # database = { enable = true; };

    machine-learning = { enable = true; };
  };
}
