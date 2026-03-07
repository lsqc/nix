{ ... }:

{
  imports = [

    ../../../../common/lxc.nix

    ./bind.nix
    ../bind-common.nix
    ../prometheus.nix
  ];
}
