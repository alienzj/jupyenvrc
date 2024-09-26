# Reproducible computing with jupyter and flake on NixOS

```bash
git clone https://github.com/alienzj/jupyenvrc

cd jupyenvrc
mkdir -p workspace
cd workspace
ln -s /path/to/projects
cd ..

nix develop
nix run
```
