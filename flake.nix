{
  description = "A simple memcached benchmark";

  outputs = { self, nixpkgs }: {

    packages.x86_64-linux.mcb =
      let pkgs = nixpkgs.legacyPackages.x86_64-linux;
      in with pkgs ; stdenv.mkDerivation {
        name = "mcb";
        version = "0.1";
        src = ./.;
        buildPhase = ''
          gcc -O3 mcb.c -o mcb -lpthread
        '';
        installPhase = ''
          mkdir -p $out/bin
          cp mcb $out/bin/
        '';
      };
    defaultPackage.x86_64-linux = self.packages.x86_64-linux.mcb;
  };
}
