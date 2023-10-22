# dotfiles
dotfiles for my personal use.

## How to use
All you need to set up mac is to execute following commmands.
```
git clone https://github.com/wkb8s/dotfiles.git
```
```
cd dotfiles && make
```
```
git remote set-url origin git@github.com:wkb8s/dotfiles.git
```
From the next time on, only the following commands need to be executed
```
make
```

## Tools
For example, following tools are configurated automatically.

### Terminal
- Alacritty
- zsh
- tmux + tpm

### Editor
- Neovim + vim-plug

### System Preference
available in mac

### Keybinds
- Karabiner-element

### Window management
- yabai
- skhd

### Development tool / application management
- Homebrew


## Manual settings
### ssh
In 1Password
```
(Developer) -> (SSH Agent)
```

### vim plugins
```
:PlugInstall
```

### tmux plugins
```
(prefix) + I
```

### System Settings
#### reduce motion
#### Bluetooth
automatically connected after setting up Apple ID

### Vivaldi
#### hide tool bar
```
(option) + (command) + P
```

#### enable CSS modifications
```
vivaldi://experiments/
```

### AtCoder

```
acc login
oj login https://atcoder.jp/home
```

