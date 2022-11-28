# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../common.nix
      <home-manager/nixos>
    ];

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  # Enable swap on luks
  boot.initrd.luks.devices."luks-4fb27b52-aa61-4f10-b8bd-9cf5b25d933e".device = "/dev/disk/by-uuid/4fb27b52-aa61-4f10-b8bd-9cf5b25d933e";
  boot.initrd.luks.devices."luks-4fb27b52-aa61-4f10-b8bd-9cf5b25d933e".keyFile = "/crypto_keyfile.bin";

  networking.hostName = "x280"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.mo = {
    isNormalUser = true;
    description = "mo";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  packages here
    ];
  };

#########################

  # set kernel parameters
  boot.kernelParams = [ "i915.enable_psr=0" ];

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

    # xdg.configFile.fd = {
    #   source = ./.config/fd;
    #   recursive = true;
    # };


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
      text-scaling-factor = "1.25";
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
