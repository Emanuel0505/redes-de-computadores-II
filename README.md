# Criando um Proxy-Reverso
Na primeira parte da matéria de redes foi pedido para realizar um proxy reverso. Desse modo foi usado nesse projeto o servidor web ["APACHE"](https://httpd.apache.org/).

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
Colocar no final do arquivo:
```apache
Include conf/extra/my-proxy.conf
```

#### Balanceamento de Carga
É preciso habilitar os modulos:
```apache
LoadModule proxy_balancer_module modules/mod_proxy_balancer.so
LoadModule slotmem_shm_module modules/mod_slotmem_shm.so
LoadModule lbmethod_byrequests_module modules/mod_lbmethod_byrequests.so
```
##### Forçar o server a fechar a conexão com o servidor Back-end
```apache
    SetEnv proxy-nokeepalive 1
```

# Docker
para a simulação de varios servidores.
 
# Materiais de Estuddos
## Links:
- [Guia Geral de Proxy do Apache](https://httpd.apache.org/docs/2.4/mod/mod_proxy.html)
- [Guia do Módulo HTTP Proxy](https://httpd.apache.org/docs/2.4/mod/mod_proxy_http.html)
