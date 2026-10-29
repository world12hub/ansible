# Домашнее задание к занятию 5 «Тестирование roles»

## Подготовка к выполнению

1. Установите molecule и его драйвера: `pip3 install "molecule molecule_docker molecule_podman`.

### Ответ:

Установлен фреймворк molecule и его драйвер: `pip3 install molecule molecule_docker molecule_podman`

**Скриншоты:**

- molecule

<img width="272" height="46" alt="image" src="https://github.com/user-attachments/assets/9ef69605-d1b8-4a79-b09a-ec88e13934e4" />

- molecule_docker
  
<img width="252" height="39" alt="image" src="https://github.com/user-attachments/assets/81be480d-2bd6-40c9-9ab8-c6d48253c31e" />

- molecule_podman

<img width="207" height="43" alt="image" src="https://github.com/user-attachments/assets/7fae2299-409a-4504-a07e-883c47552bd7" />


2. Выполните `docker pull aragast/netology:latest` —  это образ с podman, tox и несколькими пайтонами (3.7 и 3.9) внутри.

### Ответ:

Выполнен `docker pull aragast/netology:latest`

Выполнена команда: `docker images`

**Скриншот:**

<img width="830" height="75" alt="image" src="https://github.com/user-attachments/assets/b48ee15b-9a5f-4fb8-98c1-2ae68943e0ed" />


## Основная часть

Ваша цель — настроить тестирование ваших ролей. 

Задача — сделать сценарии тестирования для vector. 

Ожидаемый результат — все сценарии успешно проходят тестирование ролей.

### Molecule

1. Запустите  `molecule test -s ubuntu_xenial` (или с любым другим сценарием, не имеет значения) внутри корневой директории clickhouse-role, посмотрите на вывод команды. Данная команда может отработать с ошибками или не отработать вовсе, это нормально. Наша цель - посмотреть как другие в реальном мире используют молекулу И из чего может состоять сценарий тестирования.

### Ответ:

Выполнена команда:  `molecule test -s ubuntu_xenial`

**Скриншот:**

<img width="621" height="64" alt="image" src="https://github.com/user-attachments/assets/2126e09c-e472-4f58-96fb-b13a065e33fd" />


2. Перейдите в каталог с ролью vector-role и создайте сценарий тестирования по умолчанию при помощи `molecule init scenario --driver-name docker`.

### Ответ:

1. При выполнении команды `molecule init scenario --driver-name docker` вышла ошибка об отсутствии опции `--driver-name`

**Скриншот:**

<img width="714" height="93" alt="image" src="https://github.com/user-attachments/assets/3b1ad130-6acb-4f8c-a0c8-d1ea0b066cab" />

2. Для успешной работы, выполнены следующие действия:

2.1. Выполнена команда: `molecule init scenario default`

Скриншоты:

<img width="658" height="80" alt="image" src="https://github.com/user-attachments/assets/044911b1-3917-4695-9ec4-25e25af52518" />

<img width="289" height="352" alt="image" src="https://github.com/user-attachments/assets/b2537ffc-68e6-4d75-898c-286d291f5323" />

2.2. В файл `molecule.yml` добавлена директива:
```
driver:
  name: docker
```

3. Добавьте несколько разных дистрибутивов (oraclelinux:8, ubuntu:latest) для инстансов и протестируйте роль, исправьте найденные ошибки, если они есть.
4. Добавьте несколько assert в verify.yml-файл для  проверки работоспособности vector-role (проверка, что конфиг валидный, проверка успешности запуска и др.). 
5. Запустите тестирование роли повторно и проверьте, что оно прошло успешно.
5. Добавьте новый тег на коммит с рабочим сценарием в соответствии с семантическим версионированием.

### Tox

1. Добавьте в директорию с vector-role файлы из [директории](./example).
2. Запустите `docker run --privileged=True -v <path_to_repo>:/opt/vector-role -w /opt/vector-role -it aragast/netology:latest /bin/bash`, где path_to_repo — путь до корня репозитория с vector-role на вашей файловой системе.
3. Внутри контейнера выполните команду `tox`, посмотрите на вывод.
5. Создайте облегчённый сценарий для `molecule` с драйвером `molecule_podman`. Проверьте его на исполнимость.
6. Пропишите правильную команду в `tox.ini`, чтобы запускался облегчённый сценарий.
8. Запустите команду `tox`. Убедитесь, что всё отработало успешно.
9. Добавьте новый тег на коммит с рабочим сценарием в соответствии с семантическим версионированием.

После выполнения у вас должно получится два сценария molecule и один tox.ini файл в репозитории. Не забудьте указать в ответе теги решений Tox и Molecule заданий. В качестве решения пришлите ссылку на  ваш репозиторий и скриншоты этапов выполнения задания. 

## Необязательная часть

1. Проделайте схожие манипуляции для создания роли LightHouse.
2. Создайте сценарий внутри любой из своих ролей, который умеет поднимать весь стек при помощи всех ролей.
3. Убедитесь в работоспособности своего стека. Создайте отдельный verify.yml, который будет проверять работоспособность интеграции всех инструментов между ними.
4. Выложите свои roles в репозитории.

В качестве решения пришлите ссылки и скриншоты этапов выполнения задания.

---

### Как оформить решение задания

Выполненное домашнее задание пришлите в виде ссылки на .md-файл в вашем репозитории.
