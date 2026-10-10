# Домашнее задание к занятию 2 «Работа с Playbook»

## Подготовка к выполнению

1. * Необязательно. Изучите, что такое [ClickHouse](https://www.youtube.com/watch?v=fjTNS2zkeBs) и [Vector](https://www.youtube.com/watch?v=CgEhyffisLY).
2. Создайте свой публичный репозиторий на GitHub с произвольным именем или используйте старый.
3. Скачайте [Playbook](./playbook/) из репозитория с домашним заданием и перенесите его в свой репозиторий.
4. Подготовьте хосты в соответствии с группами из предподготовленного playbook.

## Основная часть

1. Подготовьте свой inventory-файл `prod.yml`.

### Ответ

Подготовлен inventory-файл [prod.yml](https://github.com/world12hub/ansible/blob/main/02/playbook/inventory/prod.yml).

2. Допишите playbook: нужно сделать ещё один play, который устанавливает и настраивает [vector](https://vector.dev). Конфигурация vector должна деплоиться через template файл jinja2. От вас не требуется использовать все возможности шаблонизатора, просто вставьте стандартный конфиг в template файл. Информация по шаблонам по [ссылке](https://www.dmosk.ru/instruktions.php?object=ansible-nginx-install). не забудьте сделать handler на перезапуск vector в случае изменения конфигурации!

### Ответ
В playbook [site.yml]((https://github.com/world12hub/ansible/blob/main/02/playbook/site.yml) добавлен play установки и настройки vector, также добавлен handler.

3. При создании tasks рекомендую использовать модули: `get_url`, `template`, `unarchive`, `file`.
4. Tasks должны: скачать дистрибутив нужной версии, выполнить распаковку в выбранную директорию, установить vector.
5. Запустите `ansible-lint site.yml` и исправьте ошибки, если они есть.

### Ответ:

Выполнена команда `ansible-lint site.yml`. В итоге выявлены ошибки. Ошибки устранены. 

**Скриншот:**

<img width="1114" height="207" alt="image" src="https://github.com/user-attachments/assets/3822ed17-a03a-4f75-9bf7-6bb25f9035a8" />

<img width="1197" height="59" alt="image" src="https://github.com/user-attachments/assets/22480f6a-3c1e-4031-9be5-b289f68a0d44" />


6. Попробуйте запустить playbook на этом окружении с флагом `--check`.

### Ответ

Выполнена команда `ansible-playbook -i ./inventory/prod.yml site.yml --check`

<img width="1023" height="113" alt="image" src="https://github.com/user-attachments/assets/8a8753ed-2a76-495f-a6c4-10be78ad0157" />

7. Запустите playbook на `prod.yml` окружении с флагом `--diff`. Убедитесь, что изменения на системе произведены.

### Ответ

Выполнена команда `ansible-playbook -i ./inventory/prod.yml site.yml --diff`

<img width="942" height="93" alt="image" src="https://github.com/user-attachments/assets/11a0ba1c-0491-4ef6-9d83-b427daf3cdfe" />

8. Повторно запустите playbook с флагом `--diff` и убедитесь, что playbook идемпотентен.
9. Подготовьте README.md-файл по своему playbook. В нём должно быть описано: что делает playbook, какие у него есть параметры и теги. Пример качественной документации ansible playbook по [ссылке](https://github.com/opensearch-project/ansible-playbook). Так же приложите скриншоты выполнения заданий №5-8
10. Готовый playbook выложите в свой репозиторий, поставьте тег `08-ansible-02-playbook` на фиксирующий коммит, в ответ предоставьте ссылку на него.

---

### Как оформить решение задания

Приложите ссылку на ваше решение в поле "Ссылка на решение" и нажмите "Отправить решение"

---
