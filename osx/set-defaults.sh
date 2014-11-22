#!/bin/bash
# Sets reasonable OS X defaults.
#
# Strongly Based on the original ones from holman (https://github.com/holman/dotfiles/blob/master/osx/set-defaults.sh) and mathiasbynens (https://github.com/mathiasbynens/dotfiles/blob/master/.osx) .
#

while true; do
    echo "Do you wish to override current OS X' defaults? [y|n] "
    read yn
    case $yn in
        [y]* ) 
            echo "Defaults will be overriden";
            # Ask for the administrator password upfront
            echo "Admin permissions are required."
            sudo -v

            # Keep-alive: update existing `sudo` time stamp until `.osx` has finished
            while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

            ###############################################################################
            # General UI/UX                                                               #
            ###############################################################################

            echo "Tweaking general UI/UX"

            # Set computer name (as done via System Preferences -> Sharing)
            sudo /usr/sbin/scutil --set ComputerName "Llrt MacPro"
            sudo /usr/sbin/scutil --set HostName "llrt_macpro"
            sudo /usr/bin/defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "Llrt Macpro"

            # Menu bar: disable transparency
            defaults write NSGlobalDomain AppleEnableMenuBarTransparency -bool false

            # Menu bar: show remaining battery time (on pre-10.8); hide percentage
            defaults write com.apple.menuextra.battery ShowPercent -string "YES"
            defaults write com.apple.menuextra.battery ShowTime -string "NO"

            # Menu bar: hide the useless Time Machine and Bluetooth icons
            defaults write com.apple.systemuiserver menuExtras -array "/System/Library/CoreServices/Menu Extras/Volume.menu" "/System/Library/CoreServices/Menu Extras/AirPort.menu" "/System/Library/CoreServices/Menu Extras/Battery.menu" "/System/Library/CoreServices/Menu Extras/Clock.menu"

            # Always show scrollbars
            defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

            # Disable opening and closing window animations
            defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

            # Increase window resize speed for Cocoa applications
            defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

            # Expand save panel by default
            defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

            # Expand print panel by default
            defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

            # Save to disk (not to iCloud) by default
            defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

            # Automatically quit printer app once the print jobs complete
            defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

            # Disable the “Are you sure you want to open this application?” dialog
            defaults write com.apple.LaunchServices LSQuarantine -bool false

            # Display ASCII control characters using caret notation in standard text views
            # Try e.g. `cd /tmp; unidecode "\x{0000}" > cc.txt; open -e cc.txt`
            defaults write NSGlobalDomain NSTextShowsControlCharacters -bool true

            # Disable Resume system-wide
            defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

            # Disable automatic termination of inactive apps
            defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

            # Reveal IP address, hostname, OS version, etc. when clicking the clock
            # in the login window
            sudo /usr/bin/defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

            # Restart automatically if the computer freezes
            /usr/sbin/systemsetup -setrestartfreeze on

            # Never go into computer sleep mode
            /usr/sbin/systemsetup -setcomputersleep Off > /dev/null

            # Check for software updates daily, not just once per week
            defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

            ###############################################################################
            # Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
            ###############################################################################

            echo "Tweaking trackpad, mouse, keyboard, Bluetooth accessories and input"

            # Trackpad: swipe between pages with three fingers
            defaults write NSGlobalDomain AppleEnableSwipeNavigateWithScrolls -bool true
            defaults -currentHost write NSGlobalDomain com.apple.trackpad.threeFingerHorizSwipeGesture -int 1
            defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -int 1

            # Disable “natural” (Lion-style) scrolling
            defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

            # Increase sound quality for Bluetooth headphones/headsets
            defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

            # Enable full keyboard access for all controls
            # (e.g. enable Tab in modal dialogs)
            defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

            # Use scroll gesture with the Ctrl (^) modifier key to zoom
            defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
            defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144
            # Follow the keyboard focus while zoomed in
            defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true

            # Disable press-and-hold for keys in favor of key repeat
            defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

            # Set a blazingly fast keyboard repeat rate
            defaults write NSGlobalDomain KeyRepeat -int 0

            # Automatically illuminate built-in MacBook keyboard in low light
            defaults write com.apple.BezelServices kEnabled -bool true
            defaults write com.apple.BezelServices kDim -bool true
            # Adjust levels of brightness for the backlight
            defaults write com.apple.BezelServices kHigh -float 1 # default = 0.832
            defaults write com.apple.BezelServices kLow -float 0 # default = 0.766
            defaults write com.apple.BezelServices kHWMax -float 1 # default = 1
            defaults write com.apple.BezelServices kHWMin -float 0 # default = 0.048888
            # Turn off keyboard illumination when computer is not used for 1.5 minutes
            defaults write com.apple.BezelServices kDimTime -int 90

            # Set language and text formats
            # Note: if you’re in the US, replace `EUR` with `USD`, `Centimeters` with
            # `Inches`, and `true` with `false`.
            defaults write NSGlobalDomain AppleLanguages -array "en" "nl"
            defaults write NSGlobalDomain AppleLocale -string "en_GB@currency=EUR"
            defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
            defaults write NSGlobalDomain AppleMetricUnits -bool true

            # Set the timezone; see `systemsetup -listtimezones` for other values
            /usr/sbin/systemsetup -settimezone "Brazil/Sao Paulo" > /dev/null

            # Disable auto-correct
            defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

            ###############################################################################
            # Screen                                                                      #
            ###############################################################################

            echo "Tweaking screen"

            # Require password immediately after sleep or screen saver begins
            defaults write com.apple.screensaver askForPassword -int 1
            defaults write com.apple.screensaver askForPasswordDelay -int 0

            # Save screenshots to the desktop
            defaults write com.apple.screencapture location -string "$HOME/Desktop"

            # Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
            defaults write com.apple.screencapture type -string "png"

            # Disable shadow in screenshots
            defaults write com.apple.screencapture disable-shadow -bool true

            # Enable subpixel font rendering on non-Apple LCDs
            defaults write NSGlobalDomain AppleFontSmoothing -int 2

            # Enable HiDPI display modes (requires restart)
            sudo /usr/bin/defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true

            ###############################################################################
            # Finder                                                                      #
            ###############################################################################

            echo "Tweaking Finder"

            # Finder: allow quitting via ⌘ + Q; doing so will also hide desktop icons
            defaults write com.apple.finder QuitMenuItem -bool true

            # Finder: disable window animations and Get Info animations
            defaults write com.apple.finder DisableAllAnimations -bool true

            # Show only icons for servers and removable media on the desktop
            defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool dalse
            defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
            defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
            defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

            # Finder: show hidden files by default
            defaults write com.apple.finder AppleShowAllFiles -bool false

            # Finder: show all filename extensions
            defaults write NSGlobalDomain AppleShowAllExtensions -bool true

            # Finder: show status bar
            defaults write com.apple.finder ShowStatusBar -bool true

            # Finder: allow text selection in Quick Look
            defaults write com.apple.finder QLEnableTextSelection -bool true

            # Display full POSIX path as Finder window title
            defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

            # When performing a search, search the current folder by default
            defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

            # Disable the warning when changing a file extension
            defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

            # Avoid creating .DS_Store files on network volumes
            defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

            # Disable disk image verification
            defaults write com.apple.frameworks.diskimages skip-verify -bool true
            defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
            defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

            # Automatically open a new Finder window when a volume is mounted
            defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
            defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
            defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

            # Show item info below icons on the desktop and in other icon views
            /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
            /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
            /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist

            # Enable snap-to-grid for icons on the desktop and in other icon views
            /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
            /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
            /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

            # Increase grid spacing for icons on the desktop and in other icon views
            /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
            /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
            /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist

            # Set the size of icons on the desktop and in other icon views
            /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 50" ~/Library/Preferences/com.apple.finder.plist
            /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:iconSize 50" ~/Library/Preferences/com.apple.finder.plist
            /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 50" ~/Library/Preferences/com.apple.finder.plist

            # Use list view in all Finder windows by default
            # Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
            defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

            # Disable the warning before emptying the Trash
            defaults write com.apple.finder WarnOnEmptyTrash -bool false

            # Empty Trash securely by default
            defaults write com.apple.finder EmptyTrashSecurely -bool true

            # Enable AirDrop over Ethernet and on unsupported Macs running Lion
            defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

            # Show the ~/Library folder
            chflags nohidden ~/Library

            ###############################################################################
            # Dock & hot corners                                                          #
            ###############################################################################

            echo "Tweaking Dock & Hot Corners"

            # Enable highlight hover effect for the grid view of a stack (Dock)
            defaults write com.apple.dock mouse-over-hilte-stack -bool true

            # Set the icon size of Dock items to 36 pixels
            defaults write com.apple.dock tilesize -int 40

            # Enable spring loading for all Dock items
            defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool false

            # Show indicator lights for open applications in the Dock
            defaults write com.apple.dock show-process-indicators -bool true

            # Don’t animate opening applications from the Dock
            defaults write com.apple.dock launchanim -bool false

            # Speed up Mission Control animations
            defaults write com.apple.dock expose-animation-duration -float 0.1

            # Don’t group windows by application in Mission Control
            # (i.e. use the old Exposé behavior instead)
            defaults write com.apple.dock expose-group-by-app -bool false

            # Don’t show Dashboard as a Space
            defaults write com.apple.dock dashboard-in-overlay -bool true

            # Do not automatically hide and show the Dock
            defaults write com.apple.dock autohide -bool false

            # Make Dock icons of hidden applications translucent
            defaults write com.apple.dock showhidden ibool

            # Reset Launchpad
            find ~/Library/Application\ Support/Dock -name "*.db" -maxdepth 1 -delete


            # Hot corners
            # Bottom left screen corner -> Mision Control
            defaults write com.apple.dock wvous-bl-corner -int 2
            defaults write com.apple.dock wvous-bl-modifier -int 0
            # Bottom right screen corner -> Desktop
            defaults write com.apple.dock wvous-br-corner -int 4
            defaults write com.apple.dock wvous-br-modifier -int 0
            # Upper left screen corner -> Nothing
            defaults write com.apple.dock wvous-ul-corner -int 0
            defaults write com.apple.dock wvous-ul-modifier -int 0
            # Upper right screen corner -> Nothing
            defaults write com.apple.dock wvous-ur-corner -int 0
            defaults write com.apple.dock wvous-ur-modifier -int 0


            ###############################################################################
            # iTunes                                                                      #
            ###############################################################################

            echo "Tweaking iTunes"

            # Disable the iTunes store link arrows
            defaults write com.apple.iTunes show-store-link-arrows -bool false

            # Disable the Genius sidebar in iTunes
            defaults write com.apple.iTunes disableGeniusSidebar -bool true

            # Disable the Ping sidebar in iTunes
            defaults write com.apple.iTunes disablePingSidebar -bool true

            # Disable all the other Ping stuff in iTunes
            defaults write com.apple.iTunes disablePing -bool true

            # Disable radio stations in iTunes
            defaults write com.apple.iTunes disableRadio -bool true

            # Make ⌘ + F focus the search input in iTunes
            # To use these commands in another language, browse iTunes’s package contents,
            # open `Contents/Resources/your-language.lproj/Localizable.strings`, and look
            # for `kHiddenMenuItemTargetSearch`.
            defaults write com.apple.iTunes NSUserKeyEquivalents -dict-add "Target Search Field" "@F"

            ###############################################################################
            # Terminal                                                                    #
            ###############################################################################

            echo "Tweaking Terminal"

            # Only use UTF-8 in Terminal.app
            defaults write com.apple.terminal StringEncodings -array 4


            ###############################################################################
            # Address Book, Dashboard, iCal, TextEdit, and Disk Utility                   #
            ###############################################################################

            echo "Tweaking Address Book, Dashboard, iCal, TextEdit and Disk Utility"

            # Enable the debug menu in Address Book
            defaults write com.apple.addressbook ABShowDebugMenu -bool true

            # Enable Dashboard dev mode (allows keeping widgets on the desktop)
            defaults write com.apple.dashboard devmode -bool true

            # Enable the debug menu in iCal (pre-10.8)
            defaults write com.apple.iCal IncludeDebugMenu -bool true

            # Use plain text mode for new TextEdit documents
            defaults write com.apple.TextEdit RichText -int 0
            # Open and save files as UTF-8 in TextEdit
            defaults write com.apple.TextEdit PlainTextEncoding -int 4
            defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

            # Enable the debug menu in Disk Utility
            defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
            defaults write com.apple.DiskUtility advanced-image-options -bool true

            ###############################################################################
            # Google Chrome & Google Chrome Canary                                        #
            ###############################################################################

            echo "Tweaking Google Chrome & Google Chrome Canary"

            # Allow installing user scripts via GitHub or Userscripts.org
            defaults write com.google.Chrome ExtensionInstallSources -array "https://*.github.com/*" "http://userscripts.org/*"
            defaults write com.google.Chrome.canary ExtensionInstallSources -array "https://*.github.com/*" "http://userscripts.org/*"


            ###############################################################################
            # Kill affected applications                                                  #
            ###############################################################################

            echo "Kill affected applications"

            for app in "Address Book" "Calendar" "Contacts" "Dashboard" "Dock" "Finder" \
                    "Mail" "Safari" "SizeUp" "SystemUIServer" "Transmission" \
                        "Twitter" "iCal" "iTunes"; do
                killall "$app" > /dev/null 2>&1
            done
            echo "Done. Note that some of these changes require a logout/restart to take effect."

            break;;
        [n]* ) echo "No default overriden."; break;;
        * ) echo "Please answer yes ('y') or no ('n').";;
esac
done



