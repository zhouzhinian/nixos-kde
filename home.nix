{ config, pkgs, ... }:
{
  home.username = "zhinian";
  home.homeDirectory = "/home/zhinian";
  home.packages = with pkgs;[
    fastfetch
  ];
  programs.home-manager.enable = true;
  home.stateVersion = "26.05";
}
