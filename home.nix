#home.nix
{ config, pkgs, lib, ... }:
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
 
  # allow use of pkgs.unstable (definitely will probably break stuff tho)
  imports = [ ./overlays.nix ];
 
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "dan";
  home.homeDirectory = "/home/dan";
 
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "22.11"; # Please read the comment before changing.
 
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello
 
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
 
    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      
      vadimcn.vscode-lldb
      matklad.rust-analyzer
      ms-vscode.hexeditor
      ms-vscode-remote.remote-ssh
      ms-vsliveshare.vsliveshare
      ms-python.vscode-pylance
      arrterian.nix-env-selector
      vscodevim.vim
    ];
    userSettings = {
      "workbench.colorTheme" = "Default Dark+";
      "rust-analyzer.procMacro.enable" = false;
      "rust-analyzer.procMacro.attributes.enable" = false;
      "editor.inlineSuggest.enabled"= true;
      "workbench.sideBar.location"= "right";
    };
  };
 
 
}