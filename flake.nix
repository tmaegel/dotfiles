{
  description = "A minimal Nix flake setup";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux"; # Define the architecture
      pkgs = nixpkgs.legacyPackages.${system}; # Correctly access package set
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        nativeBuildInputs = with pkgs; [
          pre-commit
          nixfmt
          prettier
          shellcheck
          shfmt
        ];
      };
    };
}
