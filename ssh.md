## Создание пользователя sshuser
`sudo adduser sshuser` Astra
`adduser sshuser` Debian

## Доступ к ssh только для однонго юзера.
`sudo echo "AllowUser sshuser" >> /etc/ssh/sshd.conf` Debian
`echo "AllowUser sshuser" >> /etc/ssh/sshd.conf` Astra
