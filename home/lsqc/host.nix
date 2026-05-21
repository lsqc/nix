{ lib, ... }: {
  options.host = lib.mkOption {
    type = lib.types.str;
    default = "generic";
  };

  options.theme = lib.mkOption {
    type = lib.types.submodule {
      options = {
        font = lib.mkOption {
          type = lib.types.submodule {
            options = {
              size = lib.mkOption {
                type = lib.types.int;
                default = 11;
              };
              family = lib.mkOption {
                type = lib.types.str;
                default = "Hasklug Nerd Font";
              };
            };
          };
        };
      };
    };
    default = { };
  };
}
