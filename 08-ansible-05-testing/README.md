# Домашнее задание к занятию 5 «Тестирование roles»

## Подготовка к выполнению

1. Установите molecule и его драйвера: `pip3 install "molecule molecule_docker molecule_podman`.
2. Выполните `docker pull aragast/netology:latest` —  это образ с podman, tox и несколькими пайтонами (3.7 и 3.9) внутри.

## Основная часть

Ваша цель — настроить тестирование ваших ролей. 

Задача — сделать сценарии тестирования для vector. 

Ожидаемый результат — все сценарии успешно проходят тестирование ролей.

### Molecule

1. Запустите  `molecule test -s ubuntu_xenial` (или с любым другим сценарием, не имеет значения) внутри корневой директории clickhouse-role, посмотрите на вывод команды. Данная команда может отработать с ошибками или не отработать вовсе, это нормально. Наша цель - посмотреть как другие в реальном мире используют молекулу И из чего может состоять сценарий тестирования.

![1](https://github.com/joos-net/mnt-homeworks/blob/master/08-ansible-05-testing/img/1.png)

2. Перейдите в каталог с ролью vector-role и создайте сценарий тестирования по умолчанию при помощи `molecule init scenario --driver-name docker`.

![2](https://github.com/joos-net/mnt-homeworks/blob/master/08-ansible-05-testing/img/2.png)

3. Добавьте несколько разных дистрибутивов (oraclelinux:8, ubuntu:latest) для инстансов и протестируйте роль, исправьте найденные ошибки, если они есть.

![3](https://github.com/joos-net/mnt-homeworks/blob/master/08-ansible-05-testing/img/3.png)
![4](https://github.com/joos-net/mnt-homeworks/blob/master/08-ansible-05-testing/img/4.png)
![5](https://github.com/joos-net/mnt-homeworks/blob/master/08-ansible-05-testing/img/5.png)

4. Добавьте несколько assert в verify.yml-файл для  проверки работоспособности vector-role (проверка, что конфиг валидный, проверка успешности запуска и др.). 
5. Запустите тестирование роли повторно и проверьте, что оно прошло успешно.

![6](https://github.com/joos-net/mnt-homeworks/blob/master/08-ansible-05-testing/img/6.png)

6. Добавьте новый тег на коммит с рабочим сценарием в соответствии с семантическим версионированием.

[2.1.0 - molecule](https://github.com/joos-net/mnt-homeworks/tree/2.1.0/08-ansible-05-testing/playbook/roles/vector-role/molecule/default)

### Tox

1. Добавьте в директорию с vector-role файлы из [директории](./example).
2. Запустите `docker run --privileged=True -v <path_to_repo>:/opt/vector-role -w /opt/vector-role -it aragast/netology:latest /bin/bash`, где path_to_repo — путь до корня репозитория с vector-role на вашей файловой системе.
3. Внутри контейнера выполните команду `tox`, посмотрите на вывод.

![tox1](https://github.com/joos-net/mnt-homeworks/blob/master/08-ansible-05-testing/img/tox1.png)

4. Создайте облегчённый сценарий для `molecule` с драйвером `molecule_podman`. Проверьте его на исполнимость.

![tox2](https://github.com/joos-net/mnt-homeworks/blob/master/08-ansible-05-testing/img/tox2.png)
![tox3](https://github.com/joos-net/mnt-homeworks/blob/master/08-ansible-05-testing/img/tox3.png)

5. Пропишите правильную команду в `tox.ini`, чтобы запускался облегчённый сценарий.
6. Запустите команду `tox`. Убедитесь, что всё отработало успешно.

![tox4](https://github.com/joos-net/mnt-homeworks/blob/master/08-ansible-05-testing/img/tox4.png)
![tox5](https://github.com/joos-net/mnt-homeworks/blob/master/08-ansible-05-testing/img/tox5.png)

7. Добавьте новый тег на коммит с рабочим сценарием в соответствии с семантическим версионированием.

[2.2.0 - tox](https://github.com/joos-net/mnt-homeworks/tree/2.2.0/08-ansible-05-testing/playbook/roles/vector-role/molecule/tox)

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
