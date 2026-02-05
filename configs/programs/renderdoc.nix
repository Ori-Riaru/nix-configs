{pkgs, ...}: {
  environment.systemPackages = with pkgs; [renderdoc];
}
