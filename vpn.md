
# Vpn-туннель для RTR-EKB-01

#!/bin/bash
ip tunnel add tun1 mode gre local 200.20.20.10 remote 100.10.10.10 ttl 64
ip addr add 10.5.5.1/30 dev tun1


# Vpn-туннель для RTR-DATA-01 


#!/bin/bash
ip tunnel add tun1 mode gre local 100.10.10.10 remote 200.20.20.10 ttl 64
ip addr add 10.5.5.1/30 dev tun1

# Vpn-туннель для RTR-KRR-02