# Apache Reverse Proxy

A simple reverse proxy, for stateless services, useful to add basic authentication to exposed docker swarm services for testing purposes


## Usage

  docker build https://github.com/LorenzoBoccaccia/apache-reverse-proxy.git -t tos/rproxy
  docker service create --name revereseproxy -e VHOSTNAME=yoursite.example.com -e REVERSE_ADDRESS=internalservicedns:port 
