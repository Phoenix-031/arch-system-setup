#!/bin/bash

echo "Configuring git..."
echo "Enter git username"
read USER
DEFAULT_EMAIL="$USER@users.noreply.github.com"
read -p "Write your git email [Press enter to accept the private email $DEFAULT_EMAIL]: " EMAIL
EMAIL="${EMAIL:-${DEFAULT_EMAIL}}"

echo "Configuring global user name and email..."
git config --global user.name "$USER"
git config --global user.email "$EMAIL"

echo "Configuring global aliases..."
git config --global alias.c 'commit -m'
git config --global alias.st status
git config --global alias.sw switch
git config --global alias.rf reflog
git config --global alias.br branch
git config --global alias.co checkout
git config --global alias.last 'log -1 HEAD --stat'
git config --global alias.sub "submodule update --remote --merge"
git config --global alias.sth stash
git config --global alias.sthl 'stash list --pretty=format:"%C(yellow)%h %>(14)%Cgreen%cr %C(blue)%<(12)%an %Creset%s"'
git config --global alias.d diff
git config --global alias.ds 'diff --staged'
git config --global alias.l 'log --pretty=format:"%C(yellow)%h %>(14)%Cgreen%cr %C(blue)%<(12)%an %Creset%s"'
git config --global alias.ll 'log --pretty=format:"%C(yellow)%h %>(14)%Cgreen%cr %C(blue)%<(12)%an %Creset%s" --stat'
git config --global alias.lg 'log --graph --pretty=format:"%C(yellow)%h %>(14)%Cgreen%cr %C(blue)%<(12)%an %Creset%s" --stat'
git config --global alias puo 'pull origin'
git config --global gl 'config  --global --list'
git config --global dv 'difftool -t vimdiff -t'
git config --global credential.helper 'cache --timeout=36000'

read -r -p "Do you want to add ssh credentials for git? [y/n] " RESP
RESP=${RESP,,}    # tolower (only works with /bin/bash)

CHECK_KEY_ED_EXISTS="$HOME/.ssh/id_ed25519.pub"
if [[ $RESP =~ ^(yes|y)$ ]] && ! test -f "$CHECK_KEY_ED_EXISTS"
then
    echo "Configuring git ssh access..."
    ssh-keygen -t ed25519 -C "$EMAIL"
    echo "This is your public key. To activate it in github, got to settings, SHH and GPG keys, New SSH key, and enter the following key:"
    cat ~/.ssh/id_ed25519.pub
    echo -e "\nTo work with the ssh key, you have to clone all your repos with ssh instead of https. For example, for this repo you will have to use the url: git@github.com:miguelgfierro/scripts.git"
elif [[ $RESP =~ ^(yes|y)$ ]] && test -f "$CHECK_KEY_ED_EXISTS"
then
    echo "You have already ssh-key. To activate it in github, got to settings, SHH and GPG keys, New SSH key, and enter the following key:"
    cat ~/.ssh/id_ed25519.pub
fi

if [ "$(uname)" == "Darwin" ]; then # Mac OS X platform  
	echo "Setting autocompletion"
	AUTOCOMPLETION_URL="https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash"
	AUTOCOMPLETION_PATH=/opt/local/etc/bash_completion.d
	AUTOCOMPLETION_SCRIPT=git-completion.bash 
	sudo mkdir -p $AUTOCOMPLETION_PATH
	sudo curl  -o $AUTOCOMPLETION_PATH/$AUTOCOMPLETION_SCRIPT $AUTOCOMPLETION_URL
	source $AUTOCOMPLETION_PATH/$AUTOCOMPLETION_SCRIPT
	echo "source $AUTOCOMPLETION_PATH/$AUTOCOMPLETION_SCRIPT" >> ~/.bash_profile
fi
echo ""
echo "git configured"
