{ ... }:

{
  services.grafana = {
    enable = true;

    settings = {
      server = {
        root_url = "https://grafana.pc.nya.vodka";
        domain = "grafana.pc.nya.vodka";
        http_port = 3000;
        http_addr = "::";

      };
      analytics.reporting_enabled = false;
    };
  };
}
