# SSLPoke
## Usage
```
docker run dalbotex/sslpoke google.com
```

## Environment Variables
* `TRUST_STORE_PATH`: `javax.net.ssl.trustStore` (Default: `/opt/sslpoke/truststore.jks`)
* `TRUST_STORE_PASSWORD`: `javax.net.ssl.trustStorePassword`
* `KEY_STORE_PATH`: `javax.net.ssl.keyStore` (Default: `/opt/sslpoke/keystore.jks`)
* `KEY_STORE_PASSWORD`: `javax.net.ssl.keyStorePassword`
* `DEBUG`: `javax.net.debug` (Default: `ssl,handshake,record`)
