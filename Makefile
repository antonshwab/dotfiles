VPF := tmp/ansible-vault-password

ansible-deps-install:
	ansible-galaxy install -r requirements.yml

setup-ansible:
	ansible-playbook setup-ansible.yml -i local -vv -K --vault-password-file=$(VPF)

setup-dotfiles:
	ansible-playbook dotfiles.yml -i local -vv --vault-password-file=$(VPF)

run-setup-osx:
	ansible-playbook osx.yml -i local -vv -K --vault-password-file=$(VPF)

setup-emacs:
	ansible-playbook emacs.yml -i local -vv --vault-password-file=$(VPF)

install-packages:
	ansible-playbook extra-packages.yml -i local -vv --vault-password-file=$(VPF)

setup-mas:
	ansible-playbook mas.yml -i local -vv -K --vault-password-file=$(VPF)

setup-brew:
	ansible-playbook homebrew.yml -i local -vv -K --vault-password-file=$(VPF)



ansible-vaults-encrypt:
	ansible-vault encrypt group_vars/all/vault.yml --vault-password-file=$(VPF)


# ansible-vaults-decrypt:
# 	ansible-vault decrypt group_vars/all/vault.yml --vault-password-file=$(VPF)


ansible-vaults-edit:
	ansible-vault edit group_vars/all/vault.yml --vault-password-file=$(VPF)
