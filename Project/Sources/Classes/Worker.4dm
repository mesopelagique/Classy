Class constructor
	C_TEXT:C284($1)
	If (Count parameters:C259>0)
		This:C1470.name:=$1
	Else 
		This:C1470.name:=namify (cs:C1710.Worker)
	End if 
	
Function call
	C_VARIANT:C1683(${1})
	CALL WORKER:C1389(This:C1470.name;$1;$2;$3;$4;$5;$6;$7;$8;$9)
	
Function kill
	KILL WORKER:C1390(This:C1470.name)