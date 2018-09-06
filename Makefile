VPF := tmp/ansible-vault-password

ansible-deps-install:
	ansible-galaxy install -r requirements.yml

setup:
	ansible-playbook main.yml -i local -vv -K

all: ansible-deps-install setup

# ansible-playbook main.yml -i inventory -K --tags "dotfiles,homebrew"
