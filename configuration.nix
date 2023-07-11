{ config, pkgs, ...}:

{
    imports = [
        ./hardware-configuration.nix
    ];

    boot.loader.grub.enable = true;
    boot.loader.grub.device = "/dev/vda";
    boot.loader.grub.useOSProber = true;

    networking.hostName = "nixos";
    networking.networkmanager.enable = true;
    
    programs.nm-applet.enable = true;
    nix.settings.experimental-features = [ "nix-command flakes" ];
    
    time.timeZone = "America/Chicago";
    time.locale.default = "en_US.UTF-8";
    
    i18n.extraLocaleSettings = {
        LC_ADDRESS = "en_US.UTF-8";
        LC_IDENTIFICATION = "en_US.UTF-8";
        LC_MEASUREMENT = "en_US.UTF-8";
        LC_MONETARY = "en_US.UTF-8";
        LC_NAME = "en_US.UTF-8";
        LC_NUMERIC = "en_US.UTF-8";
        LC_PAPER = "en_US.UTF-8";
        LC_TELEPHONE = "en_US.UTF-8";
        LC_TIME = "en_US.UTF-8";
    };

    services.xserver.enable = true;
    services.xserver.displayManager.lightdm.enable = true;
    
    services.xserver = {
        layout = "us";
        xkbVariant = "";
    };

    services.printing.enable = true;

    sound.enable = true;
    hardware.pulseaudio.enable = false;
    hardware.pulseaudio.enable = false;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
    };

    users.users.dan = {
        isNormalUser = true;
        extraGroups = [ "wheel" "networkmanager" ];
        packages = with pkgs; [
            vim
        ];
    };

    services.xserver.displayManager.autoLogin.enable = true;
    services.xserver.displayManager.autoLogin.user = "dan";

    nixpkgs.config.allowUnfree = true;
    environment.systemPackages = with pkgs; [
        firefox
        wget
        openssh
    ];
    overlays.unstable.enable = true;
    services.openssh.enable = true;
    system.stateVersion = "22.11";
}