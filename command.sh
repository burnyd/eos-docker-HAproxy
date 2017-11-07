docker run --privileged --network=host --rm -it -v /mnt/flash/haproxy.cfg:/usr/local/etc/haproxy/haproxy.cfg:ro -v /dev/log:/dev/log --name haproxy

