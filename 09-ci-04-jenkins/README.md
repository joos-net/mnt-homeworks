# Домашнее задание к занятию 10 «Jenkins»

## Подготовка к выполнению

1. Создать два VM: для jenkins-master и jenkins-agent.
2. Установить Jenkins при помощи playbook.
3. Запустить и проверить работоспособность.
4. Сделать первоначальную настройку.

## Основная часть

1. Сделать Freestyle Job, который будет запускать `molecule test` из любого вашего репозитория с ролью.

![11](https://github.com/joos-net/mnt-homeworks/blob/master/09-ci-04-jenkins/img/11.png)
![12](https://github.com/joos-net/mnt-homeworks/blob/master/09-ci-04-jenkins/img/12.png)
![13](https://github.com/joos-net/mnt-homeworks/blob/master/09-ci-04-jenkins/img/13.png)

2. Сделать Declarative Pipeline Job, который будет запускать `molecule test` из любого вашего репозитория с ролью.

![21](https://github.com/joos-net/mnt-homeworks/blob/master/09-ci-04-jenkins/img/21.png)
![22](https://github.com/joos-net/mnt-homeworks/blob/master/09-ci-04-jenkins/img/22.png)
![23](https://github.com/joos-net/mnt-homeworks/blob/master/09-ci-04-jenkins/img/23.png)

3. Перенести Declarative Pipeline в репозиторий в файл `Jenkinsfile`.

![31](https://github.com/joos-net/mnt-homeworks/blob/master/09-ci-04-jenkins/img/31.png)
![32](https://github.com/joos-net/mnt-homeworks/blob/master/09-ci-04-jenkins/img/32.png)

4. Создать Multibranch Pipeline на запуск `Jenkinsfile` из репозитория.

![42](https://github.com/joos-net/mnt-homeworks/blob/master/09-ci-04-jenkins/img/42.png)
![43](https://github.com/joos-net/mnt-homeworks/blob/master/09-ci-04-jenkins/img/43.png)
![44](https://github.com/joos-net/mnt-homeworks/blob/master/09-ci-04-jenkins/img/44.png)
![45](https://github.com/joos-net/mnt-homeworks/blob/master/09-ci-04-jenkins/img/45.png)

5. Создать Scripted Pipeline, наполнить его скриптом из [pipeline](./pipeline).
6. Внести необходимые изменения, чтобы Pipeline запускал `ansible-playbook` без флагов `--check --diff`, если не установлен параметр при запуске джобы (prod_run = True). По умолчанию параметр имеет значение False и запускает прогон с флагами `--check --diff`.

![51](https://github.com/joos-net/mnt-homeworks/blob/master/09-ci-04-jenkins/img/51.png)
![52](https://github.com/joos-net/mnt-homeworks/blob/master/09-ci-04-jenkins/img/52.png)
![53](https://github.com/joos-net/mnt-homeworks/blob/master/09-ci-04-jenkins/img/53.png)
![54](https://github.com/joos-net/mnt-homeworks/blob/master/09-ci-04-jenkins/img/54.png)

7. Проверить работоспособность, исправить ошибки, исправленный Pipeline вложить в репозиторий в файл `ScriptedJenkinsfile`.
8. Отправить ссылку на репозиторий с ролью и Declarative Pipeline и Scripted Pipeline.

[Репозиторий](https://github.com/joos-net/nginx-role)

9. Сопроводите процесс настройки скриншотами для каждого пункта задания!!

## Необязательная часть

1. Создать скрипт на groovy, который будет собирать все Job, завершившиеся хотя бы раз неуспешно. Добавить скрипт в репозиторий с решением и названием `AllJobFailure.groovy`.

[AllJobFailure.groovy](https://github.com/joos-net/mnt-homeworks/blob/master/09-ci-04-jenkins/AllJobFailure.groovy)

![g1](https://github.com/joos-net/mnt-homeworks/blob/master/09-ci-04-jenkins/img/g1.png)
![g2](https://github.com/joos-net/mnt-homeworks/blob/master/09-ci-04-jenkins/img/g2.png)

2. Создать Scripted Pipeline так, чтобы он мог сначала запустить через Yandex Cloud CLI необходимое количество инстансов, прописать их в инвентори плейбука и после этого запускать плейбук. Мы должны при нажатии кнопки получить готовую к использованию систему.

```yml
node("yandex"){
        stage("Create VM"){
        sh '''#!/bin/bash
        for ((i=1;i<=$count;i++)); do yc compute instance create \
  --name vm-$i \
  --zone ru-central1-b \
  --network-interface subnet-name=subnet1,nat-ip-version=ipv4 \
  --create-boot-disk image-folder-id=standard-images,image-family=centos-7 \
  --ssh-key ~/.ssh/id_rsa.pub; done'''
        }
        stage("Git"){
            git url: 'https://github.com/joos-net/nginx-role.git'
            sh 'ls -la'
        }
        stage("Inventory"){
            sh '''#!/bin/bash
            for ((i=1;i<=$count;i++)); do yc compute instance get --name vm-$i | grep address | tail -n 1 | sed s/address:// | sed 's/ //g' >> hosts; done'''
            sh 'cat hosts'
            sh 'sleep 30'
        }
        stage("Ansible"){
            sh 'ansible-playbook ping.yml'
        }
}
```
![y1](https://github.com/joos-net/mnt-homeworks/blob/master/09-ci-04-jenkins/img/y1.png)
![y2](https://github.com/joos-net/mnt-homeworks/blob/master/09-ci-04-jenkins/img/y2.png)
![y3](https://github.com/joos-net/mnt-homeworks/blob/master/09-ci-04-jenkins/img/y3.png)
![y4](https://github.com/joos-net/mnt-homeworks/blob/master/09-ci-04-jenkins/img/y4.png)

---

### Как оформить решение задания

Выполненное домашнее задание пришлите в виде ссылки на .md-файл в вашем репозитории.

---
