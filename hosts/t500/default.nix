{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../common
    ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  networking.hostName = "t500"; # Define your hostname.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  time.timeZone = "Europe/Berlin";

  services.xserver.enable = true;
  services.xserver.windowManager.i3 = {
    enable = true;
    extraPackages = with pkgs; [
      dmenu 
      i3status
      i3blocks
      networkmanagerapplet
      rofi
    ];
  };
 
  services.xserver.xkb.layout = "eu";

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  programs.ssh.extraConfig = ''
    Host git.proxima-centauri.lsdevcloud.net
        PreferredAuthentications publickey
	IdentityFile ~/.ssh/gitkey
  '';

  #programs.git = {
    #enable = true;
    #config = {
      #user.name = "lsqc";
      #user.email = "lsqc@nya.vodka";
#
      #gpg.format = "ssh";
#
      #user.signingKey = "/home/lsqc/.ssh/gitkey";
      #commit.gpgsign = true;
    #};
  #};
  #
  users.users.lsqc = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      alacritty
      librewolf

      signal-desktop
      wireguard-tools
      betterlockscreen
      nerd-fonts.comic-shanns-mono

      traceroute
      dig
      feh

      marp-cli
 
      sl
      keepassxc
      nfs-utils
      clang
      rustc

      inkscape
      gimp
      libreoffice
  #    tree
    ];
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment = {
    systemPackages = with pkgs; [
      neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
      wget
      hyfetch
      pkgs.xorg.xinit
    ];
  
    shellAliases = {
      neofetch = "hyfetch";
    };

    variables = {
      EDITOR = "nvim";
      BROWSER = "librewolf";
      TERMINAL= "alacritty";
    };
  };

  fonts.packages = with pkgs; [ dejavu_fonts ];

  system.stateVersion = "25.11"; # Did you read the comment?

}

