{ ... }:

{

  networking.firewall.allowedTCPPorts = [ 22 3000 ];

  services = {

    paperless = {
      enable = true;
      address = "0.0.0.0";
      port = 3000;

      settings = {
        PAPERLESS_OCR_LANGUAGE = "deu+eng";
        PAPERLESS_OCR_USER_ARGS = {
          optimize = 1;
          pdfa_image_compression = "lossless";
        };
      };
    };
  };
}
