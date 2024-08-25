{ config, pkgs, ... }:

{
  # 注意修改这里的用户名与用户目录
  home.username = "leesum";
  home.homeDirectory = "/home/leesum";
  # 也可以在这里ln文件到用户目录，或者直接text写文件到用户目录
  # 通过 home.packages 安装一些常用的软件
  # 这些软件将仅在当前用户下可用，不会影响系统级别的配置
  # 建议将所有 GUI 软件，以及与 OS 关系不大的 CLI 软件，都通过 home.packages 安装 这里就安装了一个 neofetch
  home.packages = with pkgs; [
    neofetch
    zsh
    neovim
    (microsoft-edge.override { commandLineArgs = "--enable-wayland-ime"; })
    (vscode.override { commandLineArgs = "--enable-wayland-ime"; }).fhs
    jetbrains-toolbox
    feishu
    gtkwave
    (qq.override { commandLineArgs = "--enable-wayland-ime"; })
    snipaste
    wpsoffice-cn
devbox 
 ];
  programs.git = {
    enable = true;
    userName = "leesum";
    userEmail = "leesum1@qq.com";
  };
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch";
    };
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "extract"
        "sudo"
        "z"
      ];
      custom = "/etc/nixos/zsh-custom";
      theme = "powerlevel10k/powerlevel10k";
    };

    initExtra = "[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh";
    plugins = [
      #     {
      #       name = "powerlevel10k";
      #       src = pkgs.zsh-powerlevel10k;
      #       file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      #     }
      #  {
      #    name = "extract";
      #    file = "extract.plugin.zsh";
      #    src = pkgs.fetchFromGitHub {
      #      owner = "le0me55i";
      #      repo = "zsh-extract";
      #      rev = "1";
      #      sha256 = "sha256-XG9cJuQHAodyd7BrgryC/MiPV1Ch9jK6TvAN+y13uwI=";
      #    };

      #  }
    ];
  };

  home.stateVersion = "24.05";
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
