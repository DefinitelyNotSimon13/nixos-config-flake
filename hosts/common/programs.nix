{ pkgs, lib, ... }:
{
  programs = {
    zsh.enable = lib.mkDefault true;
    git = {
      enable = lib.mkDefault true;
      config = {
        init = {
          defaultBranch = "main";
        };
        credential = {
          credentialStore = "gpg";
          helper = "${pkgs.git-credential-manager}/bin/git-credential-manager";
        };
      };
    };

    gnupg.agent = {
      enable = lib.mkDefault true;
      enableSSHSupport = lib.mkDefault true;
      pinentryPackage = pkgs.pinentry-tty;
    };
  };
}
