# vector-role
=========

An Ansible role that installs and configures [Vector](https://vector.dev/) — a tool for collecting, transforming and shipping logs and metrics.
The role downloads and installs the Vector RPM package of a given version, deploys `vector.toml` from a Jinja2 template, configures a ClickHouse sink for logs, and restarts the `vector` service when the package or config changes.

## Requirements
------------

- Ansible >= 2.14
- Target hosts running RHEL/CentOS/Fedora/AlmaLinux/Rocky — the role uses the `dnf` module, so Debian/Ubuntu hosts are not supported as-is.

Role Variables
--------------

### defaults/main.yml

| Variable | Default | Description |
|---|---|---|
| `vector_version` | `"0.38.0"` | Vector version to install |
| `vector_package_url` | `https://packages.timber.io/vector/{{ vector_version }}/vector-{{ vector_version }}-1.{{ ansible_architecture }}.rpm` | RPM package URL |
| `vector_config_dir` | `/etc/vector` | Configuration directory |
| `vector_config_file` | `{{ vector_config_dir }}/vector.toml` | Path to the config file |
| `vector_clickhouse_table` | `events` | Table for logs |

### vars/main.yml 

| Variable | Value | Description |
|---|---|---|
| `vector_service_name` | `vector` | systemd unit name |
| `vector_package_name` | `vector` | package name |
| `vector_tmp_rpm` | `/var/tmp/vector-{{ vector_version }}.rpm` | Temporary RPM path |
| `vector_config_owner` | `root` | Config file owner |
| `vector_config_group` | `root` | Config file group |
| `vector_config_mode` | `0644` | Config file permissions |

Dependencies
------------

None.

Example Playbook
----------------

Minimal usage with all defaults:

```yaml
- name: Install Vector
  hosts: vector
  roles:
    - vector-role
```

Installing the role from a git repository via `requirements.yml`:

```yaml
---
- src: git@github.com:yourname/vector-role.git
  scm: git
  version: "main"
  name: vector-role
```

```bash
ansible-galaxy role install -r requirements.yml -p roles/
```

### Tags

The role is tagged for selective execution:

| Tag | What it does |
|---|---|
| `vector` | The whole role |
| `vector-install` | Download and install the package |
| `vector-config` | Deploy `vector.toml` |
| `vector-service` | Apply handlers (restart the service) |

```bash
ansible-playbook site.yml --tags vector-install
ansible-playbook site.yml --tags vector-install,vector-config
ansible-playbook site.yml --tags vector
```

### Handlers

| Handler | Triggered when |
|---|---|
| `Restart vector service` | The package is installed or `vector.toml` changes |

### Configuration template

The config is rendered from `templates/vector.toml.j2`. Example output:

```toml
# Vector configuration
# Managed by Ansible — do not edit manually
# Host: {{ inventory_hostname }}

data_dir = "/var/lib/vector"

[sources.journald_logs]
type = "journald"
read_from = "beginning"

[sources.app_logs]
type = "file"
include = ["/var/log/*.log"]
ignore_older_secs = 86400

[sinks.stdout]
type = "console"
inputs = ["journald_logs", "app_logs"]
encoding.codec = "json"

[sinks.clickhouse]
type = "clickhouse"
inputs = ["app_logs"]
endpoint = "http://127.0.0.1:8123"
database = "logs"
table = "{{ vector_clickhouse_table | default('events') }}"
```

License
-------

MIT
