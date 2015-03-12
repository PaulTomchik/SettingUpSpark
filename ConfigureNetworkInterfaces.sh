if [ ! -f /etc/network/interfaces.defaults ]; then
    mv /etc/network/interfaces /etc/network/interfaces.defaults
fi


cp ./interfaces /etc/network/interfaces
chown root /etc/network/interfaces
chmod 644 /etc/network/interfaces
