#!bin /bash
apt install fail2ban
echo -e "[sshd]\nenabled = true\nport = 22\nfilter = sshd\nlogpath = /var/log/auth.log\nmaxretry = 3\nbantime = 600\nignoreip = 192.168.100.10/24 10.15.10.10/24" >> /etc/fail2ban/jail.conf
systemctl restart fail2ban