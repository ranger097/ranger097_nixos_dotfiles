{config, pkgs, ... }: {

networking.networkmanager.enable = true;
networking.networkmanager.dns = "none";
networking.useDHCP = false;
networking.dhcpcd.enable = false;
networking.nameservers = [
  "1.1.1.1"
  "1.0.0.1"
];

networking.networkmanager.ensureProfiles = {
   environmentFiles = ["/home/ranger/ranger097_nixos_dotfiles/wifi.env"];
   profiles = {
      Home = {
         connection = { 
	    id = "$WIFI_NM"; 
	    type = "wifi";
            autoconnect = true; 
	 };
         wifi = {
            ssid = "$WIFI_ID";
            mode = "infrastructure";
	 };

	  wifi-security = { 
	    key-mgmt = "wpa-psk"; 
	    psk = "$WIFI_PW"; 
	 };
      };
    };

};

}
