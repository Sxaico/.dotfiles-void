# dotfiles-void

Dotfiles minimalistas administrados con **GNU Stow**.
Paquetes incluidos (a fecha de este README):

* `nvim/`  → configuración de Neovim
* `tmux/`  → configuración de tmux
* `sway/`  → configuración de Sway
* `bin/`   → scripts personales

Estructura actual del repo:

```
.
├── bin
├── nvim
│   ├── after/plugin/*.lua, *.vim
│   ├── init.lua
│   ├── lazy-lock.json
│   └── lua/sxaico/*.lua
├── sway
└── tmux
```

> Nota: cada **paquete** se stowea a un **target** específico (ver “Instalación rápida”).
> Usamos targets distintos para evitar reestructurar el repo.

---

## Requisitos

* Git y GNU Stow

  * Fedora: `sudo dnf install -y git stow`
  * Void:   `sudo xbps-install -S git stow`

---

## Clonado

```bash
git clone --depth=1 https://<tu-remote>/<tu-user>/.dotfiles-void.git ~/.dotfiles-void
cd ~/.dotfiles-void
```

---

## Instalación rápida (stow)

> **Pro tip:** agregá `-n` para hacer *dry-run* antes de aplicar cambios.

```bash
# Neovim → ~/.config/nvim
stow -S -v -t ~/.config/nvim nvim

# tmux → ~/.config/tmux
stow -S -v -t ~/.config/tmux tmux

# Sway → ~/.config/sway
stow -S -v -t ~/.config/sway sway

# Scripts personales → ~/.local/bin
mkdir -p ~/.local/bin
stow -S -v -t ~/.local/bin bin
```

* **Verificar symlinks**:

  ```bash
  ls -l ~/.config/nvim
  ls -l ~/.config/tmux
  ls -l ~/.config/sway
  ls -l ~/.local/bin
  ```

---

## ¿Ya tenías archivos locales? (adopt)

Si tenés configuraciones previas en el destino y querés **absorberlas** al repo:

```bash
# Ejemplos (haz dry-run primero con -n si querés)
stow --adopt -v -t ~/.config/nvim nvim
stow --adopt -v -t ~/.config/tmux tmux
stow --adopt -v -t ~/.config/sway sway
stow --adopt -v -t ~/.local/bin bin

# Importante: después del adopt, confirmá y commiteá los cambios movidos al repo
git status
git add -A
git commit -m "adopt existing local files"
```

---

## Actualizar / restow

Cuando modifiques algo **dentro del repo**:

```bash
# re-aplicar enlaces del paquete que tocaste
stow -R -v -t ~/.config/nvim nvim
stow -R -v -t ~/.config/tmux tmux
stow -R -v -t ~/.config/sway sway
stow -R -v -t ~/.local/bin bin
```

---

## Desinstalar (unstow)

Remueve los symlinks (no borra los archivos del repo):

```bash
stow -D -v -t ~/.config/nvim nvim
stow -D -v -t ~/.config/tmux tmux
stow -D -v -t ~/.config/sway sway
stow -D -v -t ~/.local/bin bin
```

---

## Bootstrap (opcional)

Script para instalar todo de una (guardalo como `bootstrap.sh` en la raíz del repo y dale `chmod +x`):

```bash
#!/usr/bin/env bash
set -euo pipefail

REPO="${HOME}/.dotfiles-void"

cd "$REPO"

# paquetes → target
stow -S -v -t "${HOME}/.config/nvim" nvim
stow -S -v -t "${HOME}/.config/tmux" tmux
stow -S -v -t "${HOME}/.config/sway" sway
mkdir -p "${HOME}/.local/bin"
stow -S -v -t "${HOME}/.local/bin" bin

echo "✓ Dotfiles instalados"
```

Correr:

```bash
~/.dotfiles-void/bootstrap.sh
```

---

## Buenas prácticas

* **Editá siempre en el repo** (los symlinks apuntan ahí).
* **Dry-run** con `-n` si dudás.
* **Commits chicos** y descriptivos.
* No metas **secrets** en el repo (si necesitás, usá `.gitignore`, `sops`, `git-crypt`, etc).

---

## Notas específicas

* **Neovim**: tu config vive en `nvim/` y se stowea a `~/.config/nvim`.
* **tmux**: poné `tmux.conf` dentro de `tmux/` (este paquete se stowea a `~/.config/tmux`).
* **Sway**: dejá tus archivos dentro de `sway/` y stoweá a `~/.config/sway`.
* **bin**: cualquier script que quieras en `$PATH`, dejalo en `bin/` y stoweá a `~/.local/bin`.

---

## Cheatsheet de Stow

* Stow (instalar): `stow -S -t <destino> <paquete>`
* Restow (actualizar): `stow -R -t <destino> <paquete>`
* Unstow (quitar): `stow -D -t <destino> <paquete>`
* Adopt (absorber archivos existentes del destino al repo): `stow --adopt -t <destino> <paquete>`
* Dry-run: agregar `-n`

---

## Troubleshooting rápido

* **“conflict: existing target is not a link”**
  → Usá `--adopt` o mové/borra manualmente el archivo conflictivo.
* **“no such directory”**
  → Creá el target (`mkdir -p ~/.config/...` o `~/.local/bin`).
* **Symlinks rotos**
  → `stow -R` para re-enlazar; verificá rutas con `ls -l`.

---
