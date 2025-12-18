#!/bin/bash
set -e

# Скрипт настройки XDG User Directories
# Переносит стандартные Debian папки в кастомную структуру

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "=== Настройка XDG директорий ==="

# 1. Создать структуру
echo "Создаю структуру папок..."
mkdir -p ~/libs/Desktop ~/libs/Music ~/libs/Pictures ~/libs/Videos
mkdir -p ~/setup/Templates ~/setup/Public
mkdir -p ~/downloads

# 2. Перенести содержимое (если есть)
echo "Переношу содержимое..."

# Desktop → libs/Desktop
[[ -d ~/Desktop ]] && mv ~/Desktop/* ~/libs/Desktop/ 2>/dev/null || true

# Downloads → downloads
[[ -d ~/Downloads ]] && mv ~/Downloads/* ~/downloads/ 2>/dev/null || true

# Documents → docs (объединить)
[[ -d ~/Documents ]] && mv ~/Documents/* ~/docs/ 2>/dev/null || true

# Music, Pictures, Videos → libs/
[[ -d ~/Music ]] && mv ~/Music/* ~/libs/Music/ 2>/dev/null || true
[[ -d ~/Pictures ]] && mv ~/Pictures/* ~/libs/Pictures/ 2>/dev/null || true
[[ -d ~/Videos ]] && mv ~/Videos/* ~/libs/Videos/ 2>/dev/null || true

# Templates, Public → setup/
[[ -d ~/Templates ]] && mv ~/Templates/* ~/setup/Templates/ 2>/dev/null || true
[[ -d ~/Public ]] && mv ~/Public/* ~/setup/Public/ 2>/dev/null || true

# 3. Скопировать XDG конфиг
echo "Обновляю XDG конфиг..."
cp "$SCRIPT_DIR/files-ghome/user-dirs.dirs" ~/.config/user-dirs.dirs

# 4. Удалить старые пустые директории
echo "Удаляю старые директории..."
rmdir ~/Desktop ~/Downloads ~/Documents ~/Music ~/Pictures ~/Videos ~/Templates ~/Public 2>/dev/null || true

# 5. Применить изменения
xdg-user-dirs-update

echo ""
echo "=== Готово! ==="
echo "Новая структура:"
echo "  ~/docs/      - документы"
echo "  ~/downloads/ - загрузки"
echo "  ~/libs/      - Desktop, Music, Pictures, Videos"
echo "  ~/setup/     - Templates, Public"
echo ""
echo "Перелогиньтесь для полного применения изменений."
