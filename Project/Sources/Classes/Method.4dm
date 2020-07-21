
Class constructor
	C_TEXT:C284($1)
	
	C_LONGINT:C283($methodType)
	C_POINTER:C301($tablePtr)
	C_TEXT:C284($objectName)
	C_TEXT:C284($formObjectName)
	
	
	If (Count parameters:C259>0)
		If (Position:C15("/"; $1)>0)
			This:C1470.path:=$1
			If (Position:C15("[class]"; This:C1470.path)<1)
				METHOD RESOLVE PATH:C1165(This:C1470.path; $methodType; $tablePtr; $objectName; $formObjectName)
				
				This:C1470.name:=$objectName
				This:C1470.type:=$methodType
			End if 
		Else 
			This:C1470.name:=$1
			This:C1470.path:=METHOD Get path:C1164(Path project method:K72:1; This:C1470.name)
			
			METHOD RESOLVE PATH:C1165(This:C1470.path; $methodType; $tablePtr; $objectName; $formObjectName)
			This:C1470.type:=$methodType
			
		End if 
	Else 
		This:C1470.path:=""
		This:C1470.name:=""
		This:C1470.type:=-1
	End if 
	
/*
Get method code
*/
Function code
	C_BOOLEAN:C305($1; $token)
	C_TEXT:C284($0)
	If (Count parameters:C259>0)
		$token:=$1
	Else 
		$token:=False:C215
	End if 
	
	C_TEXT:C284($code)
	If ($token)
		METHOD GET CODE:C1190(This:C1470.path; $code; Code with tokens:K72:18; *)
	Else 
		METHOD GET CODE:C1190(This:C1470.path; $code; *)
	End if 
	
	$0:=$code
	
/*
The dates and times of the last modification
*/
Function modificationDate
	C_OBJECT:C1216($0)
	C_DATE:C307($date)
	C_TIME:C306($time)
	METHOD GET MODIFICATION DATE:C1170(This:C1470.path; $date; $time)  // date and time of a single method
	
	$0:=New object:C1471("date"; $date; "time"; $time)
	
/*
Open in the 4D Method editor the method
*/
Function open
	METHOD OPEN PATH:C1213(This:C1470.path; *)
	
/*
Return all `Method` object
*/
Function static_all
	C_COLLECTION:C1488($0; $methods)
	ARRAY TEXT:C222($arrPaths; 0)
	METHOD GET PATHS:C1163(Path all objects:K72:16; $arrPaths; *)
	
	$methods:=New collection:C1472()
	C_LONGINT:C283($i)
	For ($i; 1; Size of array:C274($arrPaths); 1)
		$methods.push(classy.Method.new($arrPaths{$i}))
	End for 
	
	$0:=$methods
	
	
	
	