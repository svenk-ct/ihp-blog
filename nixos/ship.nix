# Shipnix recommended settings
# IMPORTANT: These settings are here for ship-nix to function properly on your server
# Modify with care

{ config, pkgs, modulesPath, lib, ... }:
{
  nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes ca-derivations
    '';
    settings = {
      trusted-users = [ "root" "ship" "nix-ssh" ];
    };
  };

  programs.git.enable = true;
  programs.git.config = {
    advice.detachedHead = false;
  };

  services.openssh = {
    enable = true;
    # ship-nix uses SSH keys to gain access to the server
    # Manage permitted public keys in the `authorized_keys` file
    settings.PasswordAuthentication = false;
  };


  users.users.ship = {
    isNormalUser = true;
    extraGroups = [ "wheel" "nginx" ];
    # If you don't want public keys to live in the repo, you can remove the line below
    # ~/.ssh will be used instead and will not be checked into version control. 
    # Note that this requires you to manage SSH keys manually via SSH,
    # and your will need to manage authorized keys for root and ship user separately
    openssh.authorizedKeys.keyFiles = [ ./authorized_keys ];
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCiiS/nCHuREZGbVU2J0tGQOcCZ/lrOpHRSobPv/aUZF3N1T+BKp90p95C+8c/kHkgbKgsFgnNN0xXWJBPvDlpSDen9tkv59v3TqX8tx3EqNG/Tcc2P7atUqjOu3eBlE8NDUn+oiIrp6X+SZeyV/1kiGUCO6DrQR9YRPmrqDqDw54xcFnRoMT4ec/xBcdHP7/8rhYDohSEYmIwX/F+SiM0crpecIh6bqMZC3AfUQfHyHgCYfBCS3t2MAnBto5iSVn8lYjU8CZpiZFpfsbshEcGXaHRLthja8gbVwrXtlwGZEpjccbw31rELRKZh8mtBkdhmXEjrijfrST+FzmLkNge4lKroavDd/aLdNzTpoGxR/pJuHJdcmnJ3g4CFxjH6vvL/+YanbpmOKa+ZES76TR20GX8FfVoV/o8Kx5WIpRi7CT5aNoM12XO+Au6WUz5lkZX9iCbXRRK3CqF3cplSxE5YM+aGLjdXGFNtdoYZWNAK9Reb6XqR/SxeQS4jshNtCU0= ship@tite-ship
"
    ];
  };

  # Can be removed if you want authorized keys to only live on server, not in repository
  # Se note above for users.users.ship.openssh.authorizedKeys.keyFiles
  users.users.root.openssh.authorizedKeys.keyFiles = [ ./authorized_keys ];
  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCiiS/nCHuREZGbVU2J0tGQOcCZ/lrOpHRSobPv/aUZF3N1T+BKp90p95C+8c/kHkgbKgsFgnNN0xXWJBPvDlpSDen9tkv59v3TqX8tx3EqNG/Tcc2P7atUqjOu3eBlE8NDUn+oiIrp6X+SZeyV/1kiGUCO6DrQR9YRPmrqDqDw54xcFnRoMT4ec/xBcdHP7/8rhYDohSEYmIwX/F+SiM0crpecIh6bqMZC3AfUQfHyHgCYfBCS3t2MAnBto5iSVn8lYjU8CZpiZFpfsbshEcGXaHRLthja8gbVwrXtlwGZEpjccbw31rELRKZh8mtBkdhmXEjrijfrST+FzmLkNge4lKroavDd/aLdNzTpoGxR/pJuHJdcmnJ3g4CFxjH6vvL/+YanbpmOKa+ZES76TR20GX8FfVoV/o8Kx5WIpRi7CT5aNoM12XO+Au6WUz5lkZX9iCbXRRK3CqF3cplSxE5YM+aGLjdXGFNtdoYZWNAK9Reb6XqR/SxeQS4jshNtCU0= ship@tite-ship
"
  ];

  security.sudo.extraRules = [
    {
      users = [ "ship" ];
      commands = [
        {
          command = "ALL";
          options = [ "NOPASSWD" "SETENV" ];
        }
      ];
    }
  ];
}
