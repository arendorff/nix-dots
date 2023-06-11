# ranger function to change the directory 
function ranger-cd -w 'ranger' -d 'Automatically change the directory in fish after closing ranger'
    set -l tempfile (mktemp -t tmp.XXXXXX)

    ranger --choosedir=$tempfile $argv

    if [ -f $tempfile ]
        cd (cat $tempfile)
    end
    rm -f $tempfile
end

# ranger abbreviation
abbr r ranger-cd

# nix shit 
# Add fenv to path
# set fish_function_path $fish_function_path ~/dots-home-manager-fedora/plugin-foreign-env/functions
# Source Nix setup script
# fenv source ~/.nix-profile/etc/profile.d/nix.sh

# PATH
set PATH $HOME/Scripts $PATH
set PATH $HOME/Scripts/pomodoro/ $PATH
set PATH /opt/Mullvad\ VPN/ $PATH
set PATH /var/lib/flatpak/exports/bin $PATH

# set terminal
set TERM "xterm-256color"

# activate vim keybindings
fish_vi_key_bindings

# empty mode sympbol for vi mode
function fish_mode_prompt

end

# programs
abbr g 'git'
abbr gp 'git push -u origin main'
abbr gs 'git status'
abbr gpp 'git pull'
abbr ga 'git add'
abbr gc 'git commit -m "'
abbr R 'R --no-save --quiet'
abbr ytdl 'youtube-dl'
abbr scs 'sudo systemctl status'
abbr sce 'sudo systemctl enable'
abbr scd 'sudo systemctl disable'
abbr mv 'mv -v'
abbr cp 'cp -rv'
abbr mkdir 'mkdir -vp'
abbr rm 'rm -rv'

# jumping
abbr jh 'cd ~; ls -GFHh'
abbr jg 'cd ~/Games; ls -GFHh'
abbr jd 'cd ~/Downloads; ls -GFHh'
abbr jD 'cd ~/Documents; ls -GFHh'
abbr jp 'cd ~/Pictures; ls -GFHh'
abbr jc 'cd ~/.config; ls -GFHh'
abbr js 'cd ~/Scripts; tree'

function cs
cd $argv
ls -GFHh
end


# my public ip
abbr myip 'curl ipinfo.io/ip'

# config files
abbr vrc 'cd ~/.config/nvim; nvim .'
# abbr vrc 'nvim ~/Documents/dots/x280/.config/nvim/init.vim'
abbr frc 'nvim ~/.config/fish/config.fish'
abbr krc 'nvim ~/.config/kitty/kitty.conf'
# abbr frc 'nvim ~/Documents/dots/x280/.config/fish/config.fish'

# journal
abbr jj journal.fish
abbr jo 'nvim +normal\ G ~/Documents/todo/journal.txt'

# some more ls abbreviations
# abbr ls 'ls -GFHh'
abbr ls 'ls -GFHh -1'
abbr ll 'ls -lh'
abbr la 'ls -Alh'
abbr lm 'ls -t -1'

# vim to neovim
abbr v 'nvim'
abbr vim 'nvim'
abbr vi 'nvim'

# fedora dnf
abbr sdi "sudo dnf install"
abbr ds "dnf search"
abbr sdr "sudo dnf remove"
abbr sdu "sudo dnf update"
abbr update-system "sudo dnf update -y; flatpak update -y"

# define environment variables
set -U PASSWORD_STORE_DIR ~/Documents/.pass # this is for pass
set -U XDG_CONFIG_HOME /home/mo/.config
# set -U EDITOR /usr/bin/nvim
# set -U VISUAL /usr/bin/nvim

set -gx EDITOR "nvim"
set -gx VISUAL "nvim"

# define default fzf command for vim
set -U FZF_DEFAULT_COMMAND 'fd --hidden --type f --ignore-file ~/.config/fd/fdignore -a . .'

# fancy fzf for pacman
function fs
pacman -Slq | fzf -m --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S

end
# fancy fzf for pacman
function fai
pacman -Slq | fzf -m --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S
end

function ffy
yay -Slq | fzf -m --preview 'yay -Si {1}' | xargs -ro sudo pacman -S
end

# fzf pacman remove
function fr
pacman -Qq | fzf -m --preview 'pacman -Si {1}' | xargs -ro sudo pacman -Rns
end

# fzf pacman remove
function far
pacman -Qq | fzf -m --preview 'pacman -Si {1}' | xargs -ro sudo pacman -Rns
end

function fo
    simpleopen.fish
#~/Scripts/fileopen.fish (fd --hidden --type f --ignore-file ~/.config/fd/fdignore -a . ~ | fzf --header='Open file')
end

function fj
# cd (fd --hidden --type d --ignore-file ~/.config/fd/fdignore -a . ~ | fzf --header='Jump to location'); pwd; tree -L 1
cd (fd --type d --ignore-file ~/.config/fd/fdignore -a . ~ | fzf --header='Jump to location'); pwd; tree -L 1
end

function fja
cd (fd --hidden --type d --ignore-file ~/.config/fd/fdignore -a . / | fzf --header='Jump to location'); pwd; tree -L 1
end

# function cc
# cd (fd --hidden --type d --ignore-file ~/.config/fd/fdignore -a . ~ | fzf --header='Jump to location'); pwd; tree -L 1
# end

# function cc
#     cd $argv
#     tree -L 1 -C
# end

function fv
# nvim (fd --hidden --type f --ignore-file ~/.config/fd/fdignore -a . ~ | fzf --header='Open in Neovim')
fd --hidden --type f --ignore-file ~/.config/fd/fdignore -a . ~ | fzf --header='Open in Neovim' | xargs -ro nvim
end

function f.
# nvim (fd --hidden --type f --ignore-file ~/.config/fd/fdignore -a . ~ | fzf --header='Open in Neovim')
fd --hidden --type f --ignore-file ~/.config/fd/fdignore -a . . | fzf --header='Open in Neovim' | xargs -ro nvim
end

function fc
fd --hidden --type f -L -a . ~/.config | fzf --header='Open config files' | xargs -ro nvim
end

function fS
nvim (fd --hidden --type f --ignore-file ~/.config/fd/fdignore -a . ~/Scripts | fzf --header='Open scripts')
end

# flatpak abbreviations
abbr fps flatpak search
abbr fpi flatpak install
abbr fpr flatpak run
abbr fpu flatpak update

# date
abbr now 'date "+%H:%M %d.%m.%Y"'

# distrobox
abbr db distrobox
abbr dbe distrobox enter distrobox

# nixos
abbr nrs "sudo nixos-rebuild switch"
abbr nrsu "sudo nixos-rebuild switch --upgrade"
abbr nrb "sudo nixos-rebuild boot"
abbr nrbu "sudo nixos-rebuild boot --upgrade"
#abbr nrc "sudo nvim /etc/nixos/configuration.nix"
# abbr nrc "nvim /home/mo/Documents/dots/x280/configuration.nix"

# zoxide
zoxide init fish | source
abbr cd z
abbr j z
