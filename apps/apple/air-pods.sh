sudo nano /etc/bluetooth/main.conf

# Restricts all controllers to the specified transport. Default value
# is "dual", i.e. both BR/EDR and LE enabled (when supported by the HW).
# Possible values: "dual", "bredr", "le"
ControllerMode = bredr

sudo /etc/init.d/bluetooth restart