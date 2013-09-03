#!stateconf yaml . jinja

#
# ZSH Installation w/ Oh-My-Zsh
#

# Dependencies

.git:
  pkg:
    - installed

# Install ZShell

.zsh:
  pkg:
    - installed

# Clone oh-my-zsh

.oh_my_zsh:
  git.latest:
    - name: git://github.com/robbyrussell/oh-my-zsh.git
    - target: /home/vagrant/.oh-my-zsh
    - require:
      - pkg: .git
      - pkg: .zsh

# Set ZSH as default shell

.default_shell:
  cmd:
    - run
    - name: "chsh -s /usr/bin/zsh vagrant"
    - unless: "grep -E '^vagrant.+:/usr/bin/zsh$' /etc/passwd"
    - require:
      - pkg: .zsh
