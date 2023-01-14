#!/bin/bash

println() {
    printf "$@\n"
}

install_dotfiles() {
    if [ ! -d ~/.dotfiles ]; then
        println "\nCloning Dotfiles"
        git clone https://github.com/emilio-desousa/dotfiles.git ~/.dotfiles || exit 1
        cd ~/.dotfiles git submodule update --init
    fi
}


link_dotfiles() {
    println "\nLinking config files"
    cd ~/.dotfiles
    for folder in conf zsh tmux 
    do
        stow $folder -vv
    done
}

install_font() {
    the_fonts_dir=fonts/
    echo "the_fonts_dir: $the_fonts_dir"

    find_command="find \"$the_fonts_dir\" \( -name '*.[o,t]tf' -or -name '*.pcf.gz' \) -type f -print0"

    if [[ `uname` == 'Darwin' ]]; then
      # MacOS
      font_dir="$HOME/Library/Fonts"
    else
      # Linux
      font_dir="$HOME/.local/share/fonts"
      mkdir -p $font_dir
    fi

    echo -e "Run: $find_command | xargs -0 -I % cp \"%\" \"$font_dir/\"\n"

    echo "Copying fonts..."
    # printing
    eval $find_command | xargs -0 -I %

    eval $find_command | xargs -0 -I % cp "%" "$font_dir/"

    if command -v fc-cache @>/dev/null ; then
        echo -e "\nResetting font cache, this may take a moment..."
        fc-cache -f $font_dir
    fi

    echo -e "\nAll fonts have been installed to $font_dir"
}

install_oh_my_zsh() {
    if [ -d ~/.oh-my-zsh ]; then
        println "${BLUE}\nOh My Zsh already installed"
        return 0
    fi

    println "\nCloning Oh My Zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 
    println "\nCloning Powerlevel10k"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
}

install_plug_vim() {

    local PACKER_FILE="~/.local/share/nvim/site/pack/packer/start/packer.nvim"
    if [[ -f $PACKER_FILE ]]; then
	    println "\nPacker Vim is already installed"
        return 0
    fi
	println "\nInstalling Packer"
	git clone --depth 1 https://github.com/wbthomason/packer.nvim $PACKER_FILE
}

install_plug_tmux() {
    if [ -d ~/.tmux ]; then
        println "Tmux Plugin Manager already installed"
        return 0
    fi
    println "Installing  Tmux Plugin Manager"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

    
}
install_kitty(){
	curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

}
change_shell() {
    if [[ $SHELL != "/bin/zsh" ]]; then
        println "Changing default shell to zsh..."
        chsh -s /bin/zsh
    fi
}

main() {
    install_dotfiles
    install_font
    link_dotfiles
    install_plug_vim
    change_shell 
    install_plug_tmux
}

main
