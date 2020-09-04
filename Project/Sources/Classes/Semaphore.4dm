Class constructor
	C_TEXT:C284($1)
	If (Count parameters:C259>0)
		This:C1470.name:=$1
	Else 
		This:C1470.name:=namify (cs:C1710.Semaphore)
	End if 
	
Function acquire
	C_BOOLEAN:C305($0)
	C_LONGINT:C283($1)
	If (Count parameters:C259>0)
		$0:=Semaphore:C143(This:C1470.name;$1)
	Else 
		$0:=Semaphore:C143(This:C1470.name)
	End if 
	
Function test
	C_BOOLEAN:C305($0)
	$0:=Test semaphore:C652(This:C1470.name)
	
Function release
	CLEAR SEMAPHORE:C144(This:C1470.name)
