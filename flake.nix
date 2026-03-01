{
  description = "System flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

   home-manager = {
   url = "github:nix-community/home-manager";
   inputs.nixpkgs.follows = "nixpkgs";


};
  };
 
  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
   nixosConfigurations.pokemon = nixpkgs.lib.nixosSystem {
  system = "x86_64-linux";
 specialArgs = { inherit inputs; };
  modules = [
  ./configuration.nix
  home-manager.nixosModules.home-manager
{
home-manager.useGlobalPkgs = true;
home-manager.useUserPackages = true;
home-manager.users.ranger = import ./home.nix;




}
  ];
  };
};
}
