{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "github.com".proxyCommand = "ssh -W %h:%p kumo";
    };
  };
}
