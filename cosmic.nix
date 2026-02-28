{config, pkgs, ...}:{

services = {
	displayManager.cosmic-greeter.enable = false;
	desktopManager.cosmic.enable = false;
	displayManager.autoLogin = {
		enable = true;
		user = "ranger";


	};
};



}
