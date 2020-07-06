#!/bin/bash -e

basedir="$HOME/workspace/github.com/artheus/"
repodir="${basedir}/dotfiels"

mkdir -p $basedir 
cd $basedir

if [ ! -d $repodir ]; then
    echo "# git clone github.com/artheus/dotfiels.git"
    git clone https://github.com/artheus/dotfiels.git
fi

echo "# i3 config"
mkdir -p $HOME/.config/{i3,i3status}
i3conffile="${HOME}/.config/i3/config"
i3statfile="${HOME}/.config/i3status/config"

[[ -f $i3conffile || -L $i3conffile ]] && rm $i3conffile
ln -s "${repodir}/dotfiels/i3/config" $i3conffile

[[ -f $i3statfile || -L $i3statfile ]] && rm $i3statfile
ln -s "${repodir}/dotfiels/i3/status_config" $i3statfile

echo "# zsh config"
zshrcfile="${HOME}/.zshrc"
[[ -f $zshrcfile || -L $zshrcfile ]] && rm $zshrcfile
ln -s "${repodir}/zsh/zshrc" $zshrcfile

echo "# X config"
xdefaultsfile="${HOME}/.Xdefaults"
xmodmapfile="${HOME}/.Xmodmap"
[[ -f $xdefaultsfile || -L $xdefaultsfile ]] && rm $xdefaultsfile
[[ -f $xmodmapfile || -L $xmodmapfile ]] && rm $xmodmapfile
ln -s "${repodir}/X/Xdefaults" $xdefaultsfile
ln -s "${repodir}/X/Xmodmap" $xmodmapfile

echo "# git config"
gitconfigfile="${HOME}/.gitconfig"
[[ -f $gitconfigfile || -L $gitconfigfile ]] && rm $gitconfigfile
ln -s "${repodir}/git/gitconfig" $gitconfigfile

echo -e "\n¤ Done ¤"