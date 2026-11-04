# Домашнее задание к занятию 5 «Тестирование roles»

## Подготовка к выполнению

1. Установите molecule и его драйвера: `pip3 install "molecule molecule_docker molecule_podman`.

### Ответ:

Установка molecule и плагинов: `pip3 install molecule molecule-plugins[docker,podman]`

`molecule --version`

<img width="845" height="217" alt="image" src="https://github.com/user-attachments/assets/dd2f124b-094d-4832-ad8e-8fdaad411905" />

`molecule drivers`

<img width="618" height="183" alt="image" src="https://github.com/user-attachments/assets/7e199228-658b-4d80-ad4d-3cb8c6c7e809" />

2. Выполните `docker pull aragast/netology:latest` —  это образ с podman, tox и несколькими пайтонами (3.7 и 3.9) внутри.

### Ответ:

Выполнен `docker pull aragast/netology:latest` 

<img width="794" height="91" alt="image" src="https://github.com/user-attachments/assets/449cb86e-90c4-4690-9517-c80e766b3d02" />

## Основная часть

Ваша цель — настроить тестирование ваших ролей. 

Задача — сделать сценарии тестирования для vector. 

Ожидаемый результат — все сценарии успешно проходят тестирование ролей.

### Molecule

1. Запустите  `molecule test -s ubuntu_xenial` (или с любым другим сценарием, не имеет значения) внутри корневой директории clickhouse-role, посмотрите на вывод команды. Данная команда может отработать с ошибками или не отработать вовсе, это нормально. Наша цель - посмотреть как другие в реальном мире используют молекулу И из чего может состоять сценарий тестирования.
2. Перейдите в каталог с ролью vector-role и создайте сценарий тестирования по умолчанию при помощи `molecule init scenario --driver-name docker`.
3. Добавьте несколько разных дистрибутивов (oraclelinux:8, ubuntu:latest) для инстансов и протестируйте роль, исправьте найденные ошибки, если они есть.
4. Добавьте несколько assert в verify.yml-файл для  проверки работоспособности vector-role (проверка, что конфиг валидный, проверка успешности запуска и др.). 
5. Запустите тестирование роли повторно и проверьте, что оно прошло успешно.
5. Добавьте новый тег на коммит с рабочим сценарием в соответствии с семантическим версионированием.

### Ответ:

**Ссылка на репозиторий:**

https://github.com/world12hub/ansible/tree/main/05-testing/vector/molecule/default

<details>
<summary>Вывод команды molecule test -s default</summary>

