{
  lib,
  config,
  ...
}: let
  # Define options related to user icons.
  userOptions = with lib; {
    options.icon = mkOption {
      type = types.nullOr types.path; # Icon can be a path or null.
      default = null; # Default value for the icon option is null (no icon).
    };
  };

  # Create a list of user entries that have icons defined.
  userList = with lib;
    filter (entry: entry.icon != null) (
      mapAttrsToList (name: value: {
        inherit name; # Inherit the user name from the original configuration.
        inherit (value) icon; # Inherit the icon path from the user configuration.
      })
      config.users.users
    ); # Access user configuration from the main config.

  # Define a command to create a symbolic link for each user's icon in the AccountsService directory.
  createIconLink = entry: "ln -sfn '${entry.icon}' /var/lib/AccountsService/icons/${entry.name}\n";

  # Generate a list of commands for creating icon links for all users with icons.
  makeFacesCommands = map createIconLink userList;
in {
  options = {
    # Define the options for users, allowing the configuration of user icons.
    users.users = with lib;
    with types;
      mkOption {
        type = attrsOf (submodule userOptions); # Use the submodule containing user icon options.
      };
  };

  # Activation script to create the icons directory and set up the links during system activation.
  config.system.activationScripts.makeFacesDir = with lib; strings.concatStrings makeFacesCommands;
}
