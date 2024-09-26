{
  description = "A Reproducible Computing Environment with Jupyter and NixOS";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    supportedSystems = [ "x86_64-linux" ];
    eachSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f rec {
      inherit system;
      pkgs = import nixpkgs { inherit system; };
    });
  in
  {
    # use them via `nix develop .#xxx` or `direnv allow`
    devShells = eachSystem ({pkgs, ...}: rec {
      default = bioenv;
      bioenv = pkgs.mkShell {
        packages = with pkgs; [
          python312
	  python312Packages.jupyterlab
	  python312Packages.pandas
	  python312Packages.numpy
	  python312Packages.biopython
        ];

	#packages = [
        #  (pkgs.python3.withPackages (python-pkgs: with python-pkgs; [
        #  # select Python packages here
        #    pandas
        #    requests
        #  ]))
        #];

      };
    });

    # use them via `nix run .#xxx`
    apps = eachSystem ({system, pkgs, ...}: rec {
      default = jupyter;

      jupyter = {
        # TODO: change this script to your own app entry
        type = "app";
        program = "${pkgs.writeShellScript "jupyter-lab" ''
          jupyter lab ./workspace
        ''}";
      };
    });
  };
}
