# redes-de-computadores-II
Utilizado para realizar projetos da matéria de redes na UFRN.

# Organizando o apache:
## Criar arquivo de configuração do proxy:
```bash
#para criar o arquivo httpd.conf
docker run --rm httpd:latest cat /usr/local/apache2/conf/httpd.conf > ./server1-proxy/httpd.conf

```

### Organizando o proxy no httpd.conf
Tem que retirar `#` no arquvio.
#### Padrão
```apache
LoadModule headers_module modules/mod_headers.so
LoadModule proxy_module modules/mod_proxy.so
LoadModule proxy_http_module modules/mod_proxy_http.so
```
__Colocar no final do arquivo__:
```apache
Include conf/extra/my-proxy.conf
```

#### Balanceamento de Carga


 
# Materiais de Estuddos
## Links:
- [Guia Geral de Proxy do Apache](https://httpd.apache.org/docs/2.4/mod/mod_proxy.html)
- [Guia do Módulo HTTP Proxy](https://httpd.apache.org/docs/2.4/mod/mod_proxy_http.html)
