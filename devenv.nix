{ pkgs, config, lib, ... }:

{
  packages = with pkgs; [
    python3
    poetry
  ];

  env.LD_LIBRARY_PATH = with pkgs;
    lib.makeLibraryPath ([
      SDL2
      SDL2_gfx
      SDL2_image
      SDL2_mixer
      SDL2_ttf
    ] ++ (lib.optionals pkgs.stdenv.isLinux [
      xorg.libX11
      xorg.libICE
      xorg.libXi
      xorg.libXScrnSaver
      xorg.libXcursor
      xorg.libXinerama
      xorg.libXext
      xorg.libXrandr
      xorg.libXxf86vm
    ]));

  enterShell = ''
    python -m venv ${config.env.DEVENV_STATE}/venv
    source ${config.env.DEVENV_STATE}/venv/bin/activate
    poetry install
  '';
}
