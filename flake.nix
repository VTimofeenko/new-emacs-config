{
  description = "Description for the project";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    devshell.url = "github:numtide/devshell";
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [ inputs.devshell.flakeModule ];
      systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];
      perSystem = { config, self', inputs', pkgs, system, ... }: {
        formatter = pkgs.nixpkgs-fmt;
        packages =
          let
            myEmacs = pkgs.emacs29;
            # TODO: sqlite support? Imagemagick support? Other stuff?
            inherit (pkgs.emacsPackagesFor myEmacs) emacsWithPackages;
          in
          {
            default = emacsWithPackages (epkgs: with epkgs.melpaPackages; [
              modus-themes
              evil
              which-key
              helpful
            ]);
          };
      };
      flake = { };
    };
}
