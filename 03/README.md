# Домашнее задание к занятию 3 «Использование Ansible»

## Подготовка к выполнению

1. Подготовьте в Yandex Cloud три хоста: для `clickhouse`, для `vector` и для `lighthouse`.

### Ответ:

При помощи [terraform](https://github.com/world12hub/ansible/edit/main/03/terraform) подготовлены три хоста: для `clickhouse`, для `vector` и для `lighthouse

2. Репозиторий LightHouse находится [по ссылке](https://github.com/VKCOM/lighthouse).

## Основная часть

1. Допишите playbook: нужно сделать ещё один play, который устанавливает и настраивает LightHouse.

### Ответ:

В playbook [site.yml](https://github.com/world12hub/ansible/edit/main/03/playbook/site.yml) добавлен play **LightHouse**.

2. При создании tasks рекомендую использовать модули: `get_url`, `template`, `yum`, `apt`.

### Ответ:

При создании tasks использовались описанные модули. 

3. Tasks должны: скачать статику LightHouse, установить Nginx или любой другой веб-сервер, настроить его конфиг для открытия LightHouse, запустить веб-сервер.

### Ответ:

Описание **tasks** в В playbook [site.yml](https://github.com/world12hub/ansible/edit/main/03/playbook/site.yml).

4. Подготовьте свой inventory-файл `prod.yml`.

### Ответ:

Подготовьте inventory-файл [prod.yml](https://github.com/world12hub/ansible/edit/main/03/playbook/inventory/prod.yml)

5. Запустите `ansible-lint site.yml` и исправьте ошибки, если они есть.

### Ответ:

Запустите `ansible-lint site.yml`, исправлены ошибки.

**Скриншот:**

<img width="1189" height="68" alt="image" src="https://github.com/user-attachments/assets/c3c937e3-bd28-4f7e-8562-e73030ff086f" />

6. Попробуйте запустить playbook на этом окружении с флагом `--check`.

### Ответ:

Выполнена команда `ansible -i inventory/prod.yml all -m ping`

**Скриншот:**

<img width="882" height="242" alt="image" src="https://github.com/user-attachments/assets/6c2d20c9-6988-4993-950c-1640fcdef602" />

Выполнена команда `ansible-playbook -i inventory/prod.yml site.yml --check`

7. Запустите playbook на `prod.yml` окружении с флагом `--diff`. Убедитесь, что изменения на системе произведены.

### Ответ:

Выполнена команда `ansible-playbook -i inventory/prod.yml site.yml --diff`

**Скриншот:**

<img width="1023" height="335" alt="image" src="https://github.com/user-attachments/assets/bb289a38-66f4-4ab9-b52b-f88d390ed6a1" />


8. Повторно запустите playbook с флагом `--diff` и убедитесь, что playbook идемпотентен.

### Ответ:

Выполнена команда `ansible-playbook -i inventory/prod.yml site.yml --diff`

**Скришот:**

<img width="1012" height="339" alt="image" src="https://github.com/user-attachments/assets/fcfaf3ac-5c9f-4229-9619-24f9b44c4b6d" />

9. Подготовьте README.md-файл по своему playbook. В нём должно быть описано: что делает playbook, какие у него есть параметры и теги.

### Ответ:

Подготовлен настоящий README.md-файл.

## Что делает

| Play | Сервис | Задачи |
|---|---|---|
| 1 | **ClickHouse** | Скачивает RPM, ставит через `dnf`, создаёт БД `logs` |
| 2 | **Vector** | Ставит пакет, раскладывает `vector.toml`, запускает сервис |
| 3 | **Lighthouse** | Ставит nginx, скачивает статику, настраивает конфиг |

## Параметры

Задаются в `inventory/group_vars/all.yml`:

| Переменная | По умолчанию | Описание |
|---|---|---|
| `clickhouse_version` | `22.3.3.44` | Версия ClickHouse |
| `clickhouse_packages` | `[client, server, common-static]` | Список пакетов ClickHouse |
| `vector_version` | `0.38.0` | Версия Vector |
| `vector_clickhouse_table` | `events` | Имя таблицы |

## Теги

| Сервис | Теги |
|---|---|
| **ClickHouse** | `clickhouse`, `clickhouse-install`, `clickhouse-service`, `clickhouse-config` |
| **Vector** | `vector`, `vector-install`, `vector-config`, `vector-service` |
| **Lighthouse** | `lighthouse`, `lighthouse-install`, `lighthouse-config`, `lighthouse-service` |

10. Готовый playbook выложите в свой репозиторий, поставьте тег `08-ansible-03-yandex` на фиксирующий коммит, в ответ предоставьте ссылку на него.

### Ответ:

Ссылка на репозиторий с `playbook`:  https://github.com/world12hub/ansible/releases/tag/08-ansible-03-yandex 

---

### Как оформить решение задания

Выполненное домашнее задание пришлите в виде ссылки на .md-файл в вашем репозитории.

---
