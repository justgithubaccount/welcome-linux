# Генерим ключи (private и public)
ssh-keygen -t rsa -b 4096 -m PEM  \
    -C "[Here 100 BTC + 1000 ETH]" \
    -f $HOME/.ssh/fun/btc-wallet

# Конвертим public ключ в нужный формат PKCS#8
# (openssl не поддерживает формат public ключа который генерится через ssh-keygen)
ssh-keygen -f $HOME/.ssh/fun/btc-wallet.pub -e -m PKCS8 \
    > $HOME/.ssh/fun/btc-wallet-convert.pub

# Шифруем сообщение с помощью public ключа (btc-wallet-convert.pub)
openssl pkeyutl \
    -encrypt \
    -pubin -inkey $HOME/.ssh/fun/btc-wallet-convert.pub \
    -in $HOME/.ssh/fun/crypto-msg.txt \
    -out $HOME/.ssh/fun/encrypto-msg.txt

# Расшифровываем c помощью private ключа (btc-wallet)
openssl pkeyutl \
    -decrypt -inkey $HOME/.ssh/fun/btc-wallet \
    -in $HOME/.ssh/fun/encrypto-msg.txt \
    -out $HOME/.ssh/fun/decrypto-msg.txt