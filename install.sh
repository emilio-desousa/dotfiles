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
    git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
    println "\nCloning Powerlevel10k"
    git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
}

install_plug_vim() {

    local PLUG_FILE="$HOME/.local/share/nvim/site/autoload/plug.vim"
    if [[ -f $PLUG_FILE ]]; then
	    println "\nPlug Vim is already installed"
        return 0
    fi

    println "\nInstalling Plug Vim"
    curl -fLo $PLUG_FILE --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
        && nvim +PlugInstall +qa
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
}

main