```
INFO     default ➜ discovery: scenario test matrix: dependency, cleanup, destroy, syntax, create, prepare, converge, idempotence, side_effect, verify, cleanup, destroy
INFO     default ➜ prerun: Performing prerun with role_name_check=0...
INFO     default ➜ dependency: Executing
INFO     default ➜ dependency: Executed: 2 disabled
INFO     default ➜ cleanup: Executing
WARNING  default ➜ cleanup: Executed: Missing playbook (Remove from test_sequence to suppress)
INFO     default ➜ destroy: Executing
INFO     Sanity checks: 'docker'
  ┌──────────────────────────────────────────────────────────────────────────────────
  │ ansible-playbook --inventory /home/adminsk/.ansible/tmp/molecule.sNUc.default/inventory
  │   --skip-tags molecule-notest,notest
  │   /home/adminsk/.local/lib/python3.10/site-packages/molecule_plugins/docker/playbooks/destroy.yml
  │ 
  │ 
  │ PLAY [Destroy] *****************************************************************
  │ 
  │ TASK [Set async_dir for HOME env] **********************************************
  │ ok: [localhost]
  │ 
  │ TASK [Destroy molecule instance(s)] ********************************************
  │ changed: [localhost] => (item=ubuntu-instance)
  │ changed: [localhost] => (item=debian-instance)
  │ 
  │ TASK [Wait for instance(s) deletion to complete] *******************************
  │ ok: [localhost] => (item=ubuntu-instance)
  │ ok: [localhost] => (item=debian-instance)
  │ 
  │ TASK [Delete docker networks(s)] ***********************************************
  │ skipping: [localhost]
  │ 
  │ PLAY RECAP *********************************************************************
  │ localhost                  : ok=3    changed=1    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0
  │ 
  └─ Return code: 0 ─────────────────────────────────────────────────────────────────
INFO     default ➜ destroy: Executed: Successful
INFO     default ➜ syntax: Executing
  ┌──────────────────────────────────────────────────────────────────────────────────
  │ ansible-playbook --inventory /home/adminsk/.ansible/tmp/molecule.sNUc.default/inventory
  │   --skip-tags molecule-notest,notest
  │   --syntax-check /home/adminsk/ansible/05-testing/vector/molecule/default/converge.yml
  │ 
  │ 
  │ playbook: /home/adminsk/ansible/05-testing/vector/molecule/default/converge.yml
  └─ Return code: 0 ─────────────────────────────────────────────────────────────────
INFO     default ➜ syntax: Executed: Successful
INFO     default ➜ create: Executing
  ┌──────────────────────────────────────────────────────────────────────────────────
  │ ansible-playbook --inventory /home/adminsk/.ansible/tmp/molecule.sNUc.default/inventory
  │   --skip-tags molecule-notest,notest
  │   /home/adminsk/.local/lib/python3.10/site-packages/molecule_plugins/docker/playbooks/create.yml
  │ 
  │ 
  │ PLAY [Create] ******************************************************************
  │ 
  │ TASK [Set async_dir for HOME env] **********************************************
  │ ok: [localhost]
  │ 
  │ TASK [Log into a Docker registry] **********************************************
  │ skipping: [localhost] => (item=None) 
  │ skipping: [localhost] => (item=None) 
  │ skipping: [localhost]
  │ 
  │ TASK [Check presence of custom Dockerfiles] ************************************
  │ ok: [localhost] => (item=ubuntu-instance)
  │ ok: [localhost] => (item=debian-instance)
  │ 
  │ TASK [Create Dockerfiles from image names] *************************************
  │ changed: [localhost] => (item=ubuntu-instance)
  │ changed: [localhost] => (item=debian-instance)
  │ 
  │ TASK [Synchronization the context] *********************************************
  │ changed: [localhost] => (item=ubuntu-instance)
  │ ok: [localhost] => (item=debian-instance)
  │ 
  │ TASK [Discover local Docker images] ********************************************
  │ ok: [localhost] => (item=unix://var/run/docker.sock)
  │ ok: [localhost] => (item=unix://var/run/docker.sock)
  │ 
  │ TASK [Create docker network(s)] ************************************************
  │ skipping: [localhost]
  │ 
  │ TASK [Build an Ansible compatible image (new)] *********************************
  │ ok: [localhost] => (item=molecule_local/ubuntu:22.04)
  │ ok: [localhost] => (item=molecule_local/debian:bookworm-slim)
  │ 
  │ TASK [Determine the CMD directives] ********************************************
  │ ok: [localhost] => (item=ubuntu-instance)
  │ ok: [localhost] => (item=debian-instance)
  │ 
  │ TASK [Create molecule instance(s)] *********************************************
  │ changed: [localhost] => (item=ubuntu-instance)
  │ changed: [localhost] => (item=debian-instance)
  │ 
  │ TASK [Wait for instance(s) creation to complete] *******************************
  │ FAILED - RETRYING: [localhost]: Wait for instance(s) creation to complete (300 retries left).
  │ changed: [localhost] => (item=ubuntu-instance)
  │ changed: [localhost] => (item=debian-instance)
  │ 
  │ PLAY RECAP *********************************************************************
  │ localhost                  : ok=9    changed=4    unreachable=0    failed=0    skipped=2    rescued=0    ignored=0
  │ 
  └─ Return code: 0 ─────────────────────────────────────────────────────────────────
INFO     default ➜ create: Executed: Successful
INFO     default ➜ prepare: Executing
WARNING  default ➜ prepare: Executed: Missing playbook (Remove from test_sequence to suppress)
INFO     default ➜ converge: Executing
  ┌──────────────────────────────────────────────────────────────────────────────────
  │ ansible-playbook --inventory /home/adminsk/.ansible/tmp/molecule.sNUc.default/inventory
  │   --skip-tags molecule-notest,notest
  │   /home/adminsk/ansible/05-testing/vector/molecule/default/converge.yml
  │ 
  │ 
  │ PLAY [Converge] ****************************************************************
  │ 
  │ TASK [Gathering Facts] *********************************************************
  │ ok: [debian-instance]
  │ ok: [ubuntu-instance]
  │ 
  │ TASK [Include vector role] *****************************************************
  │ 
  │ TASK [/home/adminsk/ansible/05-testing/vector : Install dependencies] **********
  │ changed: [debian-instance]
  │ changed: [ubuntu-instance]
  │ 
  │ TASK [/home/adminsk/ansible/05-testing/vector : Create installation directory] ***
  │ changed: [ubuntu-instance]
  │ changed: [debian-instance]
  │ 
  │ TASK [/home/adminsk/ansible/05-testing/vector : Download Vector] ***************
  │ changed: [ubuntu-instance]
  │ changed: [debian-instance]
  │ 
  │ TASK [/home/adminsk/ansible/05-testing/vector : Extract Vector] ****************
  │ changed: [ubuntu-instance]
  │ changed: [debian-instance]
  │ 
  │ TASK [/home/adminsk/ansible/05-testing/vector : Install Vector binary] *********
  │ changed: [ubuntu-instance]
  │ changed: [debian-instance]
  │ 
  │ TASK [/home/adminsk/ansible/05-testing/vector : Create vector group] ***********
  │ changed: [ubuntu-instance]
  │ changed: [debian-instance]
  │ 
  │ TASK [/home/adminsk/ansible/05-testing/vector : Create vector user] ************
  │ changed: [ubuntu-instance]
  │ changed: [debian-instance]
  │ 
  │ TASK [/home/adminsk/ansible/05-testing/vector : Add vector to adm group (for log access)] ***
  │ changed: [ubuntu-instance]
  │ changed: [debian-instance]
  │ 
  │ TASK [/home/adminsk/ansible/05-testing/vector : Create directories] ************
  │ changed: [debian-instance] => (item={'path': '/etc/vector'})
  │ changed: [ubuntu-instance] => (item={'path': '/etc/vector'})
  │ ok: [debian-instance] => (item={'path': '/var/lib/vector'})
  │ changed: [ubuntu-instance] => (item={'path': '/var/lib/vector'})
  │ changed: [debian-instance] => (item={'path': '/var/log/vector'})
  │ changed: [ubuntu-instance] => (item={'path': '/var/log/vector'})
  │ 
  │ TASK [/home/adminsk/ansible/05-testing/vector : Deploy config] *****************
  │ changed: [ubuntu-instance]
  │ changed: [debian-instance]
  │ 
  │ TASK [/home/adminsk/ansible/05-testing/vector : Deploy systemd service] ********
  │ changed: [debian-instance]
  │ changed: [ubuntu-instance]
  │ 
  │ TASK [/home/adminsk/ansible/05-testing/vector : Start Vector directly] *********
  │ ok: [ubuntu-instance]
  │ ok: [debian-instance]
  │ 
  │ PLAY RECAP *********************************************************************
  │ debian-instance            : ok=13   changed=11   unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
  │ ubuntu-instance            : ok=13   changed=11   unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
  │ 
  └─ Return code: 0 ─────────────────────────────────────────────────────────────────
INFO     default ➜ converge: Executed: Successful
INFO     default ➜ idempotence: Executing
  ┌──────────────────────────────────────────────────────────────────────────────────
  │ ansible-playbook --inventory /home/adminsk/.ansible/tmp/molecule.sNUc.default/inventory
  │   --skip-tags molecule-notest,notest,molecule-idempotence-notest
  │   /home/adminsk/ansible/05-testing/vector/molecule/default/converge.yml
  │ 
  │ 
  │ PLAY [Converge] ****************************************************************
  │ 
  │ TASK [Gathering Facts] *********************************************************
  │ ok: [debian-instance]
  │ ok: [ubuntu-instance]
  │ 
  │ TASK [Include vector role] *****************************************************
  │ 
  │ TASK [/home/adminsk/ansible/05-testing/vector : Install dependencies] **********
  │ ok: [debian-instance]
  │ ok: [ubuntu-instance]
  │ 
  │ TASK [/home/adminsk/ansible/05-testing/vector : Create installation directory] ***
  │ ok: [ubuntu-instance]
  │ ok: [debian-instance]
  │ 
  │ TASK [/home/adminsk/ansible/05-testing/vector : Download Vector] ***************
  │ ok: [ubuntu-instance]
  │ ok: [debian-instance]
  │ 
  │ TASK [/home/adminsk/ansible/05-testing/vector : Extract Vector] ****************
  │ ok: [ubuntu-instance]
  │ ok: [debian-instance]
  │ 
  │ TASK [/home/adminsk/ansible/05-testing/vector : Install Vector binary] *********
  │ ok: [debian-instance]
  │ ok: [ubuntu-instance]
  │ 
  │ TASK [/home/adminsk/ansible/05-testing/vector : Create vector group] ***********
  │ ok: [ubuntu-instance]
  │ ok: [debian-instance]
  │ 
  │ TASK [/home/adminsk/ansible/05-testing/vector : Create vector user] ************
  │ ok: [ubuntu-instance]
  │ ok: [debian-instance]
  │ 
  │ TASK [/home/adminsk/ansible/05-testing/vector : Add vector to adm group (for log access)] ***
  │ ok: [debian-instance]
  │ ok: [ubuntu-instance]
  │ 
  │ TASK [/home/adminsk/ansible/05-testing/vector : Create directories] ************
  │ ok: [debian-instance] => (item={'path': '/etc/vector'})
  │ ok: [ubuntu-instance] => (item={'path': '/etc/vector'})
  │ ok: [debian-instance] => (item={'path': '/var/lib/vector'})
  │ ok: [ubuntu-instance] => (item={'path': '/var/lib/vector'})
  │ ok: [debian-instance] => (item={'path': '/var/log/vector'})
  │ ok: [ubuntu-instance] => (item={'path': '/var/log/vector'})
  │ 
  │ TASK [/home/adminsk/ansible/05-testing/vector : Deploy config] *****************
  │ ok: [debian-instance]
  │ ok: [ubuntu-instance]
  │ 
  │ TASK [/home/adminsk/ansible/05-testing/vector : Deploy systemd service] ********
  │ ok: [ubuntu-instance]
  │ ok: [debian-instance]
  │ 
  │ TASK [/home/adminsk/ansible/05-testing/vector : Start Vector directly] *********
  │ ok: [ubuntu-instance]
  │ ok: [debian-instance]
  │ 
  │ PLAY RECAP *********************************************************************
  │ debian-instance            : ok=13   changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
  │ ubuntu-instance            : ok=13   changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
  │ 
  └─ Return code: 0 ─────────────────────────────────────────────────────────────────
INFO     default ➜ idempotence: Executed: Successful
INFO     default ➜ side_effect: Executing
WARNING  default ➜ side_effect: Executed: Missing playbook (Remove from test_sequence to suppress)
INFO     default ➜ verify: Executing
  ┌──────────────────────────────────────────────────────────────────────────────────
  │ ansible-playbook --inventory /home/adminsk/.ansible/tmp/molecule.sNUc.default/inventory
  │   --skip-tags molecule-notest,notest
  │   /home/adminsk/ansible/05-testing/vector/molecule/default/verify.yml
  │ 
  │ 
  │ PLAY [Verify Vector installation and configuration] ****************************
  │ 
  │ TASK [Check if Vector is running] **********************************************
  │ ok: [debian-instance]
  │ ok: [ubuntu-instance]
  │ 
  │ TASK [Display Vector status] ***************************************************
  │ ok: [debian-instance] => {
  │     "vector_status.stdout": "not running"
  │ }
  │ ok: [ubuntu-instance] => {
  │     "vector_status.stdout": "running"
  │ }
  │ 
  │ TASK [Validate Vector config file syntax] **************************************
  │ ok: [ubuntu-instance]
  │ ok: [debian-instance]
  │ 
  │ TASK [Assert Vector config is valid] *******************************************
  │ ok: [debian-instance] => {
  │     "changed": false,
  │     "msg": "Vector config is valid."
  │ }
  │ ok: [ubuntu-instance] => {
  │     "changed": false,
  │     "msg": "Vector config is valid."
  │ }
  │ 
  │ TASK [Check Vector version (дополнительно)] ************************************
  │ ok: [ubuntu-instance]
  │ ok: [debian-instance]
  │ 
  │ TASK [Print Vector version (для информации)] ***********************************
  │ ok: [debian-instance] => {
  │     "vector_version.stdout": "vector 0.48.0 (x86_64-unknown-linux-gnu a67e4e2 2025-06-30 18:25:45.272082383)"
  │ }
  │ ok: [ubuntu-instance] => {
  │     "vector_version.stdout": "vector 0.48.0 (x86_64-unknown-linux-gnu a67e4e2 2025-06-30 18:25:45.272082383)"
  │ }
  │ 
  │ PLAY RECAP *********************************************************************
  │ debian-instance            : ok=6    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
  │ ubuntu-instance            : ok=6    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
  │ 
  └─ Return code: 0 ─────────────────────────────────────────────────────────────────
INFO     default ➜ verify: Executed: Successful
INFO     default ➜ cleanup: Executing
WARNING  default ➜ cleanup: Executed: Missing playbook (Remove from test_sequence to suppress)
INFO     default ➜ destroy: Executing
  ┌──────────────────────────────────────────────────────────────────────────────────
  │ ansible-playbook --inventory /home/adminsk/.ansible/tmp/molecule.sNUc.default/inventory
  │   --skip-tags molecule-notest,notest
  │   /home/adminsk/.local/lib/python3.10/site-packages/molecule_plugins/docker/playbooks/destroy.yml
  │ 
  │ 
  │ PLAY [Destroy] *****************************************************************
  │ 
  │ TASK [Set async_dir for HOME env] **********************************************
  │ ok: [localhost]
  │ 
  │ TASK [Destroy molecule instance(s)] ********************************************
  │ changed: [localhost] => (item=ubuntu-instance)
  │ changed: [localhost] => (item=debian-instance)
  │ 
  │ TASK [Wait for instance(s) deletion to complete] *******************************
  │ FAILED - RETRYING: [localhost]: Wait for instance(s) deletion to complete (300 retries left).
  │ changed: [localhost] => (item=ubuntu-instance)
  │ changed: [localhost] => (item=debian-instance)
  │ 
  │ TASK [Delete docker networks(s)] ***********************************************
  │ skipping: [localhost]
  │ 
  │ PLAY RECAP *********************************************************************
  │ localhost                  : ok=3    changed=2    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0
  │ 
  └─ Return code: 0 ─────────────────────────────────────────────────────────────────
INFO     default ➜ destroy: Executed: Successful
INFO     default ➜ scenario: Pruning extra files from scenario ephemeral directory
WARNING  Molecule executed 1 scenario (1 missing files)

DETAILS                                                                        
default ➜ dependency: Executed: 2 disabled
default ➜ cleanup: Executed: Missing playbook (Remove from test_sequence to suppress)
default ➜ destroy: Executed: Successful
default ➜ syntax: Executed: Successful
default ➜ create: Executed: Successful
default ➜ prepare: Executed: Missing playbook (Remove from test_sequence to suppress)
default ➜ converge: Executed: Successful
default ➜ idempotence: Executed: Successful
default ➜ side_effect: Executed: Missing playbook (Remove from test_sequence to suppress)
default ➜ verify: Executed: Successful
default ➜ cleanup: Executed: Missing playbook (Remove from test_sequence to suppress)
default ➜ destroy: Executed: Successful

SCENARIO RECAP                                                                 
default                   : actions=12  successful=7  disabled=2  skipped=0  missing=4  failed=0
```

