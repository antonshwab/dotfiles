VPF := tmp/ansible-vault-password

ansible-deps-install:
	ansible-galaxy install -r requirements.yml

setup-all:
	ansible-playbook main.yml -i local -vv -K --vault-password-file=$(VPF)

setup-emacs:
	ansible-playbook main.yml -i local -vv --tags "emacs"  --vault-password-file=$(VPF)

setup-dotfiles:
	ansible-playbook main.yml -i local -vv --tags "dotfiles"  --vault-password-file=$(VPF)

setup-mas:
	ansible-playbook main.yml -i local -vv -K --tags "mas" --vault-password-file=$(VPF)

setup-brew:
	ansible-playbook main.yml -i local -vv -K --tags "homebrew"  --vault-password-file=$(VPF)

setup-osx:
	ansible-playbook main.yml -i local -vv -K --tags "osx"  --vault-password-file=$(VPF)


ansible-vaults-encrypt:
	ansible-vault encrypt group_vars/all/vault.yml --vault-password-file=$(VPF)


# ansible-vaults-decrypt:
# 	ansible-vault decrypt group_vars/all/vault.yml --vault-password-file=$(VPF)


ansible-vaults-edit:
	ansible-vault edit group_vars/all/vault.yml --vault-password-file=$(VPF)
