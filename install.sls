#
# ZSH Installation w/ Oh-My-Zsh
#

chris_zsh_git_install:
  pkg:
    - installed
    - name: git

chris_zsh_install:
  pkg:
    - installed
    - name: zsh

chris_clone_oh_my_zsh:
  git:
    - latest
    - name: git://github.com/robbyrussell/oh-my-zsh.git
    - target: /home/vagrant/.oh-my-zsh
    - require
      - pkg: chris_zsh_git_install
