# Домашнее задание к занятию 4 «Работа с roles»

## Подготовка к выполнению

1. * Необязательно. Познакомьтесь с [LightHouse](https://youtu.be/ymlrNlaHzIY?t=929).
2. Создайте два пустых публичных репозитория в любом своём проекте: vector-role и lighthouse-role.

### Ответ:

Создано два репозитория: [vector-role](https://github.com/world12hub/vector-role) и [lighthouse-role](https://github.com/world12hub/lighthouse-role)

3. Добавьте публичную часть своего ключа к своему профилю на GitHub.

### Ответ:

Добавлена публичная часть ключа к своему профилю на GitHub.

## Основная часть

Ваша цель — разбить ваш playbook на отдельные roles. 

Задача — сделать roles для ClickHouse, Vector и LightHouse и написать playbook для использования этих ролей. 

Ожидаемый результат — существуют три ваших репозитория: два с roles и один с playbook.

**Что нужно сделать**

1. Создайте в старой версии playbook файл `requirements.yml` и заполните его содержимым:

   ```yaml
   ---
     - src: git@github.com:AlexeySetevoi/ansible-clickhouse.git
       scm: git
       version: "1.13"
       name: clickhouse 
   ```
### Ответ:

Создан файл `requirements.yml`.

**Скриншот:**

<img width="636" height="163" alt="image" src="https://github.com/user-attachments/assets/a14dbd10-d37a-4720-9dca-f63c000a5bfe" />

2. При помощи `ansible-galaxy` скачайте себе эту роль.

### Ответ:

При помощи `ansible-galaxy role install -r requirements.yml -p roles/` скачана роль `clickhouse`.   

3. Создайте новый каталог с ролью при помощи `ansible-galaxy role init vector-role`.

### Ответ:

Создан новый каталог с ролью при помощи `ansible-galaxy role init vector-role --init-path roles/`

4. На основе tasks из старого playbook заполните новую role. Разнесите переменные между `vars` и `default`. 

### Ответ:

На основе tasks из старого playbook заполнена новая vector-role. Разнесены переменные между `vars` и `default`. 
 
**Скриншот:**

<img width="1432" height="281" alt="image" src="https://github.com/user-attachments/assets/6a993065-776c-417f-9a21-302f6fe086a0" />

5. Перенести нужные шаблоны конфигов в `templates`.

### Ответ:

Перенесен нужный конфиг в `templates`

**Скриншот:**

<img width="681" height="530" alt="image" src="https://github.com/user-attachments/assets/4d8c404e-9ece-4f92-87a0-2997fb6db14e" />

6. Опишите в `README.md` обе роли и их параметры. Пример качественной документации ansible role [по ссылке](https://github.com/cloudalchemy/ansible-prometheus).

### Ответ:

Описан `README.md` для роли `vector`.

7. Повторите шаги 3–6 для LightHouse. Помните, что одна роль должна настраивать один продукт.
8. Выложите все roles в репозитории. Проставьте теги, используя семантическую нумерацию. Добавьте roles в `requirements.yml` в playbook.
9. Переработайте playbook на использование roles. Не забудьте про зависимости LightHouse и возможности совмещения `roles` с `tasks`.
10. Выложите playbook в репозиторий.
11. В ответе дайте ссылки на оба репозитория с roles и одну ссылку на репозиторий с playbook.

---

### Как оформить решение задания

Выполненное домашнее задание пришлите в виде ссылки на .md-файл в вашем репозитории.

---
