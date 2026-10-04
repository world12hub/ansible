<img width="411" height="92" alt="image" src="https://github.com/user-attachments/assets/c81530e4-a809-4908-98e0-f55db0b52b48" /># Домашнее задание к занятию 1 «Введение в Ansible»

## Подготовка к выполнению

1. Установите Ansible версии 2.10 или выше.

**Ответ:**

Установлен ansible версии 2.17.

**Скриншот:**

<img width="511" height="40" alt="image" src="https://github.com/user-attachments/assets/9ac617c7-efd9-4984-a014-6c06b26aa7d7" />

2. Создайте свой публичный репозиторий на GitHub с произвольным именем.

**Ответ:**

Создан свой публичный репозиторий на [GitHub](https://github.com/world12hub/ansible/edit/main/01)

3. Скачайте [Playbook](./playbook/) из репозитория с домашним заданием и перенесите его в свой репозиторий.

**Ответ:**

Сделан форк из репозитория из домашнего задания.

**Скриншот:**

<img width="408" height="44" alt="image" src="https://github.com/user-attachments/assets/51546fa8-70ef-4b7f-8279-8dfbe61d6eba" />



## Основная часть

1. Попробуйте запустить playbook на окружении из `test.yml`, зафиксируйте значение, которое имеет факт `some_fact` для указанного хоста при выполнении playbook.

**Ответ:**

Выполнены следующие команды:

1.1. Провека соединения:

`ansible -i inventory/test.yml inside -m ping`

**Скриншот:**

<img width="1263" height="178" alt="image" src="https://github.com/user-attachments/assets/d9104482-3dcc-4232-b0b2-3136f6cc7de1" />

1.2. Выполнение **playbook**

`ansible-playbook site.yml -i inventory/test.yml`

**Скриншот:**

<img width="1112" height="399" alt="image" src="https://github.com/user-attachments/assets/40e21c2e-48d4-4e16-bd07-88afab3d07e8" />


2. Найдите файл с переменными (group_vars), в котором задаётся найденное в первом пункте значение, и поменяйте его на `all default fact`.

**Ответ:**

В файле group_vars/examp.yml внесены изменения в переменную `some_fact: all default fact`

**Скриншот:**

<img width="411" height="92" alt="image" src="https://github.com/user-attachments/assets/6207d46e-94be-4c6c-9990-e314c2db6f99" />

3. Воспользуйтесь подготовленным (используется `docker`) или создайте собственное окружение для проведения дальнейших испытаний.

**Ответ:**

Подняты контейнеры:

**CentOS 7:**

`docker run -d --name centos7 --privileged centos:7 sleep infinity`

**Ubuntu:**

`docker run -d --name ubuntu --privileged ubuntu:latest sleep infinity`

**Скриншот:**

<img width="878" height="75" alt="image" src="https://github.com/user-attachments/assets/c693bc79-cc86-4834-8930-7fb10bfdc850" />

4. Проведите запуск playbook на окружении из `prod.yml`. Зафиксируйте полученные значения `some_fact` для каждого из `managed host`.

**Ответ:**

Выполнена команда:

`ansible-playbook site.yml -i inventory/prod.yml`

**Скриншот:**

<img width="1265" height="570" alt="image" src="https://github.com/user-attachments/assets/f4f77df3-1d0f-42f8-ab2e-8d78512af34c" />


5. Добавьте факты в `group_vars` каждой из групп хостов так, чтобы для `some_fact` получились значения: для `deb` — `deb default fact`, для `el` — `el default fact`.

**Ответ:**

Изменил переменные.

6.  Повторите запуск playbook на окружении `prod.yml`. Убедитесь, что выдаются корректные значения для всех хостов.

**Ответ:**

Выполнена команда `ansible-playbook site.yml -i inventory/prod.yml`

**Скриншот:**

<img width="1231" height="575" alt="image" src="https://github.com/user-attachments/assets/9ee0536f-37f2-4488-b1b4-a41530bc75d1" />


7. При помощи `ansible-vault` зашифруйте факты в `group_vars/deb` и `group_vars/el` с паролем `netology`.

**Ответ:**

Выполнены команды:

`ansible-vault encrypt group_vars/deb/examp.yml 
ansible-vault encrypt group_vars/el/examp.yml`

**Скриншот:**

<img width="855" height="143" alt="image" src="https://github.com/user-attachments/assets/5c4eac12-d94b-4545-a2b2-d3b19d0193dd" />


8. Запустите playbook на окружении `prod.yml`. При запуске `ansible` должен запросить у вас пароль. Убедитесь в работоспособности.
9. Посмотрите при помощи `ansib le-doc` список плагинов для подключения. Выберите подходящий для работы на `control node`.
10. В `prod.yml` добавьте новую группу хостов с именем  `local`, в ней разместите localhost с необходимым типом подключения.
11. Запустите playbook на окружении `prod.yml`. При запуске `ansible` должен запросить у вас пароль. Убедитесь, что факты `some_fact` для каждого из хостов определены из верных `group_vars`.
12. Заполните `README.md` ответами на вопросы. Сделайте `git push` в ветку `master`. В ответе отправьте ссылку на ваш открытый репозиторий с изменённым `playbook` и заполненным `README.md`.
13. Предоставьте скриншоты результатов запуска команд.

## Необязательная часть

1. При помощи `ansible-vault` расшифруйте все зашифрованные файлы с переменными.
2. Зашифруйте отдельное значение `PaSSw0rd` для переменной `some_fact` паролем `netology`. Добавьте полученное значение в `group_vars/all/exmp.yml`.
3. Запустите `playbook`, убедитесь, что для нужных хостов применился новый `fact`.
4. Добавьте новую группу хостов `fedora`, самостоятельно придумайте для неё переменную. В качестве образа можно использовать [этот вариант](https://hub.docker.com/r/pycontribs/fedora).
5. Напишите скрипт на bash: автоматизируйте поднятие необходимых контейнеров, запуск ansible-playbook и остановку контейнеров.
6. Все изменения должны быть зафиксированы и отправлены в ваш личный репозиторий.

---

### Как оформить решение задания

Приложите ссылку на ваше решение в поле «Ссылка на решение» и нажмите «Отправить решение»
---