### Tox

1. Добавьте в директорию с vector-role файлы из [директории](./example).
2. Запустите `docker run --privileged=True -v <path_to_repo>:/opt/vector-role -w /opt/vector-role -it aragast/netology:latest /bin/bash`, где path_to_repo — путь до корня репозитория с vector-role на вашей файловой системе.
3. Внутри контейнера выполните команду `tox`, посмотрите на вывод.
5. Создайте облегчённый сценарий для `molecule` с драйвером `molecule_podman`. Проверьте его на исполнимость.
6. Пропишите правильную команду в `tox.ini`, чтобы запускался облегчённый сценарий.
8. Запустите команду `tox`. Убедитесь, что всё отработало успешно.
9. Добавьте новый тег на коммит с рабочим сценарием в соответствии с семантическим версионированием.

### Ответ:

1. Установлен tox

pip install tox
tox --version

<img width="868" height="63" alt="image" src="https://github.com/user-attachments/assets/356b1330-7e6d-4341-acf0-d18b79519ff5" />

2. Действия для Tox

Tox.ini

https://github.com/world12hub/ansible/blob/main/05-testing/vector/tox.ini

tox-requirements.txt

https://github.com/world12hub/ansible/blob/main/05-testing/vector/tox-requirements.txt

Сценарий:

