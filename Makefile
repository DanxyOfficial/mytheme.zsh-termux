install:
	@chmod +x install.sh
	@./install.sh

update:
	@git pull origin main
	@./install.sh
