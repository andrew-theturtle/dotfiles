# !/bin/bash
#

DOTFILES_DIR="${HOME}/.dotfiles"

cd $DOTFILES_DIR

e_success() {
    printf "$(tput setaf 64)✓ %s$(tput sgr0)\n" "$@"
}

e_warning() {
    printf "$(tput setaf 136)! %s$(tput sgr0)\n" "$@"
}

seek_confirmation() {
    printf "\n"
    e_warning "$@"
    read -p "Continue? (y/n) " -n 1
    printf "\n"
}

is_confirmed() {
    if [[ "$REPLY" =~ ^[Yy]$ ]]; then
      return 0
    fi
    return 1
}

type_exists() {
    if [ $(type -P $1) ]; then
        return 0
    fi
    return 1
}

link() {
    # Force create/replace the symlink
    ln -fs "${DOTFILES_DIR}/${1}" "${HOME}/${2}"
}

#if ! type_exists 'zsh'; then
#    e_header "Installing zsh..."
#    sudo apt install zsh
#fi

mirrorfiles() {
    # Copy `.gitconfig`.
    # Any global git commands in `~/.bash_profile.local` will be written to
    # `.gitconfig`. This prevents them being committed to the repository.
    # rsync -avz --quiet "${DOTFILES_DIRECTORY}/.gitconfig"  "${HOME}/.gitconfig"

    # Force remove the vim directory if it's already there.
    if [ -e "${HOME}/.vim" ]; then
        rm -rf "${HOME}/.vim"
    fi

    # Create the necessary symbolic links between the `.dotfiles` and `HOME`
    link ".zshrc"       ".zshrc"
    link ".vimrc"       ".vimrc"
    link ".tmux.conf"   ".tmux.conf"
    link ".gitconfig"   ".gitconfig"
    link ".gitignore"   ".gitignore"
    link ".vim"         ".vim"
    link ".script"      ".script"

    e_success "Dotfiles update complete!"
}

seek_confirmation "Warning: This step may overwrite your existing dotfiles."

if is_confirmed; then
    mirrorfiles
    source ${HOME}/.zshrc
else
    printf "Aborting...\n"
    exit 1
fi

