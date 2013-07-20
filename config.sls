#
# ZSH Config
#

chris_zsh_config:
  file:
    - managed
    - name: /home/vagrant/.zshrc
    - user: vagrant
    - group: vagrant
    - mode: 755
    - source: salt://chris_zsh/files/.zshrc

chris_zsh_set_default_shell:
  cmd:
    - run
    - name: "chsh -s /usr/bin/zsh vagrant"
    - require:
      - pkg: chris_zsh_install
    - unless: "grep -E '^vagrant.+:/usr/bin/zsh$' /etc/passwd"
 
chris_zsh_theme:
  file
    - managed:
    - name: "/home/vagrant/.oh-my-zsh/themes/chris.zsh-theme"
    - user: vagrant
    - group: vagrant
    - source: 'salt://chris_zsh/files/chris.zsh-theme'
    - require:
      - git: chris_clone_oh_my_zsh
