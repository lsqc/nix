{ lib, ... }: {
  options.host = lib.mkOption {
    type = lib.types.str;
    default = "generic";
  };
}

