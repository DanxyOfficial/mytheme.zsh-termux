# Variabel
REPO_DIR := $(shell pwd)

.PHONY: install update help

help:
	@echo "Perintah yang tersedia:"
	@echo "  make install  - Menjalankan script instalasi"
	@echo "  make update   - Ambil update terbaru dari GitHub & install ulang"

install:
	@bash install.sh

update:
	@echo "Checking for updates from GitHub..."
	git pull origin main
	@echo "Re-installing theme..."
	@bash install.sh
	@echo "Update Berhasil!"
