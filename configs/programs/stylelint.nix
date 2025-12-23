{
  pkgs,
  lib,
  config,
  ...
}: {
  home.packages = with pkgs; [
    nodejs
    stylelint
    
  ];

  # Install packages globally
  home.sessionVariables = {
    NPM_CONFIG_PREFIX = "${config.home.homeDirectory}/.npm-global";
    NODE_PATH = "${config.home.homeDirectory}/.npm-global/lib/node_modules";
  };

  home.sessionPath = [
    "${config.home.homeDirectory}/.npm-global/bin"
  ];

  home.activation.installGlobalNpmPackages = lib.hm.dag.entryAfter ["writeBoundary"] ''
    export NPM_CONFIG_PREFIX="${config.home.homeDirectory}/.npm-global"

    # Check and install each package individually
    ${pkgs.nodejs}/bin/npm list -g stylelint &>/dev/null || \
      ${pkgs.nodejs}/bin/npm install -g stylelint

    ${pkgs.nodejs}/bin/npm list -g stylelint-order &>/dev/null || \
      ${pkgs.nodejs}/bin/npm install -g stylelint-order

    ${pkgs.nodejs}/bin/npm list -g stylelint-config-clean-order &>/dev/null || \
      ${pkgs.nodejs}/bin/npm install -g stylelint-config-clean-order

    ${pkgs.nodejs}/bin/npm list -g stylelint-config-standard &>/dev/null || \
      ${pkgs.nodejs}/bin/npm install -g stylelint-config-standard
  '';

  # Generate config file
  home.file.".stylelintrc.json".text = builtins.toJSON {
    plugins = ["stylelint-order"];
    extends = [
      "stylelint-config-standard"
      "stylelint-config-clean-order"
    ];
  };
}
