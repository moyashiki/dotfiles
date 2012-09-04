## 重複したパスを登録しない。
typeset -U path
# http://www.clear-code.com/blog/2011/9/5.html
path=(# システム用
      /bin(N-/)
      # 自分用（--prefix=$HOME/localでインストールしたもの）
      $HOME/local/bin(N-/)
      # 自分用（gem install --user-installでインストールしたもの）
      ## 2012-01-07
      $HOME/.gem/ruby/*/bin(N-/)
      # rbenv用
      ## 2012-02-21
      $HOME/.rbenv/bin(N-/)
      # Debian GNU/Linux用
      /var/lib/gems/*/bin(N-/)
      # Solaris用
      /opt/csw/bin(N-/)
      /usr/sfw/bin(N-/)
      /usr/ccs/bin(N-/)
      # Cygwin用
      /cygdrive/c/meadow/bin(N-/)
      # システム用
      /usr/local/bin(N-/)
      /usr/bin(N-/)
      /usr/games(N-/))