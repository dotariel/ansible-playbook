## Description

This container is configured with Ansible and is suited for testing playbooks 
intended to run locally on Linux systems based on Centos 7.

#### Volumes

| Volume       | Description                                                     |
|:-------------|:----------------------------------------------------------------|
| /project     | Directory containing the playbook                               |
| /vault       | Directory containing the vault password file (/vault/password)  |


#### Environment Variables

| Variable     | Description                            | Default    | Example         |
|:-------------|:---------------------------------------|:-----------|:----------------|
| PLAYBOOK     | Playbook file to execute               | site.yml   | my_playbook.yml |
| EXTRA_VARS   | Extra variables for ansible-playbook   |            | foo=bar         |
| VERBOSITY    | Verbosity level for ansible-playbook   |            | -vvvv           |


### Build Instructions
    docker build -t ansible-playbook repositories/ansible-playbook
---

### Simple usage
    docker run -v /home/user:/project -it ansible-playbook
---

### Run a specific playbook

The following example demonstrates running a playbook located at `/home/user/test.yml`:

    docker run -v /home/user:/project -e PLAYBOOK=test.yml -it ansible-playbook

---

### Run playbook with --extra-vars
    docker run -v /home/user:/project -e EXTRA_VARS='{ "foo": "bar" }' -it ansible-playbook
---

### Run container with vault encryption
    docker run -v /home/user:/project -v /home/vault:/vault -it ansible-playbook
---

### Run container without executing playbook
In order to run the container without executing the playbook, start the container with
the `norun` flag.

    docker run -v /home/user:/project -it ansible-playbook norun
