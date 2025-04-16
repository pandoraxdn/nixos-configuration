self: super: {
  neofetch = super.neofetch.override { this = self.neofetch; } // {
    pkgs = super.neofetch.pkgs // {
      pg_repack = super.neofetch.pkgs.pg_repack.overrideAttrs (_: {
        name = "neofetch 7.1.0";
        src = self.fetchzip {
          url = "https://github.com/dylanaraps/neofetch/archive/refs/tags/7.1.0.tar.gz";
          sha256 = "17k6hq9xaax87yz79j773qyigm4fwk8z4zh5cyp6z0sxnwfqxxw5";
        };
      });
    };
  };
}
