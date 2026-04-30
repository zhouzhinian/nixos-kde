{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

};
  outputs = { self, nixpkgs, ... }@inputs:
  let
    system = "x86_64-linux";
    # 自动扫描 modules 目录下的所有 .nix 文件
    configDir = ./modules;
    generatedModules = builtins.map (file: configDir + "/${file}") 
      (builtins.filter (file: nixpkgs.lib.hasSuffix ".nix" file) 
        (builtins.attrNames (builtins.readDir configDir)));
  in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs; };
          modules = [
            ./configuration.nix
          ] ++ generatedModules;
        };
      };
}
