# Первые команды
git init
git status
git add .
git commit -m "Buy Buy Netlify"

git push origin main # Отпаравить изменения в main (origin - алиас)
git remote rename origin newalias # Изменить алиас
git pull # Подтянуть новые изменения

git remore -v # Список удаленных репозиториев
git remote set-url origin git@github.com:justgithubaccount/welcome-ton-blockchain.git # Изменить адрес (remote)   

# Логи
git log # История всех коммитов
git log -1 # Последний коммит
git log -2 # Два последних коммита
git log -p -1 # Показать какие изменения были сделаны в последнем коммите

git checkout -- git-basic-commands.sh # Вернуть файл в предыдущие состояние
git restore git-basic-commands.sh # Вернуть файл в предыдущие состояние

git diff --staged # Разница между последним коммитом и то что будет добавленно в новый коммит (staged)