# Домашнее задание к занятию 11 «Teamcity»

## Подготовка к выполнению

1. В Yandex Cloud создайте новый инстанс (4CPU4RAM) на основе образа `jetbrains/teamcity-server`.
2. Дождитесь запуска teamcity, выполните первоначальную настройку.
3. Создайте ещё один инстанс (2CPU4RAM) на основе образа `jetbrains/teamcity-agent`. Пропишите к нему переменную окружения `SERVER_URL: "http://<teamcity_url>:8111"`.
4. Авторизуйте агент.
![2](https://github.com/joos-net/mnt-homeworks/blob/master/09-ci-05-teamcity/img/2.png)
5. Сделайте fork [репозитория](https://github.com/aragastmatb/example-teamcity).
6. Создайте VM (2CPU4RAM) и запустите [playbook](./infrastructure).

![1](https://github.com/joos-net/mnt-homeworks/blob/master/09-ci-05-teamcity/img/1.png)

## Основная часть

1. Создайте новый проект в teamcity на основе fork.
2. Сделайте autodetect конфигурации.
![3](https://github.com/joos-net/mnt-homeworks/blob/master/09-ci-05-teamcity/img/3.png)
3. Сохраните необходимые шаги, запустите первую сборку master.
![4](https://github.com/joos-net/mnt-homeworks/blob/master/09-ci-05-teamcity/img/4.png)
4. Поменяйте условия сборки: если сборка по ветке `master`, то должен происходит `mvn clean deploy`, иначе `mvn clean test`.
![5](https://github.com/joos-net/mnt-homeworks/blob/master/09-ci-05-teamcity/img/5.png)
5. Для deploy будет необходимо загрузить [settings.xml](./teamcity/settings.xml) в набор конфигураций maven у teamcity, предварительно записав туда креды для подключения к nexus.
6. В pom.xml необходимо поменять ссылки на репозиторий и nexus.
7. Запустите сборку по master, убедитесь, что всё прошло успешно и артефакт появился в nexus.
![6](https://github.com/joos-net/mnt-homeworks/blob/master/09-ci-05-teamcity/img/6.png)
![7](https://github.com/joos-net/mnt-homeworks/blob/master/09-ci-05-teamcity/img/7.png)
9. Мигрируйте `build configuration` в репозиторий.
![8](https://github.com/joos-net/mnt-homeworks/blob/master/09-ci-05-teamcity/img/8.png)
![9](https://github.com/joos-net/mnt-homeworks/blob/master/09-ci-05-teamcity/img/9.png)
10. Создайте отдельную ветку `feature/add_reply` в репозитории.
![10](https://github.com/joos-net/mnt-homeworks/blob/master/09-ci-05-teamcity/img/10.png)
11. Напишите новый метод для класса Welcomer: метод должен возвращать произвольную реплику, содержащую слово `hunter`.
![11](https://github.com/joos-net/mnt-homeworks/blob/master/09-ci-05-teamcity/img/11.png)
12. Дополните тест для нового метода на поиск слова `hunter` в новой реплике.
![12](https://github.com/joos-net/mnt-homeworks/blob/master/09-ci-05-teamcity/img/12.png)
13. Сделайте push всех изменений в новую ветку репозитория.
![13](https://github.com/joos-net/mnt-homeworks/blob/master/09-ci-05-teamcity/img/13.png)
14. Убедитесь, что сборка самостоятельно запустилась, тесты прошли успешно.
![14](https://github.com/joos-net/mnt-homeworks/blob/master/09-ci-05-teamcity/img/14.png)
15. Внесите изменения из произвольной ветки `feature/add_reply` в `master` через `Merge`.
![16](https://github.com/joos-net/mnt-homeworks/blob/master/09-ci-05-teamcity/img/16.png)
16. Убедитесь, что нет собранного артефакта в сборке по ветке `master`.
![17](https://github.com/joos-net/mnt-homeworks/blob/master/09-ci-05-teamcity/img/17.png)
17. Настройте конфигурацию так, чтобы она собирала `.jar` в артефакты сборки.
![18](https://github.com/joos-net/mnt-homeworks/blob/master/09-ci-05-teamcity/img/18.png)
18. Проведите повторную сборку мастера, убедитесь, что сбора прошла успешно и артефакты собраны.
![19](https://github.com/joos-net/mnt-homeworks/blob/master/09-ci-05-teamcity/img/19.png)
19. Проверьте, что конфигурация в репозитории содержит все настройки конфигурации из teamcity.
![20](https://github.com/joos-net/mnt-homeworks/blob/master/09-ci-05-teamcity/img/20.png)
20. В ответе пришлите ссылку на репозиторий.

https://github.com/jo-os/teamcity

---

### Как оформить решение задания

Выполненное домашнее задание пришлите в виде ссылки на .md-файл в вашем репозитории.

---
