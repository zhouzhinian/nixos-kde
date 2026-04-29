{ inputs, config, lib, pkgs, ... }: {
   environment.systemPackages = with pkgs; [
   vlc
   papirus-icon-theme
   mint-cursor-themes
   dracula-icon-theme
   dracula-theme
   qbittorrent-enhanced
   tokyonight-gtk-theme
   thunderbird
   obs-studio
 #  sparkle
   splayer
   satty
   zed-editor
   github-desktop
  ];

}

