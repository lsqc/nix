{
  services.ntfy-sh = {
    enable = true;
    settings = {
      base-url = "https://ntfy.lab.nya.vodka";
      listen-http = "0.0.0.0:80";
    };
  };
}
