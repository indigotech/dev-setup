How to run?
-----------

```bash
curl -O https://raw.githubusercontent.com/indigotech/dev-setup/feature/half-setup/scripts/setup.sh && env bash setup.sh
```


What does this setup install?
-----------------------------

### osx-prep.sh
  - command-line-tools

### pip.sh
  - pip

### battleschool.sh
  - Battleschool
    - XCode
    - VMWare Fusion
    - Android Studio

### homebrew.sh
  - Homebrew
    - zsh
    - wget
    - heroku-toolbelt
    - git
    - git-extras
    - mongodb
  - Homebrew Cask
    - iterm2
    - java
    - zquartz
    - virtualbox
    - charles
    - mongohub

### rvm.sh
  - rvm
    - ruby
    - ruby gems
      - bundler
      - cocoapods

### nvm.sh
  - nvm
    - node

### ios-developer.sh
  - Taqtile developer keys

### oh-my-zsh.sh
  - oh-my-zsh


Manual steps
------------

### Remove git user from Keychain

  1. Open Keychain Access
  2. Filter for `Passwords` in the Category left menu
  3. Search for `github`
  4. Click on entry named `github.com` and check the if value the for `Account` is yours
  5. Delete this entry

### Remove scripts and battleschool folders

  1. Open Terminal or iTerm2
  2. Run `rm -rf ~/scripts ~/.battleschool`


### Add Taqtile Developer account to XCode

  1. Open XCode
  2. Open Preferences: `XCode` > `Preferences` or `⌘,`
  3. Select `Accounts` tab
  4. Add Taqtile Developer's account

### Add Charles license

  1. Open `Charles`
  2. Open Help: `Register Charles`
  3. Add License key


### Disable Guest Account

  1. Go to `System Preferences` > `Users & Groups`
  2. Unlock the padlock on the bottom
  3. Select `Guest User` on the left
  4. Uncheck `Allow guests to log in to this computer`
  5. Uncheck `Allow guest users to connect to shared folders`
  5. Lock the padlock


### Configure iCloud

  1. Go to `System Preferences` > `iCloud`
  2. Disable all services except `Find My Mac`


Next steps
----------

  1. Oh My ZSH install script runs `env zsh` in the end. It needs to find a way to skip that or finish the zsh proccess.
  2. The script still stops in some points asking for information. Idealliy it should run unattended.
  3. App Store apps need to be installed manually. Neither Homebrew Cask or Battleschool supports that.
  4. Check if everything was installed successfully in the end and show the errors if any.
