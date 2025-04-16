{ pkgs, ... }: {
  languages.python.enable = true;
  languages.python.venv.enable = true;
  packages = with pkgs; [ 
    zlib
    # Python optional version
  ];
}
