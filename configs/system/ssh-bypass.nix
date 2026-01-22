{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "github.com" = {
        hostname = "ssh.github.com";
        port = 443;
        user = "git";
      };
      "kumo" = {
        proxyCommand = "none";
      };
      "*" = {
        proxyCommand = "ssh -W %h:%p kumo";
      };
    };
  };
}
