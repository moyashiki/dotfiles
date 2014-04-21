## 重複したパスを登録しない。
typeset -U path cdpath fpath
export PYTHONPATH="/usr/local/lib/python2.7/site-packages:$PYTHONPATH"
# #####
# alias
# #####
# Rails
alias r=rails
alias be="bundle exec"
# file operation
alias ls="ls -GF"
alias la="ls -a"
alias ll="ls -l"
alias du="du -h"
alias df="df -h"
alias g='git'
# sudo path
typeset -xT SUDO_PATH sudo_path
typeset -U sudo_path
#Java 文字化け対策
case "${OSTYPE}" in 
	darwin*)
		alias javac='javac -J-Dfile.encoding=UTF-8'
		alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
		;;
esac
# completions
fpath=(/usr/local/share/zsh-completions(N-/) $fpath)
# http://www.clear-code.com/blog/2011/9/5.html
path=( 		# Homebrew
		/usr/local/bin(N-/)
	  /usr/local/sbin(N-/)
		# システム用
    /bin(N-/)
	  #MacのPing
	  /sbin(N-/)
		# TeX Live
		/usr/texbin(N-/)
    # 自分用（--prefix=$HOME/localでインストールしたもの）
    $HOME/local/bin(N-/)
    # 自分用（gem install --user-installでインストールしたもの）
    ## 2012-01-07
    #$HOME/.gem/ruby/*/bin(N-/)
    # rbenv用
    ## 2012-02-21
    #$HOME/.rbenv/bin(N-/)
	  #$HOME/.rbenv/shims(N-/)
    # Debian GNU/Linux用
    /var/lib/gems/*/bin(N-/)
    # Solaris用
    /opt/csw/bin(N-/)
    /usr/sfw/bin(N-/)
    /usr/ccs/bin(N-/)
    # Cygwin用
    /cygdrive/c/meadow/bin(N-/)
    # システム用
    /usr/bin(N-/)
    /usr/games(N-/)
	  # Archlinux System
	  /usr/sbin(N-/) 
	  /sbin(N-/) 
	  /usr/local/sbin(N-/)
		)
# rvenv ref http://blog.takuyan.com/
if [ -d ${HOME}/.rbenv ] ; then
	export PATH="$HOME/.rbenv/shims:$PATH"
	eval "$(rbenv init -)"
fi
