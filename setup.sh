log() {
    local content=$1
    local type=${2:-0}
    local colors=( "\e[32m" "\e[33m" "\e[31m" "\e[31m" )
    local labels=( "[INFO]" "[WARN]" "[ERROR]" "[EXIT]" )

    echo -e "${colors[$type]}${labels[$type]}\e[0m - $content"
}

ask_and_execute() {
    local prompt_message=$1
    local setup_function=$2

    while true; do
        read -p "$(echo -e "\e[34m$prompt_message?\e[0m (y/n/q): ")" yn
        case ${yn,,} in
            y*) $setup_function; return 0 ;;
            n*) log "Skipping" 1; return 1 ;;
            q*) log "Exiting the program." 3; exit 0 ;;
            *) log "Invalid input, please enter y, n, or q." 2 ;;
        esac
    done
}

make_links() {
    ln -fns ~/dotfiles/.zshrc ~/.zshrc
}

install_packages() {
    sudo pacman -S --needed - < package.list
}

ask_and_execute "Run make_links" make_links
ask_and_execute "Run install_packages" install_packages