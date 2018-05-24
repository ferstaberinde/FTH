// TRAFFIC - BRIDGE TELEPORT
// =========================

// Declare local variables:
private ["_mkr","_list","_vel"];

// Populate some local variables using values passed to the script:
_list = list (_this select 0);
_mkr = _this select 1;

// Teleport the objects whilst maintaining velocity:
{
	_vel = velocity _x;
	_x setPos getMarkerPos _mkr;
	_x setVelocity _vel;
} forEach _list;