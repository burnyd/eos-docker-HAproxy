![Alt text](background.png.jpg?raw=true "HAproxy on EOS as a container")

How to run a HAproxy docker container on Arista EOS as a reverse proxy.

This is a simple example of running a load balancer on a switch to proxy all web connections to two servers connected to it.  In this example we are using HAproxy as a container which is running in both --host network and --priveledged mode so it can talk directly to the kernel.  So any web traffic that wants to connect to the switch on port 8888 will be redirected to either host1 or host2 on port 5000.

All haproxy,ansible and bash scripts are located in the scripts folder. 

