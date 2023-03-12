default: list

list:
  @just --list

install $TARGET='aws':

todo:
  @echo "$todo"

config:
  @which ansible > /dev/null \
  && ANSIBLE_LOCALHOST_WARNING=False \
    ANSIBLE_INVENTORY_UNPARSED_WARNING=False \
    ansible-playbook ansible/docker-remote-dev-playbook.yml \
  || echo "Ansible not found. You may need to install it via brew, pip, or your OS package manager"