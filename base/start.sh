#!/bin/bash
set -e

new_user(){
    useradd -rm -d /home/"${USUARIO}" -s /bin/bash "${USUARIO}"
    echo "${USUARIO}:${PASSWD}" | chpasswd
}

config_Sudoers(){
    echo "${USUARIO} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
}

config_ssh() {
    sed -i 's/#Port 22/Port 22/' /etc/ssh/sshd_config
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
    if [ ! -d /home/${USUARIO}/.ssh ]
    then
        mkdir /home/${USUARIO}/.ssh
        cat /root/id_rsa.pub >> /home/${USUARIO}/.ssh/authorized_keys
    fi
    service ssh restart
}

main() {
    new_user
    config_Sudoers
    config_ssh
}

main
tail -f /dev/null
