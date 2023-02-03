# n2n-docker


use this command to setup a n2n server:

`docker run -d --restart=always --name n2n -p 53326:53326/udp xxyxd/n2n supernode -f -p 53326 -a 172.16.0.0-172.32.255.0/24 -M`
