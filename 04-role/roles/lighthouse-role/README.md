# lighthouse-role

=========

## Requirements

- **Ansible**: `>= 2.14` (uses `ansible.builtin.dnf`, `unarchive` with
  `extra_opts`, and FQCN module names).
- **Target OS**: RHEL / Rocky / AlmaLinux / Fedora or any other
  distribution using the `dnf` package manager. For Debian/Ubuntu you
  will need to replace `ansible.builtin.dnf` with `ansible.builtin.apt`
  and adjust the package name (`web_server`) accordingly.
- **Internet access** from the target host (or a configured proxy/mirror)
  — the role downloads an archive from `github.com`.
- **Privileges**: run with `become: true` (root), because the role
  installs packages and writes to `/var/www` and `/etc/nginx`.
  
------------

## Role Variables

### `defaults/main.yml`

| Variable | Default | Description |
|---|---|---|
| `lighthouse_package_url` | `https://github.com/VKCOM/lighthouse/archive/refs/heads/master.tar.gz` | URL of the Lighthouse source archive. Can point to a tag, branch, or your own fork. |
| `lighthouse_tmp_tar` | `/tmp/lighthouse.tar.gz` | Path where the archive is downloaded on the target host. |
| `dir_web_server` | `/var/www/` | Root web directory where Lighthouse will be placed. |
| `dir_lighthouse` | `{{ dir_web_server }}/lighthouse` | Final directory containing the Lighthouse static files. |
| `lighthouse_config_dir` | `/etc/nginx/conf.d/` | Directory for nginx drop-in configs. |
| `lighthouse_config_file` | `{{ lighthouse_config_dir }}/lighthouse.conf` | Full path to the Lighthouse virtual host config. |

### `vars/main.yml`

| Variable | Default | Description |
|---|---|---|
| `web_server` | `nginx` | Package/service name of the web server. Used in `dnf`, `service`, and the handler. |
| `lighthouse_config_owner` | `root` | Owner of the nginx config file (and of `/var/www`). |
| `lighthouse_config_group` | `root` | Group of the nginx config file. |
| `lighthouse_config_mode` | `0644` | Permissions on the nginx config file (and, historically, on the downloaded archive). |
| `lighthouse_var_www_mode` | `0755` | Permissions on the `/var/www` directory. |

> Variables in `vars/main.yml` have higher precedence than those in
> `defaults`. You can still override them from outside (extra-vars,
> group_vars, host_vars, play `vars:`), but be aware of the precedence
> difference when reusing the role.

---

## Example Playbook

### Minimal example

```yaml
- name: Deploy Lighthouse
  hosts: servers
  become: true
  roles:
    - role: username.lighthouse-role
```
