let
  # users
  lsqc =
    "ssh-ed25519 ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMe1eur6B43u8IZWoSeW0dEqC1+3vX8lMkmRxm5yFCuG";

  # systems
  immich =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDTiP3yLx64FJgzjiqMFYUtmtDneUFtri6VNxaYlR4zB";
in {
  "immich-db.age".publicKeys = [ lsqc immich ];

  "armored-secret.age" = {
    publicKeys = [ lsqc ];
    armor = true;
  };
}
