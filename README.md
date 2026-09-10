# redes-de-computadores-II
Utilizado para realizar projetos da matéria de redes na UFRN.
## Aula 2 

- `doker --help`;
- `doker run --help`;
- https://hub.docker.com/;
- `docker pull --help`;

# Organizando o apache:
## Criar arquivo de configuração do proxy:
```bash
#para criar o arquivo httpd.conf
docker run --rm httpd:latest cat /usr/local/apache2/conf/httpd.conf > ./server1-proxy/httpd.conf

```

### Organizando o proxy no httpd.conf
Tem que retirar `#` no arquvio desses modulos:
```apache
LoadModule headers_module modules/mod_headers.so
LoadModule proxy_module modules/mod_proxy.so
LoadModule proxy_http_module modules/mod_proxy_http.so
```
Colocar no final do arquivo:
```apache
Include conf/extra/my-proxy.conf
```

 
# Materiais de Estuddos
## Links:
- [Guia Geral de Proxy do Apache](https://httpd.apache.org/docs/2.4/mod/mod_proxy.html)
- [Guia do Módulo HTTP Proxy](https://httpd.apache.org/docs/2.4/mod/mod_proxy_http.html)
