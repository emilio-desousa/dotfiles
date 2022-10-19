if status is-interactive
    # Commands to run in interactive sessions can go here
end
status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source
set -gx PYENV_VIRTUALENV_DISABLE_PROMPT 1
alias g="git"



# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/emiliodesousa/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/Users/emiliodesousa/Downloads/google-cloud-sdk/path.fish.inc'; end
