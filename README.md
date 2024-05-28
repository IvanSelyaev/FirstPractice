# Bash Утилита для Обработки Аргументов Командной Строки

Этот скрипт на языке Bash представляет собой консольную утилиту, которая обрабатывает аргументы командной строки и выполняет различные действия в зависимости от переданных параметров. Программа имеет некоторые опции:

- Вывод списка пользователей и их домашних директорий, отсортированных по алфавиту.
- Вывод списка запущенных процессов, отсортированных по их идентификатору (PID).
- Перенаправление стандартного вывода в файл.
- Перенаправление вывода ошибок из потока stderr в файл.
- Отображение справки по использованию программы.

## Использование

Для запуска программы необходимо выполнить следующую команду:
`./script_info.sh`
## Параметры скрипта

- `-u, --users`: выводит список пользователей и их домашние директорий.
- `-p, --processes`: выводит список запущенных процессов.
- `-l ПУТЬ, --log ПУТЬ`: перенаправляет стандартный вывод в файл, указанный по пути ПУТЬ.
- `-e ПУТЬ, --errors ПУТЬ`: перенаправляет ошибки из stderr в файл, указанный по пути ПУТЬ.
- `-h, --help`: отображает справку по использованию программы.
## Зависимости

Этот скрипт не имеет зависимостей от сторонних программ и библиотек.
