with import <nixpkgs> {};

stdenv.mkDerivation rec {
  name = "env";
  buildInputs = [
    (idrisPackages.with-packages (with idrisPackages; [ (callPackage ./rolidris.nix {}) ]))
  ];
  shellHook = ''
  idris --execute ./result/libs/rolidris/Main.ibc
  '';
}
