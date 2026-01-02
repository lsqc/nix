{ ... }: {
  services.prometheus = {
    enable = true;
    port = 9090;
    exporters = {
      node = {
        enable = true;
        enabledCollectors = [
          "ethtool"
          "sysctl"
          "netdev"
          "filesystem"
          "systemd"
          "processes"
          "os"
          "netstat"
          "netclass"
        ];
        port = 9092;
      };
    };
  };

  networking.firewall.allowedTCPPorts = [ 9092 ];

}
