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
    # typescript
    ];
  };

#########################

  # set kernel parameters
  boot.kernelParams = [ "i915.enable_psr=0" ];

  # home manager
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
      #   nvim-colorizer-lua
      #   telescope-nvim
      #   plenary-nvim # needed for telescope I think

      #   # lsp 
      #   nvim-lspconfig

      #   # autocompletion 
      #   nvim-cmp
      #   cmp-nvim-lsp
      #   cmp-buffer
      #   cmp-cmdline
      #   cmp-path
      #   cmp_luasnip
      #   cmp-nvim-lua

      #   # snippets 
      #   luasnip
      #   friendly-snippets 

      # ];

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
      #   nodePackages.typescript-language-server

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


  };

}
