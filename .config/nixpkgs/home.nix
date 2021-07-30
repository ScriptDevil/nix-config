{ config, pkgs, ... }:


let unstablePkgs = import <unstable> {}; in 
{
  nixpkgs.config.allowUnfree = true;

  programs = {
    home-manager = {
      enable = true;
    }; 

    direnv = {
      enable = true;
      nix-direnv = {
        enable = true;
      };
      enableBashIntegration = true;
    };

    bash = {
      enable = true;
      profileExtra = ''
        source ~/.opam-init
      '';
    };

    firefox = {
      enable = true;
    };

    vscode = {
      enable = true;
    };

# Dev-tools
    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      withNodeJs = true;
      withPython3 = true;

      package = unstablePkgs.neovim-unwrapped;
      extraConfig = builtins.readFile ( ./init.vim );

      plugins = with unstablePkgs.vimPlugins; [
        base16-vim
        lightline-vim
        vim-nix
        fzf-vim
        vim-toml
        vim-yaml
        rust-vim
        emmet-vim
        coc-emmet
        vimwiki
        coc-nvim
        coc-tsserver
        coc-eslint
        coc-json
        coc-prettier
        coc-css
        coc-rust-analyzer
        vim-rooter
        vim-highlightedyank
      ];
    };

    git = {
      enable = true;
      userEmail = "scriptdevil@zoho.com";
      userName = "Ashok Gautham Jadatharan";
      aliases = {
        last = "log -1 HEAD";
      };
    };

    fzf = {
      enable = true;
      defaultCommand = "fd --type f";
    };

    tmux = {
      clock24 = true;
      sensibleOnTop = true;
      baseIndex = 1;
      escapeTime = 0;
      enable = true;
      extraConfig = builtins.readFile ( ./tmux.conf );
    };


# GUI tools
    alacritty = {
      enable = true;
      settings = {
        font.normal.family = "Fira Mono";
        font.size = 10;
        shell.program = "/run/current-system/sw/bin/bash"; 
      };
    };
  };

  home = {
    username = "scriptdevil";
    homeDirectory = "/home/scriptdevil";
    stateVersion = "21.03";

    packages = with pkgs; [
      ripgrep
      fd
      mosh
      wget
      python3
      unzip
      pandoc 
      plantuml
      feh
      mupdf
      openjdk
      graphviz
      imagemagick
      tree
      jq
      xclip
      fira-mono
      jetbrains-mono
      cascadia-code
      noto-fonts
    ];
  };
}
