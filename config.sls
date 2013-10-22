#!stateconf yaml . jinja

#
# ZSH Config
#

# Variables

{% set directories = [
  "zshrc.after.d",
  "zshrc.before.d"
] %}

{% set before = [
  "exports.zsh"
] %}

{% set after = [
  "autoenv.zsh",
  "aliases.zsh"
] %}

# Directories


{% for directory in directories %}
.{{ directory }}:
  file:
    - directory
    - name: /home/vagrant/.{{ directory }}
    - user: vagrant
    - group: vagrant
    - mode: 755
{% endfor %}

# Configuration Files

.zshrc:
  file:
    - managed
    - name: /home/vagrant/.zshrc
    - user: vagrant
    - group: vagrant
    - mode: 755
    - source: salt://local_zsh/files/.zshrc
    - require:
      - pkg: .install::zsh

.theme:
  file:
    - managed
    - name: /home/vagrant/.oh-my-zsh/themes/chris.zsh-theme
    - user: vagrant
    - group: vagrant
    - source: 'salt://local_zsh/files/chris.zsh-theme'
    - require:
      - git: .install::oh_my_zsh

# Before

{% for file in before %}
.{{ file }}:
  file:
    - managed
    - name: /home/vagrant/.zshrc.before.d/{{ file }}
    - source: salt://local_zsh/files/{{ file }}
    - user: vagrant
    - group: vagrant
    - mode: 755
    - require:
      - file: .zshrc.before.d
{% endfor %}

# After

{% for file in after %}
.{{ file }}:
  file:
    - managed
    - name: /home/vagrant/.zshrc.after.d/{{ file }}
    - source: salt://local_zsh/files/{{ file }}
    - user: vagrant
    - group: vagrant
    - mode: 755
    - require:
      - file: .zshrc.after.d
{% endfor %}
