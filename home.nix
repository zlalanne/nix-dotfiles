{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "zack";
  home.homeDirectory = "/home/zack";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Using home-manager on non Nix-OS
  targets.genericLinux.enable = true;

  home.packages = [
    # Command line utilities
    pkgs.aspell
    pkgs.htop
    pkgs.rsync

    # Fonts
    #pkgs.hack-font
  ];

  home.sessionVariables = {
    EDITOR = "vim";
    TERMINFO_DIRS = "${pkgs.kitty.terminfo.outPath}/share/terminfo";
  };

  fonts.fontconfig.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.bat = {
    enable = true;
    config = {
      theme = "Solarized (dark)";
    };
  };

  programs.kitty = {
    enable = true;
    theme = "Solarized Dark - Patched";
    #theme = "Solarized Dark";
    font = {
      name = "Hack";
      package = pkgs.hack-font;
    };
    extraConfig = "enable_audio_bell no";
  };

  programs.exa = {
    enable = true;
    enableAliases = true;
  };

  programs.fzf = {
    enable = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = false;
    enableAutosuggestions = true;
    oh-my-zsh = {
      enable = true;
      plugins = ["git" "rsync"];
      theme = "ys";
    };
  };

  programs.git = {
    enable = true;
    userName = "Zack Lalanne";
    userEmail = "zack.lalanne@gmail.com";
    extraConfig = {
      color.ui = true;
    };
  };

  programs.neovim = {
    enable = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      # Syntax / Language Support
      vim-nix

      # UI
      vim-gitgutter
      vim-airline
    ];
    extraConfig = ''
      syntax enable
      set background=dark
    '';
  };
}
