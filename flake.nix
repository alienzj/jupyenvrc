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
    nixpkgs.config.allowBroken = true;
    # use them via `nix develop .#xxx` or `direnv allow`
    devShells = eachSystem ({pkgs, ...}: rec {
      default = bioenv;
      bioenv = pkgs.mkShell {
        packages = with pkgs; [
          python311

	  python311Packages.jupyterlab

	  python311Packages.pandas
	  python311Packages.polars
	  python311Packages.numpy

	  python311Packages.seaborn
	  python311Packages.matplotlib
	  python311Packages.plotnine

	  python311Packages.scipy
	  python311Packages.scikit-learn
	  python311Packages.scikit-bio

	  python311Packages.biopython

	  python311Packages.lightgbm
	  python311Packages.xgboost
	  python311Packages.statsmodels

	  python311Packages.jax
          python311Packages.keras
	  python311Packages.torch
	  python311Packages.tensorflow
	  python311Packages.tensorboard
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
