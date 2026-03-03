{config, pkgs, ... }: {

networking.networkManager.dns = "none";
networking.useDHCP = false;
networking.dhcpcd.enable = false;
networking.nameservers = [
  "1.1.1.1"
  "1.0.0.1"
];

networking.networkManager.ensureProfiles = {
   environmentFiles = ["./wifi.env"];
   profiles = {
      Home = {
         connection = { id = "$WIFI_ID_HOME"; type = "wifi"; };
         wifi-security = { key-mgmt = "wpa-psk"; psk = "WIFI_PW_HOME"; };
      };
    };

};

}
