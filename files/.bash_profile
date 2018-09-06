if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi


function parse_git_branch {
   git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="\[\e[30;0m\]\u:[\w]\$(parse_git_branch)\\$ \n\[\e[0m\]"

export PATH="$HOME/.cargo/bin:$PATH"


# OPAM configuration
. /Users/antonshwab/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
