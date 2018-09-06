VPF := tmp/ansible-vault-password

ansible-deps-install:
	ansible-galaxy install -r requirements.yml


ansible-setup:
	ansible-playbook main.yml -i inventory -K


# ansible-playbook main.yml -i inventory -K --tags "dotfiles,homebrew"

