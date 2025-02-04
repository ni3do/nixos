{ vars, ... }:

{
  # Add sudo by fingerprint
  security.pam.enableSudoTouchIdAuth = true;

  system = {
    startup.chime = false;
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = true;
    };
    defaults = {
      NSGlobalDomain = {
        AppleShowAllExtensions = true;
        ApplePressAndHoldEnabled = false;
        KeyRepeat = 1;
        InitialKeyRepeat = 15;
        "AppleICUForce24HourTime" = true;
        "com.apple.trackpad.scaling" = 3.0;
        "com.apple.mouse.tapBehavior" = 1;
        "com.apple.sound.beep.volume" = 0.0;
        "com.apple.sound.beep.feedback" = 0;
        # Hide Menu bar
        "_HIHideMenuBar" = true;
      };
      dock = {
        appswitcher-all-displays = true;
        autohide = true;
        autohide-delay = 0.0;
        autohide-time-modifier = 0.15;
        orientation = "bottom";
        tilesize = 44;
        launchanim = false;
        minimize-to-application = true;
        show-process-indicators = true;
        show-recents = false;
        persistent-apps = [];
        persistent-others = ["/Users/simon/Downloads"];
        expose-animation-duration = 0.2;
        expose-group-apps = true;
        wvous-bl-corner = 1;
        wvous-br-corner = 4;
        wvous-tl-corner = 1;
        wvous-tr-corner = 12;
        mru-spaces = false;
      };
      finder = {
        _FXShowPosixPathInTitle = false;
        _FXSortFoldersFirst = true;
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        CreateDesktop = false;
        FXDefaultSearchScope = "SCcf";
        FXEnableExtensionChangeWarning = false;
        FXPreferredViewStyle = "Nlsv";
        QuitMenuItem = false;
        ShowPathbar = true;
        ShowStatusBar = true;
      };
      LaunchServices = {
        LSQuarantine = false;
      };
      screencapture = {
        disable-shadow = true;
        target = "clipboard";
      };
    };
  };
}
