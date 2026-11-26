# Proxy reverso com Docker

Projeto da disciplina de Redes de Computadores II que simula uma rede local com Docker. Ele utiliza:

- Apache como proxy reverso.
- Balanceamento de carga entre três servidores web.
- DHCP e DNS com dnsmasq.
- Descoberta de serviços com mDNS/Avahi.

## Requisitos

- Docker
- Docker Compose

## Executando

Na pasta do projeto, execute:

```bash
docker compose up -d --build
```

O ambiente pode ser acessado pelas seguintes portas:

| Serviço | Endereço |
| --- | --- |
| Proxy reverso | http://localhost:8081/server/ |
| Servidor 2 | http://localhost:8080 |
| Servidor 3 | http://localhost:8082 |
| Servidor 4 | http://localhost:8083 |

Para verificar os containers em execução:

```bash
docker compose ps
```

Para encerrar o ambiente:

```bash
docker compose down
```

## Estrutura

- `server1-proxy/`: configuração do proxy Apache.
- `server2/`, `server3/` e `server4/`: servidores de conteúdo.
- `server-dhcp/`: configuração do DHCP/DNS.
- `server-mdns/`: configuração do mDNS/Avahi.
- `docker-compose.yaml`: definição dos containers e da rede.

## Referências

- [Documentação do Apache HTTP Server](https://httpd.apache.org/)
- [Guia de proxy reverso do Apache](https://httpd.apache.org/docs/2.4/mod/mod_proxy.html)
