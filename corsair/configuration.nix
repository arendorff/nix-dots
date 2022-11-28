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

  networking.hostName = "corsair"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # services.xserver.windowManager.awesome.enable = true;
  services.xserver.windowManager.spectrwm.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.mo = {
    isNormalUser = true;
    description = "mo";
    extraGroups = [ "i2c" "networkmanager" "wheel" ];
    packages = with pkgs; [
      # ddcutil stuff
      ddcutil
      gnomeExtensions.display-ddc-brightness-volume
      # wm stuff
      dmenu
      alacritty
      lxappearance
      dunst
      kitty
      firefox-wayland
    ];
  };

  # create i2c groups for ddcutil
  users.groups.i2c.gid = null;
  # create udev rules for ddcutil
  # sudo cp /run/current-system/sw/share/ddcutil/data/45-ddcutil-i2c.rules /etc/udev/rules.d
  # setting udev rules with nix instead
  services.udev.extraRules = "KERNEL==\"i2c-[0-9]*\", GROUP=\"i2c\", MODE=\"0660\"\n";

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

#########################

# latest kernel
boot.kernelPackages = pkgs.linuxPackages_latest;

fonts.fonts = with pkgs; [
  fira-code
  fira-code-symbols
];

  # corectrl
  programs.corectrl = {
    enable = true;
    gpuOverclock = {
      ppfeaturemask = "0xffffffff";
      enable = true;
    };
  };

  # install steam
  programs.steam.enable = true;

  # add kernel modules
  boot.kernelModules = [ "i2c-dev" ];

  # home manager config
  home-manager.users.mo = { pkgs, ... }: {

    home.stateVersion = "22.05";

	home.packages = with pkgs; [
	];

     programs.git = {
       enable = true;
       userEmail = "mhenschel@mailbox.org";
       userName = "arendorff";
     };

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

## Laptop specific
# dconf write /org/gnome/desktop/input-sources/xkb-options "['altwin:swap_alt_win']"

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

   };

}
