# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  # imports =
  #   [ # Include the results of the hardware scan.
  #     ./hardware-configuration.nix
  #     <home-manager/nixos>
  #   ];

  # Bootloader.
  boot.loader.systemd-boot = {
    enable = true;
    memtest86.enable = true; # enable memtest in boot menu or not.
    configurationLimit = 10; # maximum number of generations in boot menu.
  };

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.utf8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.utf8";
    LC_IDENTIFICATION = "de_DE.utf8";
    LC_MEASUREMENT = "de_DE.utf8";
    LC_MONETARY = "de_DE.utf8";
    LC_NAME = "de_DE.utf8";
    LC_NUMERIC = "de_DE.utf8";
    LC_PAPER = "de_DE.utf8";
    LC_TELEPHONE = "de_DE.utf8";
    LC_TIME = "de_DE.utf8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "de";
    xkbVariant = "";
  };

  # Configure console keymap
  console.keyMap = "de";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

#########################

  # packages installed
  environment.systemPackages = with pkgs; [

    # cli programs
    trash-cli
    tldr
    git
    curl
    wget
    tldr
    tree
    ranger
    htop
    neofetch
    fzf
    fd
    tmux
    nmap
    wl-clipboard # clipboard for wayland compatible with nvim
    xclip
    ncdu
    edir # batch renamer with vim
    zoxide # autojump type
    atool # archiving tool
    killall
    # neovim
    crow-translate # both translate apps
    translate-shell # both translate apps
    smartmontools
    speedtest-cli
    ripgrep
    hdparm
    dig # nslookup type thing
    usbutils # lsusb
    lshw # hardware list
    lm_sensors # temps
    gcc # compiler
    unzip
    distrobox 

    # programming
    nodejs
    R
    vscode
    lua 

    # LSPs
    nodePackages.prettier
    nodePackages.eslint



    # gui apps
    jellyfin-media-player
    qbittorrent
    foliate
    tdesktop # telegram
    signal-desktop
    mullvad-vpn
    chromium
    mpv
    libreoffice
    okular
    calibre
    kitty

    # gnome
    gnome.gnome-tweaks
    gnome.gnome-terminal
    gnome.geary
    #gnome-extension-manager
    gnomeExtensions.appindicator

  ];

  # enable podman for distrobox
  virtualisation.podman.enable = true;
  # and docker
  # virtualisation.docker.enable = true;

  # mullvad vpn
  services.mullvad-vpn.enable = true;

  # default shell is fish
  users.defaultUserShell = pkgs.fish;

  # enable flatpak
  services.flatpak.enable = true;

  # open ports for samba.
  services.samba.openFirewall = true;

  # enable syncthing
  services = {
      syncthing = {
          enable = true;
          user = "mo";
          dataDir = "/home/mo/Documents";    # Default folder for new synced folders
          configDir = "/home/mo/.config/syncthing";   # Folder for Syncthing's settings and keys
      };
  };

  # configure fontconfig. Defaults are fine, that's why nothing is defined. Not sure this is even necessary?
  fonts.fontconfig = {
    enable = true;
  };

  # garbage collect stuff
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

# programs.neovim = {
#   vimAlias = true;
#   viAlias = true;
#   defaultEditor = true;
# };

}
