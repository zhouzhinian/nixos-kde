{ config, pkgs, ... }:
{
  home.username = "zhinian";
  home.homeDirectory = "/home/zhinian";
  home.packages = with pkgs;[
    fastfetch
    splayer
    dracula-theme
    dracula-icon-theme
    mint-cursor-themes
    tokyonight-gtk-theme
  ];
  programs.home-manager.enable = true;
  home.stateVersion = "26.05";
}
