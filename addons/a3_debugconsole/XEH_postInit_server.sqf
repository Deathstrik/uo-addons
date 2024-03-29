/* Load Administrators */
UO_admins = call compile ("[" + (preprocessFile "\x\uo\addons\a3_debugconsole\admins.sqf") + "]");
if(isDedicated) then {
	UO_admins_userconfig = call compile ("[" + (preprocessFile "\userconfig\uo_admins.txt") + "]");
};

if(!isNil "UO_admins_userconfig") then {
	UO_admins = UO_admins + UO_admins_userconfig;
};

publicVariable "UO_admins";
UO_trackKills = [];

UO_efnc_killed = {
	private["_killed", "_killer", "_killedData"];
	
	_killed = _this select 0;
	_killer = _this select 1;
	
	_killedData = [diag_tickTime, _killed, _killer];
	UO_trackKills set[(count UO_trackKills), _killedData];
	
	diag_log text format["Kill: {%1} -> {%2}", _killer, _killed];
};

UO_efnc_fired = {

};

