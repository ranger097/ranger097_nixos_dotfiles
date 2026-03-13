{config, pkgs, ... }: 
let 
userName = "ranger";
homeDir = config.users.users.${userName}.home;

in
{

networking.networkmanager.enable = true;
networking.networkmanager.dns = "none";
networking.useDHCP = false;
networking.dhcpcd.enable = false;
networking.nameservers = [ "127.3.2.1" ];
services.resolved.enable = false;
networking.enableIPv6 = false;
networking.firewall.checkReversePath = false;

networking.networkmanager.ensureProfiles = {
environmentFiles = ["${homeDir}/ranger097_nixos_dotfiles/wifi.env"];
profiles = {
Home = {
connection = { 
id = "$WIFI_NM";
type = "wifi";
autoconnect = true; };
wifi = {
ssid = "$WIFI_ID";
mode = "infrastructure"; };
wifi-security = { 
key-mgmt = "wpa-psk"; 
psk = "$WIFI_PW"; };
    };
  };
};

}
