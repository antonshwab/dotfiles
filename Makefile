VPF := tmp/ansible-vault-password

ansible-deps-install:
	ansible-galaxy install -r requirements.yml

setup:
	ansible-playbook main.yml -i local -vv -K

setup-all:
	ansible-playbook main.yml -i local -vv -K

setup-dotfiles:
	ansible-playbook main.yml -i local -vv -K --tags "dotfiles, emacs"

setup-mas:
	ansible-playbook main.yml -i local -vv -K --tags "mas"

setup-brew:
	ansible-playbook main.yml -i local -vv -K --tags "homebrew"

setup-osx:
	ansible-playbook main.yml -i local -vv -K --tags "osx"


ansible-vaults-encrypt:
	ansible-vault encrypt group_vars/all/vault.yml --vault-password-file=$(VPF)


# ansible-vaults-decrypt:
# 	ansible-vault decrypt group_vars/all/vault.yml --vault-password-file=$(VPF)


ansible-vaults-edit:
	ansible-vault edit group_vars/all/vault.yml --vault-password-file=$(VPF)
