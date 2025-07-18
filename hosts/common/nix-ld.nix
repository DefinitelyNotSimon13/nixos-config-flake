{
  pkgs,
  ...
}:
{
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    libclang
    libpng
    libGL
    xorg.libX11
    libpulseaudio
    nss
  ];
}
