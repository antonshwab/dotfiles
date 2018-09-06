VPF := tmp/ansible-vault-password

ansible-deps-install:
	ansible-galaxy install -r requirements.yml

setup:
	ansible-playbook main.yml -i local -vv -K

setup-all:
	ansible-playbook main.yml -i local -vv -K

setup-dotfiles:
	ansible-playbook main.yml -i local -vv -K --tags "dotfiles, emacs"



# ansible-playbook main.yml -i inventory -K --tags "dotfiles,homebrew"
