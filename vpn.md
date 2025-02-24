
# Vpn-туннель для RTR-EKB-01

```#!/bin/bash
ip tunnel add tun1 mode gre local 200.20.20.10 remote 100.10.10.10 ttl 64
ip link set tun1 up
ip addr add 10.5.5.1/30 dev tun1
```

# Vpn-туннель для RTR-DATA-01 

```
#!/bin/bash
ip tunnel add tun1 mode gre local 100.10.10.10 remote 200.20.20.10 ttl 64
ip link set tun1 up
ip addr add 10.5.5.2/30 dev tun1
ip tunnel add tun2 mode gre local 100.10.10.10 remote 9.9.9.10 ttl 64
ip link set tun1 up
ip addr add 10.6.6.1/30 dev tun2
```


ip в красноярск может отличаться.


# Vpn-туннель для RTR-KRR-02

```
#!/bin/bash
ip tunnel add tun1 mode gre local 9.9.9.10 remote 100.10.10.10 ttl 64
ip link set tun1 up
ip addr add 10.6.6.2/30 dev tun1
```


На выполнение скрипта нужны права - chmod +x /etc/gre.up
Для использования скрипта запуск - /etc/gre.up
