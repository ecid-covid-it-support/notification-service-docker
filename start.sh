#!/usr/bin/env sh

# Export private key and SSL certificate to P12 keystore
echo "Generating keystore"
openssl pkcs12 -export -in ${SSL_CERT_PATH} -inkey ${SSL_KEY_PATH} -out /etc/.certs/tmp_keystore.p12 -passout pass:admin123 -name notification
echo "Generating truststore"
keytool -import -file ${SSL_CERT_PATH} -alias notification -keystore /usr/lib/jvm/java-1.8-openjdk/jre/lib/security/cacerts -noprompt -storepass changeit


echo "Starting notification APP"
java -jar OCARIoT-1.0-SNAPSHOT.jar
