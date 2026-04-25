{ ... }:

{
  imports = [
    ../../../common/lxc.nix
    ../../../common/prometheus-exporter.nix

    ./paperless-ngx.nix
  ];
}

