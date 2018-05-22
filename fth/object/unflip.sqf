// OBJECT - UNFLIP
// ===============

_vehicle = _this select 0;
_vehicle allowDamage false;
_vehicle setvectorup [0,0,1];
sleep 1;
_vehicle allowDamage true;