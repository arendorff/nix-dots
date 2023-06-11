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

  # fix issue with syncthing by setting inotify sysctl settings
  boot.kernel.sysctl = { "fs.inotify.max_user_watches" = 204800; };

  # enable ntfs support
  boot.supportedFilesystems = [ "ntfs" ];


  networking.hostName = "corsair"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # services.xserver.windowManager.awesome.enable = true;
  services.xserver.windowManager.spectrwm.enable = true;
  services.xserver.windowManager.cwm.enable = true;
  # services.picom = {
    # enable = true;
    # shadow = true;
  # };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.mo = {
    isNormalUser = true;
    description = "mo";
    extraGroups = [ "i2c" "networkmanager" "wheel" ];
    packages = with pkgs; [
      # ddcutil stuff
      ddcutil
      # gnomeExtensions.display-ddc-brightness-volume
      gnomeExtensions.adjust-display-brightness
      # wm stuff
      dmenu
      alacritty
      lxappearance
      dunst
      # kitty
      firefox-wayland
      gnome.gnome-boxes
      qmk
      qmk-udev-rules
      mangohud
      distrobox
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
  networking.firewall.allowedTCPPorts = [ 55738 ];
  networking.firewall.allowedUDPPorts = [ 55738 ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

#########################

# enable udev rules for qmk
services.udev.packages = [ pkgs.qmk-udev-rules ];

# printer driver enable
services.printing.enable = true;
services.printing.drivers = [ pkgs.brlaser ];

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

  # virtualization stuff
  virtualisation.libvirtd.enable = true;
  virtualisation.podman.enable = true;

  # home manager config
  home-manager.users.mo = { pkgs, ... }: {

    home.stateVersion = "22.05";

	home.packages = with pkgs; [
	];

    programs.neovim = {
      enable = true;
      # defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      # plugins = with pkgs.vimPlugins; [
      #   nvim-treesitter.withAllGrammars
      #   base16-vim
      #   # loremipsum
      #   vim-speeddating
      #   vim-repeat
      #   tabular
      #   vim-commentary
      #   vim-surround
      #   vim-fish
      #   vim-nix
      #   # use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
      #   nvim-colorizer-lua
      #   telescope-nvim
      #   plenary-nvim # needed for telescope I think
      #   nvim-lspconfig

    # # -- Autocompletion
    # # {'hrsh7th/nvim-cmp'},         -- Required
    # # {'hrsh7th/cmp-nvim-lsp'},     -- Required
    # # {'hrsh7th/cmp-buffer'},       -- Optional
    # # {'hrsh7th/cmp-path'},         -- Optional
    # # {'saadparwaiz1/cmp_luasnip'}, -- Optional
    # # {'hrsh7th/cmp-nvim-lua'},     -- Optional

    # # -- Snippets
    # # {'L3MON4D3/LuaSnip'},             -- Required
    # # {'rafamadriz/friendly-snippets'}, -- Optional
  # # }
      # ];
      # extraConfig = ''

      #   lua << EOF
      #   local lspconfig = require('lspconfig')
      #   -- lspconfig.pyright.setup {}
      #   lspconfig.eslint.setup {}
      #   lspconfig.lua_ls.setup {}
      #   EOF

      #   luafile ~/Documents/dots/common/.config/nvim/after/plugin/treesitter.lua
      #   luafile ~/Documents/dots/common/.config/nvim/lua/settings.lua
      #   luafile ~/Documents/dots/common/.config/nvim/lua/keybinds.lua
      #   luafile ~/Documents/dots/common/.config/nvim/lua/leader.lua
      #   source ~/Documents/dots/common/.config/nvim/lua/autocmds.vim
      #   source ~/Documents/dots/common/.config/nvim/lua/abbr.lua
      # '';

# #       extraPackages = with pkgs.unstable; [
      # extraPackages = with pkgs; [
      #   # Essentials
      #   nodePackages.npm
      #   nodePackages.neovim

      #   # # Python
      #   # (python3.withPackages (ps: with ps; [
      #   #   setuptools # Required by pylama for some reason
      #   #   pylama
      #   #   black
      #   #   isort
      #   #   yamllint
      #   #   debugpy
      #   # ]))
      #   # nodePackages.pyright

      #   # Lua
      #   pkgs.sumneko-lua-language-server
      #   selene

      #   # Nix
      #   statix
      #   nixpkgs-fmt
      #   nil

      #   # C, C++
      #   clang-tools
      #   # pkgs.cppcheck

      #   # Shell scripting
      #   shfmt
      #   shellcheck
      #   shellharden

      #   # JavaScript (tsserver is not working)
      #   nodePackages.prettier
      #   nodePackages.eslint
      #   # nodePackages.typescript
      #   # nodePackages.typescript-language-server

      #   # # Go
      #   # go
      #   # gopls
      #   # golangci-lint
      #   # delve

      #   # Additional
      #   nodePackages.bash-language-server
      #   nodePackages.yaml-language-server
      #   # nodePackages.dockerfile-language-server-nodejs
      #   # nodePackages.vscode-json-languageserver
      #   # nodePackages.markdownlint-cli
      #   # taplo-cli
      #   # texlab
      #   # codespell
      #   # gitlint
      #   # terraform-ls

      #   # Telescope dependencies
      #   ripgrep
      #   fd
      # ];
    }; 
  
     programs.git = {
       enable = true;
       userEmail = "mhenschel@mailbox.org";
       userName = "arendorff";
     };

    dconf.settings."org/gnome/desktop/interface" = {
      clock-show-weekday = true;
      # font-antialiasing = "rgba";
      # show-battery-percentage = true;
      # tap-to-click = true;
      # two-finger-scrolling-enabled = true;
      font-hinting = "slight";
      monospace-font-name = "Source Code Pro 14";
      # text-scaling-factor = "1.25";
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

};

}
