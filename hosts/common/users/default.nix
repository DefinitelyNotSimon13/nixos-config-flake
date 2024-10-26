{pkgs,...}:
{
    imports = [./simon.nix];

  users.defaultUserShell = pkgs.zsh;
}
