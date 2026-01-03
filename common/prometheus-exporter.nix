{ ... }: {
  services.prometheus = {
    enable = true;
    port = 9090;
    exporters = {
      node = {
        enable = true;
        enabledCollectors = [
          "sysctl"

          "filesystem"
          "systemd"
          "processes"
          "pressure"
          "stat"

          "sockstat"
          "netstat"
          "netclass"
          "arp"
          "network_route"
          "netdev"
          "ethtool"
          "tcpstat"
          "ipvs"

          "cpu"
          "os"
          "swap"
          "meminfo"
        ];
        port = 9092;
      };
    };
  };

  networking.firewall.allowedTCPPorts = [ 9092 ];

}
