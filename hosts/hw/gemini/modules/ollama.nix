{ config, lib, pkgs, ...}:

{
  # required for cuda shit
  nixpkgs.config.allowUnfree = true;

  services.open-webui = {
    enable = true;
    host = "0.0.0.0";
    port = 8080;
  };

  services.ollama = {
    enable = true;
    host = "0.0.0.0";
#    acceleration = "vulkan";

    loadModels = [ "llama2-uncensored" "deepseek-r1:1.5b" ];
  };
}
