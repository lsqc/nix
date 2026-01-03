{ config, ... }: {
  services.prometheus = {
    enable = true;
    scrapeConfigs = [
      {
        job_name = "dns";
        static_configs = [{
          targets = [
            "dns-4.pc.ip.nya.vodka:9092"
            "dns-5.pc.ip.nya.vodka:9092"
            "dns-6.pc.ip.nya.vodka:9092"
          ];
        }];
      }
      {
        job_name = "prometheus";
        static_configs = [{ targets = [ "prometheus.pc.ip.nya.vodka:9092" ]; }];
      }
      {
        job_name = "git";
        static_configs = [{ targets = [ "hachi.pc.ip.nya.vodka:9092" ]; }];
      }
      {
        job_name = "torrent";
        static_configs = [{ targets = [ "torrent.pc.ip.nya.vodka:9092" ]; }];
      }
      {
        job_name = "hydra";
        static_configs = [{ targets = [ "hydra.pc.ip.nya.vodka:9092" ]; }];
      }
    ];
  };
}