https://github.com/world12hub/ansible/tree/main/05-testing/vector/molecule/tox

<deatails>
<summary>Вывод команды tox<summary>
```
  py312-ansible30: remove tox env folder /home/adminsk/ansible/05-testing/vector/.tox/py312-ansible30
py312-ansible30: install_deps> python -I -m pip install -r tox-requirements.txt
py312-ansible30: commands[0]> python --version
Python 3.12.16
py312-ansible30: commands[1]> ansible --version
ansible [core 2.21.6]
  config file = None
  configured module search path = ['/home/adminsk/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /home/adminsk/ansible/05-testing/vector/.tox/py312-ansible30/lib/python3.12/site-packages/ansible
  ansible collection location = /home/adminsk/.ansible/collections:/usr/share/ansible/collections
  executable location = /home/adminsk/ansible/05-testing/vector/.tox/py312-ansible30/bin/ansible
  python version = 3.12.16 (main, Oct 26 2026, 15:28:01) [GCC 11.4.0] (/home/adminsk/ansible/05-testing/vector/.tox/py312-ansible30/bin/python)
  jinja version = 3.1.6
  pyyaml version = 6.0.3 (with libyaml v0.2.5)
py312-ansible30: commands[2]> molecule test -s tox
WARNING  Driver podman does not provide a schema.
WARNING  Driver docker does not provide a schema.
INFO     tox ➜ discovery: scenario test matrix: destroy, dependency, create, converge, verify, destroy
INFO     tox ➜ prerun: Performing prerun with role_name_check=0...
INFO     tox ➜ destroy: Executing
INFO     Sanity checks: 'podman'
  ┌──────────────────────────────────────────────────────────────────────────────────
  │ ansible-playbook --inventory /home/adminsk/.ansible/tmp/molecule.sNUc.tox/inventory
  │   --skip-tags molecule-notest,notest
  │   /home/adminsk/ansible/05-testing/vector/.tox/py312-ansible30/lib/python3.12/site-packages/molecule_podman/playbooks/destroy.yml
  │ 
  │ 
  │ PLAY [Destroy] *****************************************************************
  │ 
  │ TASK [Set async_dir for HOME env] **********************************************
  │ [WARNING]: Deprecation warnings can be disabled by setting `deprecation_warnings=False` in ansible.cfg.
  │ [DEPRECATION WARNING]: Conditional result (True) was derived from value of type 'str' at "<environment variable 'HOME'>". Conditionals must
  │   have a boolean result. This feature will be removed from ansible-core version 2.23.
  │ Origin: /home/adminsk/ansible/05-testing/vector/.tox/py312-ansible30/lib/python3.12/site-packages/molecule_podman/playbooks/destroy.yml:14:13
  │ 
  │ 12       ansible.builtin.set_fact:
  │ 13         ansible_async_dir: "{{ lookup('env', 'HOME') }}/.ansible_async/"
  │ 14       when: (lookup('env', 'HOME'))
  │                ^ column 13
  │ 
  │ Broken conditionals are currently allowed because the `ALLOW_BROKEN_CONDITIONALS` configuration option is enabled.
  │ 
  │ ok: [localhost]
  │ 
  │ TASK [Destroy molecule instance(s)] ********************************************
  │ changed: [localhost] => (item={'command': 'sleep infinity', 'dockerfile': 'Dockerfile.ubuntu', 'image': 'ubuntu:22.04', 'name':
  │   'ubuntu-instance', 'pre_build_image': False, 'tmpfs': ['/tmp', '/run']})
  │ changed: [localhost] => (item={'command': 'sleep infinity', 'dockerfile': 'Dockerfile.debian', 'image': 'debian:bookworm-slim', 'name':
  │   'debian-instance', 'pre_build_image': False, 'tmpfs': ['/tmp', '/run']})
  │ 
  │ TASK [Wait for instance(s) deletion to complete] *******************************
  │ changed: [localhost] => (item={'changed': True, 'failed': False, 'finished': False, 'ansible_job_id': 'j285955917934.93196',
  │   'changed_when_result': True, 'ansible_loop_var': 'item', 'item': {'command': 'sleep infinity', 'dockerfile': 'Dockerfile.ubuntu', 'image':
  │   'ubuntu:22.04', 'name': 'ubuntu-instance', 'pre_build_image': False, 'tmpfs': ['/tmp', '/run']}, 'started': True, 'results_file':
  │   '/home/adminsk/.ansible_async/j285955917934.93196'})
  │ changed: [localhost] => (item={'changed': True, 'failed': False, 'finished': False, 'ansible_job_id': 'j467432630282.93217',
  │   'changed_when_result': True, 'ansible_loop_var': 'item', 'item': {'command': 'sleep infinity', 'dockerfile': 'Dockerfile.debian', 'image':
  │   'debian:bookworm-slim', 'name': 'debian-instance', 'pre_build_image': False, 'tmpfs': ['/tmp', '/run']}, 'started': True, 'results_file':
  │   '/home/adminsk/.ansible_async/j467432630282.93217'})
  │ 
  │ PLAY RECAP *********************************************************************
  │ localhost                  : ok=3    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
  │ 
  └─ Return code: 0 ─────────────────────────────────────────────────────────────────
INFO     tox ➜ destroy: Executed: Successful
INFO     tox ➜ dependency: Executing
WARNING  tox ➜ dependency: Missing roles requirements file: requirements.yml
WARNING  tox ➜ dependency: Missing collections requirements file: collections.yml
WARNING  tox ➜ dependency: Executed: 2 missing (Remove from test_sequence to suppress)
INFO     tox ➜ create: Executing
  ┌──────────────────────────────────────────────────────────────────────────────────
  │ ansible-playbook --inventory /home/adminsk/.ansible/tmp/molecule.sNUc.tox/inventory
  │   --skip-tags molecule-notest,notest
  │   /home/adminsk/ansible/05-testing/vector/.tox/py312-ansible30/lib/python3.12/site-packages/molecule_podman/playbooks/create.yml
  │ 
  │ 
  │ PLAY [Create] ******************************************************************
  │ 
  │ TASK [get podman executable path] **********************************************
  │ ok: [localhost]
  │ 
  │ TASK [save path to executable as fact] *****************************************
  │ ok: [localhost]
  │ 
  │ TASK [Set async_dir for HOME env] **********************************************
  │ [WARNING]: Deprecation warnings can be disabled by setting `deprecation_warnings=False` in ansible.cfg.
  │ [DEPRECATION WARNING]: Conditional result (True) was derived from value of type 'str' at "<environment variable 'HOME'>". Conditionals must
  │   have a boolean result. This feature will be removed from ansible-core version 2.23.
  │ Origin: /home/adminsk/ansible/05-testing/vector/.tox/py312-ansible30/lib/python3.12/site-packages/molecule_podman/playbooks/create.yml:25:13
  │ 
  │ 23       ansible.builtin.set_fact:
  │ 24         ansible_async_dir: "{{ lookup('env', 'HOME') }}/.ansible_async/"
  │ 25       when: (lookup('env', 'HOME'))
  │                ^ column 13
  │ 
  │ Broken conditionals are currently allowed because the `ALLOW_BROKEN_CONDITIONALS` configuration option is enabled.
  │ 
  │ ok: [localhost]
  │ 
  │ TASK [Log into a container registry] *******************************************
  │ skipping: [localhost] => (item=None) 
  │ skipping: [localhost] => (item=None) 
  │ skipping: [localhost]
  │ 
  │ TASK [Check presence of custom Dockerfiles] ************************************
  │ ok: [localhost] => (item=Dockerfile: Dockerfile.ubuntu)
  │ ok: [localhost] => (item=Dockerfile: Dockerfile.debian)
  │ 
  │ TASK [Create Dockerfiles from image names] *************************************
  │ changed: [localhost] => (item="Dockerfile: Dockerfile.ubuntu; Image: ubuntu:22.04")
  │ changed: [localhost] => (item="Dockerfile: Dockerfile.debian; Image: debian:bookworm-slim")
  │ 
  │ TASK [Discover local Podman images] ********************************************
  │ ok: [localhost] => (item=ubuntu-instance)
  │ ok: [localhost] => (item=debian-instance)
  │ 
  │ TASK [Build an Ansible compatible image] ***************************************
  │ changed: [localhost] => (item=ubuntu:22.04)
  │ changed: [localhost] => (item=debian:bookworm-slim)
  │ 
  │ TASK [Determine the CMD directives] ********************************************
  │ ok: [localhost] => (item="ubuntu-instance command: sleep infinity")
  │ ok: [localhost] => (item="debian-instance command: sleep infinity")
  │ 
  │ TASK [Remove possible pre-existing containers] *********************************
  │ changed: [localhost]
  │ 
  │ TASK [Discover local podman networks] ******************************************
  │ skipping: [localhost] => (item=None) 
  │ skipping: [localhost] => (item=None) 
  │ skipping: [localhost]
  │ 
  │ TASK [Create podman network dedicated to this scenario] ************************
  │ skipping: [localhost]
  │ 
  │ TASK [Create molecule instance(s)] *********************************************
  │ changed: [localhost] => (item=ubuntu-instance)
  │ changed: [localhost] => (item=debian-instance)
  │ 
  │ TASK [Wait for instance(s) creation to complete] *******************************
  │ changed: [localhost] => (item=ubuntu-instance)
  │ changed: [localhost] => (item=debian-instance)
  │ 
  │ PLAY RECAP *********************************************************************
  │ localhost                  : ok=11   changed=5    unreachable=0    failed=0    skipped=3    rescued=0    ignored=0
  │ 
  └─ Return code: 0 ─────────────────────────────────────────────────────────────────
INFO     tox ➜ create: Executed: Successful
INFO     tox ➜ converge: Executing
  ┌──────────────────────────────────────────────────────────────────────────────────
  │ ansible-playbook --inventory /home/adminsk/.ansible/tmp/molecule.sNUc.tox/inventory
  │   --skip-tags molecule-notest,notest
  │   /home/adminsk/ansible/05-testing/vector/molecule/tox/converge.yml
  │ 
  │ 
  │ PLAY [Converge] ****************************************************************
  │ 
  │ TASK [Gathering Facts] *********************************************************
  │ ok: [debian-instance]
  │ ok: [ubuntu-instance]
  │ 
  │ TASK [Include vector role] *****************************************************
  │ included: /home/adminsk/ansible/05-testing/vector for ubuntu-instance, debian-instance
  │ 
  │ TASK [/home/adminsk/ansible/05-testing/vector : Install dependencies] **********
  │ [WARNING]: Deprecation warnings can be disabled by setting `deprecation_warnings=False` in ansible.cfg.
  │ [DEPRECATION WARNING]: INJECT_FACTS_AS_VARS default to `True` is deprecated, top-level facts will not be auto injected after the change. This
  │   feature will be removed from ansible-core version 2.24.
  │ Origin: /home/adminsk/ansible/05-testing/vector/tasks/main.yml:6:9
  │ 
  │ 4     name: ["wget", "tar", "gzip"]
  │ 5     state: present
  │ 6   when: ansible_os_family == 'Debian'
  │           ^ column 9
  │ 
  │ Use `ansible_facts["fact_name"]` (no `ansible_` prefix) instead.
  │ 
  │ changed: [debian-instance]
  │ changed: [ubuntu-instance]
  │ 
  │ TASK [/home/adminsk/ansible/05-testing/vector : Create installation directory] ***
  │ changed: [ubuntu-instance]
  │ changed: [debian-instance]
  │ 
  │ TASK [/home/adminsk/ansible/05-testing/vector : Download Vector] ***************
  │ changed: [ubuntu-instance]
  │ changed: [debian-instance]
  │ 
  │ TASK [/home/adminsk/ansible/05-testing/vector : Extract Vector] ****************
  │ changed: [ubuntu-instance]
  │ changed: [debian-instance]
  │ 
  │ TASK [/home/adminsk/ansible/05-testing/vector : Install Vector binary] *********
  │ changed: [ubuntu-instance]
  │ changed: [debian-instance]
  │ 
  │ TASK [/home/adminsk/ansible/05-testing/vector : Create vector group] ***********
  │ changed: [ubuntu-instance]
  │ changed: [debian-instance]
  │ 
  │ TASK [/home/adminsk/ansible/05-testing/vector : Create vector user] ************
  │ changed: [debian-instance]
  │ changed: [ubuntu-instance]
  │ 
  │ TASK [/home/adminsk/ansible/05-testing/vector : Add vector to adm group (for log access)] ***
  │ changed: [ubuntu-instance]
  │ changed: [debian-instance]
  │ 
  │ TASK [/home/adminsk/ansible/05-testing/vector : Create directories] ************
  │ changed: [ubuntu-instance] => (item={'path': '/etc/vector'})
  │ changed: [debian-instance] => (item={'path': '/etc/vector'})
  │ changed: [ubuntu-instance] => (item={'path': '/var/lib/vector'})
  │ ok: [debian-instance] => (item={'path': '/var/lib/vector'})
  │ changed: [ubuntu-instance] => (item={'path': '/var/log/vector'})
  │ changed: [debian-instance] => (item={'path': '/var/log/vector'})
  │ 
  │ TASK [/home/adminsk/ansible/05-testing/vector : Deploy config] *****************
  │ changed: [debian-instance]
  │ changed: [ubuntu-instance]
  │ 
  │ TASK [/home/adminsk/ansible/05-testing/vector : Deploy systemd service] ********
  │ changed: [ubuntu-instance]
  │ changed: [debian-instance]
  │ 
  │ TASK [/home/adminsk/ansible/05-testing/vector : Start Vector directly] *********
  │ ok: [debian-instance]
  │ ok: [ubuntu-instance]
  │ 
  │ PLAY RECAP *********************************************************************
  │ debian-instance            : ok=14   changed=11   unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
  │ ubuntu-instance            : ok=14   changed=11   unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
  │ 
  └─ Return code: 0 ─────────────────────────────────────────────────────────────────
INFO     tox ➜ converge: Executed: Successful
INFO     tox ➜ verify: Executing
  ┌──────────────────────────────────────────────────────────────────────────────────
  │ ansible-playbook --inventory /home/adminsk/.ansible/tmp/molecule.sNUc.tox/inventory
  │   --skip-tags molecule-notest,notest
  │   /home/adminsk/ansible/05-testing/vector/molecule/tox/verify.yml
  │ 
  │ 
  │ PLAY [Verify Vector installation and configuration] ****************************
  │ 
  │ TASK [Check if Vector is running] **********************************************
  │ ok: [debian-instance]
  │ ok: [ubuntu-instance]
  │ 
  │ TASK [Display Vector status] ***************************************************
  │ ok: [debian-instance] => {
  │     "vector_status.stdout": "not running"
  │ }
  │ ok: [ubuntu-instance] => {
  │     "vector_status.stdout": "running"
  │ }
  │ 
  │ TASK [Check Vector version (дополнительно)] ************************************
  │ ok: [debian-instance]
  │ ok: [ubuntu-instance]
  │ 
  │ TASK [Print Vector version (для информации)] ***********************************
  │ ok: [debian-instance] => {
  │     "vector_version.stdout": "vector 0.48.0 (x86_64-unknown-linux-gnu a67e4e2 2025-06-30 18:25:45.272082383)"
  │ }
  │ ok: [ubuntu-instance] => {
  │     "vector_version.stdout": "vector 0.48.0 (x86_64-unknown-linux-gnu a67e4e2 2025-06-30 18:25:45.272082383)"
  │ }
  │ 
  │ PLAY RECAP *********************************************************************
  │ debian-instance            : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
  │ ubuntu-instance            : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
  │ 
  └─ Return code: 0 ─────────────────────────────────────────────────────────────────
INFO     tox ➜ verify: Executed: Successful
INFO     tox ➜ destroy: Executing
  ┌──────────────────────────────────────────────────────────────────────────────────
  │ ansible-playbook --inventory /home/adminsk/.ansible/tmp/molecule.sNUc.tox/inventory
  │   --skip-tags molecule-notest,notest
  │   /home/adminsk/ansible/05-testing/vector/.tox/py312-ansible30/lib/python3.12/site-packages/molecule_podman/playbooks/destroy.yml
  │ 
  │ 
  │ PLAY [Destroy] *****************************************************************
  │ 
  │ TASK [Set async_dir for HOME env] **********************************************
  │ [WARNING]: Deprecation warnings can be disabled by setting `deprecation_warnings=False` in ansible.cfg.
  │ [DEPRECATION WARNING]: Conditional result (True) was derived from value of type 'str' at "<environment variable 'HOME'>". Conditionals must
  │   have a boolean result. This feature will be removed from ansible-core version 2.23.
  │ Origin: /home/adminsk/ansible/05-testing/vector/.tox/py312-ansible30/lib/python3.12/site-packages/molecule_podman/playbooks/destroy.yml:14:13
  │ 
  │ 12       ansible.builtin.set_fact:
  │ 13         ansible_async_dir: "{{ lookup('env', 'HOME') }}/.ansible_async/"
  │ 14       when: (lookup('env', 'HOME'))
  │                ^ column 13
  │ 
  │ Broken conditionals are currently allowed because the `ALLOW_BROKEN_CONDITIONALS` configuration option is enabled.
  │ 
  │ ok: [localhost]
  │ 
  │ TASK [Destroy molecule instance(s)] ********************************************
  │ changed: [localhost] => (item={'command': 'sleep infinity', 'dockerfile': 'Dockerfile.ubuntu', 'image': 'ubuntu:22.04', 'name':
  │   'ubuntu-instance', 'pre_build_image': False, 'tmpfs': ['/tmp', '/run']})
  │ changed: [localhost] => (item={'command': 'sleep infinity', 'dockerfile': 'Dockerfile.debian', 'image': 'debian:bookworm-slim', 'name':
  │   'debian-instance', 'pre_build_image': False, 'tmpfs': ['/tmp', '/run']})
  │ 
  │ TASK [Wait for instance(s) deletion to complete] *******************************
  │ FAILED - RETRYING: [localhost]: Wait for instance(s) deletion to complete (299 retries left).
  │ FAILED - RETRYING: [localhost]: Wait for instance(s) deletion to complete (298 retries left).
  │ changed: [localhost] => (item={'changed': True, 'failed': False, 'finished': False, 'ansible_job_id': 'j166374977119.114258',
  │   'changed_when_result': True, 'ansible_loop_var': 'item', 'item': {'command': 'sleep infinity', 'dockerfile': 'Dockerfile.ubuntu', 'image':
  │   'ubuntu:22.04', 'name': 'ubuntu-instance', 'pre_build_image': False, 'tmpfs': ['/tmp', '/run']}, 'started': True, 'results_file':
  │   '/home/adminsk/.ansible_async/j166374977119.114258'})
  │ changed: [localhost] => (item={'changed': True, 'failed': False, 'finished': False, 'ansible_job_id': 'j666123354242.114280',
  │   'changed_when_result': True, 'ansible_loop_var': 'item', 'item': {'command': 'sleep infinity', 'dockerfile': 'Dockerfile.debian', 'image':
  │   'debian:bookworm-slim', 'name': 'debian-instance', 'pre_build_image': False, 'tmpfs': ['/tmp', '/run']}, 'started': True, 'results_file':
  │   '/home/adminsk/.ansible_async/j666123354242.114280'})
  │ 
  │ PLAY RECAP *********************************************************************
  │ localhost                  : ok=3    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
  │ 
  └─ Return code: 0 ─────────────────────────────────────────────────────────────────
INFO     tox ➜ destroy: Executed: Successful
INFO     tox ➜ scenario: Pruning extra files from scenario ephemeral directory
WARNING  Molecule executed 1 scenario (1 missing files)

DETAILS                                                                        
tox ➜ destroy: Executed: Successful
tox ➜ dependency: Executed: 2 missing (Remove from test_sequence to suppress)
tox ➜ create: Executed: Successful
tox ➜ converge: Executed: Successful
tox ➜ verify: Executed: Successful
tox ➜ destroy: Executed: Successful

SCENARIO RECAP                                                                 
tox                       : actions=6  successful=5  disabled=0  skipped=0  missing=2  failed=0

  py312-ansible30: OK (178.93=setup[14.86]+cmd[0.00,0.50,163.56] seconds)
  congratulations :) (179.02 seconds)
```
   
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
