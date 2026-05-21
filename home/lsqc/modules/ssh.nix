{ ... }:

{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "*" = {
        identityFile = [
          "~/.ssh/id_ed25519_sk"
          "~/.ssh/id_ed25519_sk2"
          "~/.ssh/id_ed25519"
        ];
      };
    };
  };
}
