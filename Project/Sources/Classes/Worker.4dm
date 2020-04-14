Class constructor
	C_TEXT:C284($1)
	If (Count parameters:C259>0)
		This:C1470.name:=$1
	Else 
		This:C1470.name:=namify (cs:C1710.Worker)
	End if 
	
	Use (cs:C1710.Worker)
		If (cs:C1710.Worker.list=Null:C1517)
			cs:C1710.Worker.list:=New shared collection:C1527(This:C1470.name)
		Else 
			If (cs:C1710.Worker.list.indexOf(This:C1470.name)<0)  // use as set
				cs:C1710.Worker.list.push(This:C1470.name)
			End if 
		End if 
	End use 
	
Function call
	C_VARIANT:C1683(${1})
	C_LONGINT:C283($argc)
	$argc:=Count parameters:C259
	Case of 
		: (Value type:C1509($1)=Is text:K8:3)
			Case of 
				: ($argc=1)
					CALL WORKER:C1389(This:C1470.name;$1)
				: ($argc=2)
					CALL WORKER:C1389(This:C1470.name;$1;$2)
				: ($argc=3)
					CALL WORKER:C1389(This:C1470.name;$1;$2;$3)
				: ($argc=4)
					CALL WORKER:C1389(This:C1470.name;$1;$2;$3;$4)
				: ($argc=5)
					CALL WORKER:C1389(This:C1470.name;$1;$2;$3;$4;$5)
				: ($argc=6)
					CALL WORKER:C1389(This:C1470.name;$1;$2;$3;$4;$5;$6)
				: ($argc=7)
					CALL WORKER:C1389(This:C1470.name;$1;$2;$3;$4;$5;$6;$7)
				: ($argc=8)
					CALL WORKER:C1389(This:C1470.name;$1;$2;$3;$4;$5;$6;$7;$8)
				: ($argc=9)
					CALL WORKER:C1389(This:C1470.name;$1;$2;$3;$4;$5;$6;$7;$8;$9)
				Else 
					ASSERT:C1129(False:C215;"More parameters not supported")
			End case 
		: (Value type:C1509($1)=Is object:K8:27)
			Case of 
				: ($argc=2)
					CALL WORKER:C1389(This:C1470.name;"callOnInstance";$1;$2)
				: ($argc=3)
					CALL WORKER:C1389(This:C1470.name;"callOnInstance";$1;$2;$3)
				: ($argc=4)
					CALL WORKER:C1389(This:C1470.name;"callOnInstance";$1;$2;$3;$4)
				: ($argc=5)
					CALL WORKER:C1389(This:C1470.name;"callOnInstance";$1;$2;$3;$4;$5)
				: ($argc=6)
					CALL WORKER:C1389(This:C1470.name;"callOnInstance";$1;$2;$3;$4;$5;$6)
				: ($argc=7)
					CALL WORKER:C1389(This:C1470.name;"callOnInstance";$1;$2;$3;$4;$5;$6;$7)
				: ($argc=8)
					CALL WORKER:C1389(This:C1470.name;"callOnInstance";$1;$2;$3;$4;$5;$6;$7;$8)
				: ($argc=9)
					CALL WORKER:C1389(This:C1470.name;"callOnInstance";$1;$2;$3;$4;$5;$6;$7;$8;$9)
				Else 
					ASSERT:C1129(False:C215;"More parameters not supported")
			End case 
		Else 
			ASSERT:C1129(False:C215;"Invalid first parameter type "+String:C10(Value type:C1509($1)))
	End case 
	
Function kill
	Use (cs:C1710.Worker)
		C_LONGINT:C283($index)
		$index:=cs:C1710.Worker.list.indexOf(This:C1470.name)
		If ($index>=0)  // use as set
			cs:C1710.Worker.list.remove($index)
		End if 
	End use 
	KILL WORKER:C1390(This:C1470.name)