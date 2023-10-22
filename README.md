# dotfiles
dotfiles for my personal use.

## How to use
### Initial Setting
All you need to set up mac is to execute following commmands.
```
git clone https://github.com/wkb8s/dotfiles.git
```
```
cd dotfiles && make init
```
```
git remote set-url origin git@github.com:wkb8s/dotfiles.git
```
### Update & Clean up
By executing following commmands, you can
- update & upgrade all formulas and applications
- clean up unnecessary things
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


## Settings
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

