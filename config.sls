#
# ZSH Config
#

local_zsh_config:
  file:
    - managed
    - name: /home/vagrant/.zshrc
    - user: vagrant
    - group: vagrant
    - mode: 755
    - source: salt://local_zsh/files/.zshrc

local_zsh_set_default_shell:
  cmd:
    - run
    - name: "chsh -s /usr/bin/zsh vagrant"
    - require:
      - pkg: local_zsh_install
    - unless: "grep -E '^vagrant.+:/usr/bin/zsh$' /etc/passwd"

local_zsh_theme:
  file:
    - managed
    - name: /home/vagrant/.oh-my-zsh/themes/chris.zsh-theme
    - user: vagrant
    - group: vagrant
    - source: 'salt://local_zsh/files/chris.zsh-theme'
    - require:
      - git: local_clone_oh_my_zsh
