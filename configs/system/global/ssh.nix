{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    sshfs
  ];
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };
}
