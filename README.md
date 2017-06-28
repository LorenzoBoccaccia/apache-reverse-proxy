# Apache Reverse Proxy

A simple reverse proxy, for stateless services, useful to add basic authentication to exposed docker swarm services for testing purposes


## Usage

    docker build https://github.com/LorenzoBoccaccia/apache-reverse-proxy.git -t tos/rproxy
    docker service create --name some-name -p port:80 -e VHOSTNAME=yourdomain.example.com -e REVERSE_ADDRESS=someswarmservice:port      tos/rproxy
