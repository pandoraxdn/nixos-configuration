{ stdenv ? import <nixpkgs> {} }:

let

  inherit (stdenv) pkgs mkShell;
  inherit (stdenv.lib) flatten;

in

mkShell rec {
  name = "venv";
  buildInputs =
    with pkgs;
    with python39Packages; [
      python39
      pip
      virtualenv
    ];

  shellHook = /* sh */ ''
    virtualenv --no-setuptools .venv
    source ./.venv/bin/activate
    unset PYTHONPATH
  '';
}
