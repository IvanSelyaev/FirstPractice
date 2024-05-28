#!/bin/bash
# Функция для вывода справки
show_help() {
echo "Использование: $(basename "$0") [ПАРАМЕТРЫ]"
echo "Параметры:"
echo " -u, —users Вывод списка пользователей и их домашние директории, отсортированные по алфавиту."
echo " -p, —processes Вывод списка запущенных процессов, отсортированных по их PID."
echo " -l ПУТЬ, —log ПУТЬ Перенаправление стандартного вывода в файл, указанный по ПУТИ."
echo " -e ПУТЬ, —errors ПУТЬ Перенаправление ошибок из stderr в файл, указанный по ПУТИ."
echo " -h, —help Отображение этого сообщения справки и выход."
}
# Функция для вывода списка пользователей и их домашних директорий
info_users() {
cat /etc/passwd | awk -F: '{print $1 "\t" $6}' | sort
}
# Функция для вывода списка запущенных процессов
info_processes() {
ps -eo pid,cmd -C sort=pid
}

# Функция для перенаправления вывода в файл
redirect_output() {
local path=$1
shift
"$@" > "$path"
}

# Функция для перенаправления ошибок в файл
redirect_errors() {
local path=$1
shift
"$@" 2> "$path"
}

#Работа с параметрами
while true; do
show_help
read -p "Введите команду: " option

case $option in
-u|--users) info_users ;;
-p|--processes) info_processes ;;
-l|--log)
read -p "Введите путь для лога:" log_path
redirect_output "$log_path" "${@:3}"
;;
-e|--errors)
read -p "Введите путь для вывода ошибки: " error_path
redirect_errors "$error_path" "${@:3}"
;;
-h|--help) show_help ;;
*) echo "$1 is not an option" ;;
esac
done
