# Настройка защищенного туннеля для роутеров.

## Настройка для RTR-EKB01
```
#!/bin/bash 
echo -e "conn vpn \n\tauto=start\n\ttype=tunnel\n\tauthby=secret\n\tleft=200.20.20.10\n\tright=100.10.10.10\n\tleftsubnet=0.0.0.0/0\n\trightsubnet=0.0.0.0/0\n\tleftprotoport=gre\n\trightprotoport=gre\n\tike=aes128-sha256-modp3072\n\tesp=aes128-sha256" >> /etc/ipsec.conf
```

## Настройка между RTR-DATA1 для RTR-EKB01
```
#!/bin/bash 
echo -e "conn vpn \n\tauto=start\n\ttype=tunnel\n\tauthby=secret\n\tleft=100.10.10.10\n\tright=200.20.20.10\n\tleftsubnet=0.0.0.0/0\n\trightsubnet=0.0.0.0/0\n\tleftprotoport=gre\n\trightprotoport=gre\n\tike=aes128-sha256-modp3072\n\tesp=aes128-sha256" >> /etc/ipsec.conf

```
## Настройка RTR-DATA1 для RTR-KRR1
```
#!/bin/bash 
echo -e "conn vpn2 \n\tauto=start\n\ttype=tunnel\n\tauthby=secret\n\tleft=200.20.20.10\n\tright=9.9.9.10\n\tleftsubnet=0.0.0.0/0\n\trightsubnet=0.0.0.0/0\n\tleftprotoport=gre\n\trightprotoport=gre\n\tike=aes128-sha256-modp3072\n\tesp=aes128-sha256" >> /etc/ipsec.conf

```
## Настройка RTR-KRR 
```
#!/bin/bash 
echo -e "conn vpn \n\tauto=start\n\ttype=tunnel\n\tauthby=secret\n\tleft=9.9.9.10\n\tright=200.20.20.10\n\tleftsubnet=0.0.0.0/0\n\trightsubnet=0.0.0.0/0\n\tleftprotoport=gre\n\trightprotoport=gre\n\tike=aes128-sha256-modp3072\n\tesp=aes128-sha256" >> /etc/ipsec.conf
```
