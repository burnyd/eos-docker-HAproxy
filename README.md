![Alt text](background.jpg?raw=true "HAprox")
How to run a HAproxy docker container on Arista EOS as a reverse proxy.

This is a simple example of running a load balancer on a switch to proxy all web connections to two servers connected to it.  In this example we are using HAproxy as a container which is running in both --host network and --priveledged mode so it can talk directly to the kernel.  So any web traffic that wants to connect to the switch on port 8888 will be redirected to either host1 or host2 on port 5000.  Both hosts are running small flask apps that return the hostname and IP that they are use to reverse proxy to.

All haproxy,ansible and bash scripts are located in the scripts folder. 

Instructions..

git clone github.com/burnyd/eos-docker-haproxy 
cd eos-docker-haproxy 

vagrant up leaf1a spine1 spine2 mgt1 host1 host2
 vagrant ssh mgt1
 cd /vagrant/scripts/ansible/
 ansible-playbook leaf_bgp.yaml spine_bgp.yaml mgt1.yaml #Password is vagrant 

disconnect from mgt1
vagrant ssh leaf1a
sudo su 
docker service start

docker run --privileged --network=host --rm -it -v /mnt/flash/haproxy.cfg:/usr/local/etc/haproxy/haproxy.cfg:ro -v /dev/log:/dev/log haproxy &

vagrant@mgt1:~$ curl leaf1a:8888/hostname/
Web connection from host1 to 10.0.5.2

vagrant@mgt1:~$ curl leaf1a:8888/hostname/
Web connection from host2 to 10.0.5.2
