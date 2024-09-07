{
  description = "Personal NixOS configuration flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
  in {
    # Available through 'nixos-rebuild --flake .#your-hostname'
    nixosConfigurations = {
      thinkpad-t143 = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [ ./nixos/configuration.nix ];
      };
    };

    # Available through 'home-manager --flake .#your-username@your-hostname'
    homeConfigurations = {
      "xac@m" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [ ./home-manager/home.nix ];
      };
    };
  };
}
