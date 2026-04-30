{ config, lib, pkgs, ... }:

{
  imports =
    [
    ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos"; # Define your hostname.

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;
 
  console.keyMap = "us";

  services.xserver.xkb.layout = "cn";

  services.desktopManager.plasma6.enable = true;
  services.displayManager.plasma-login-manager.enable = true;
  # Set your time zone.
  time.timeZone = "Asia/Shanghai";
  # Select internationalisation properties.
  i18n = {
    defaultLocale = "zh_CN.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "zh_CN.UTF-8";
      LC_IDENTIFICATION = "zh_CN.UTF-8";
      LC_MEASUREMENT = "zh_CN.UTF-8";
      LC_MONETARY = "zh_CN.UTF-8";
      LC_NAME = "zh_CN.UTF-8";
      LC_NUMERIC = "zh_CN.UTF-8";
      LC_PAPER = "zh_CN.UTF-8";
      LC_TELEPHONE = "zh_CN.UTF-8";
      LC_TIME = "zh_CN.UTF-8";
   };
   supportedLocales = [ "zh_CN.UTF-8/UTF-8" "en_US.UTF-8/UTF-8" ];
  };
  # Enable sound.
   services.pulseaudio.enable = false;
  # OR
   services.pipewire = {
     enable = true;
     pulse.enable = true;
   };

  # --- 6. 用户与安全 ---
  users.users.zhinian = {
    isNormalUser = true;
    description = "周治年";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "qemu" "kvm" "docker" "incus-admin"]; 
  };

   # programs.firefox.enable = true;

   environment.systemPackages = with pkgs; [
    git wget ripgrep jq yq-go eza fzf which file gnused zstd gnupg aria2 
    tree zip xz unzip p7zip helix fastfetch yazi
   ];

   programs.mtr.enable = true;
   programs.gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
   };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
   services.openssh.enable = true;

  system.stateVersion = "26.05"; # Did you read the comment?

  nix.settings = {
  substituters = [
    "https://mirrors.ustc.edu.cn/nix-channels/store"     # 中科大（可优先）
    "https://mirror.sjtu.edu.cn/nix-channels/store"     
    "https://cache.nixos.org/"
  ];
  trusted-public-keys = [
    "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
  ];
  experimental-features = [ "nix-command" "flakes" ];
 };
  nixpkgs.config.allowUnfree = true;
  # 将默认编辑器设置为 helix
  environment.variables.EDITOR = "helix";
 
  services.flatpak.enable = true;
   
  programs.clash-verge.enable = true;

      # 开启图形加速支持 
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      nvidia-vaapi-driver
    ];
  };

}


