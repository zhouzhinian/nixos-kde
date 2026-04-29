{ config, pkgs, lib, ... }: {
  # 输入法配置（Fcitx5）
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
      kdePackages.fcitx5-configtool
      fcitx5-rime
      fcitx5-tokyonight
              
   ];
   fcitx5.waylandFrontend = true;
  };

  # 中文字体优化
  fonts = {
  packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.adwaita-mono
    cascadia-code
    noto-fonts 
    noto-fonts-cjk-sans    # 思源黑体 (无衬线)
    noto-fonts-cjk-serif   # 思源宋体 (衬线)
    wqy_zenhei
    wqy_microhei    
    adwaita-fonts
    ];
 };
}
