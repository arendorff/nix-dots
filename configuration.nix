# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      <home-manager/nixos>
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  # Enable swap on luks
  boot.initrd.luks.devices."luks-4fb27b52-aa61-4f10-b8bd-9cf5b25d933e".device = "/dev/disk/by-uuid/4fb27b52-aa61-4f10-b8bd-9cf5b25d933e";
  boot.initrd.luks.devices."luks-4fb27b52-aa61-4f10-b8bd-9cf5b25d933e".keyFile = "/crypto_keyfile.bin";

  networking.hostName = "x280"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

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
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.mo = {
    isNormalUser = true;
    description = "mo";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  packages here
    ];
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

  # List services that you want to enable:

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

  # set kernel parameters
  boot.kernelParams = [ "i915.enable_psr=0" ];

  # packages installed
  environment.systemPackages = with pkgs; [

    # cli programs
    trash-cli
    tldr
    git
    curl
    wget
    tldr
    neovim
    tree
    ranger
    htop
    neofetch
    fzf
    fd
    tmux
    nmap
    wl-clipboard # clipboard for wayland compatible with nvim
    distrobox
    ncdu
    edir # batch renamer with vim
    zoxide # autojump type
    atool # archiving tool

    # gui apps
    jellyfin-media-player
    qbittorrent
    foliate
    tdesktop # telegram
    signal-desktop
    mullvad-vpn

    # gnome
    gnome.gnome-tweaks
    gnome.gnome-terminal
    gnome.geary
    gnome-extension-manager
    gnomeExtensions.appindicator

    # themes
    adw-gtk3
  ];

  # enable podman
  virtualisation.podman.enable = true;

  # mullvad vpn
  services.mullvad-vpn.enable = true;

  # default shell is fish
  users.defaultUserShell = pkgs.fish;

  # enable flatpak
  services.flatpak.enable = true;

  # install steam
  programs.steam.enable = true;

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


  home-manager.users.mo = { pkgs, ... }: {

  home.stateVersion = "22.05";

    home.packages = with pkgs; [


    ];

    programs.git = {
      enable = true;
      userEmail = "mhenschel@mailbox.org";
      userName = "arendorff";
    };

    # xdg.configFile.fish = {
    #   source = ./.config/fish;
    #   recursive = true;
    # };

    # xdg.configFile.nvim = {
    #   source = ./.config/nvim;
    #   recursive = true;
    # };

    xdg.configFile.fd = {
      source = ./.config/fd;
      recursive = true;
    };


    # xdg.configFile."i3blocks/config".source = ./i3blocks.conf;
    # home.file.".gdbinit".text = ''
    #   set auto-load safe-path /nix/store
    # '';

    dconf.settings."org/gnome/desktop/interface" = {
      clock-show-weekday = true;
      font-antialiasing = "rgba";
      show-battery-percentage = true;
      tap-to-click = true;
      two-finger-scrolling-enabled = true;
      font-hinting = "slight";
      monospace-font-name = "Source Code Pro 14";
    };

    dconf.settings."org/gnome/desktop/input-sources" = {
      show-all-sources = true;
    };

    dconf.settings."org/gnome/desktop/wm/preferences" = {
      resize-with-right-button = true;
    };

    dconf.settings."org/gnome/mutter" = {
      center-new-windows = true;
      dynamic-workspaces = false;
    };

# dconf write /org/gnome/desktop/input-sources/sources "[('xkb', 'de+neo_qwertz')]"
# # dconf write /org/gnome/desktop/input-sources/sources "[('xkb', 'de')]"

# # gnome search
# dconf write /org/gnome/desktop/search-providers/disabled "['org.gnome.Contacts.desktop', 'org.gnome.Boxes.desktop', 'org.gnome.Calculator.desktop', 'org.gnome.Calendar.desktop', 'org.gnome.Characters.desktop', 'org.gnome.Epiphany.desktop', 'org.gnome.Terminal.desktop', 'org.gnome.Software.desktop', 'org.gnome.Photos.desktop', 'firefox.desktop', 'org.gnome.clocks.desktop']"

# # gnome keybindings/shortcuts
# dconf write /org/gnome/desktop/wm/keybindings/close "['<Super>q']"
# dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-left "['<Shift><Super>h']"
# dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-right "['<Shift><Super>l']"
# dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-left "['<Super>h']"
# dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-right "['<Super>l']"
# dconf write /org/gnome/desktop/wm/keybindings/toggle-fullscreen "['<Shift><Super>f']"
# dconf write /org/gnome/desktop/wm/keybindings/toggle-maximized "['<Super>f']"

# dconf write /org/gnome/desktop/interface/gtk-theme "'adw-gtk3'"

# # nightlight
# dconf write /org/gnome/settings-daemon/plugins/color/night-light-enabled true
# dconf write /org/gnome/settings-daemon/plugins/color/night-light-last-coordinates "'(53.06901803988481, 8.8621750000000006)'"
# dconf write /org/gnome/settings-daemon/plugins/color/night-light-schedule-automatic false

## Laptop specific
# dconf write org/gnome/desktop/interface/text-scaling-factor "'1.25'"
# dconf write /org/gnome/desktop/input-sources/xkb-options "['altwin:swap_alt_win']"


  };

}
