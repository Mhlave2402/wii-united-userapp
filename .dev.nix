nix
    packages = [
      pkgs.nodejs_18 // or another version
      pkgs.cmake
      pkgs.clang
      pkgs.ninja
      pkgs.pkgconfig
    ];
