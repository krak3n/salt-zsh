#
# ZSH Installation w/ Oh-My-Zsh
#

local_zsh_git_install:
  pkg:
    - installed
    - name: git

local_zsh_install:
  pkg:
    - installed
    - name: zsh

local_clone_oh_my_zsh:
  git.latest:
    - name: git://github.com/robbyrussell/oh-my-zsh.git
    - target: /home/vagrant/.oh-my-zsh
    - require:
      - pkg: local_zsh_git_install
