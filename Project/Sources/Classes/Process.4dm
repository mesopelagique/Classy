Class constructor
	C_VARIANT:C1683($1)
	If (Count parameters:C259>1)
		Case of 
			: (Value type:C1509($1)=Is longint:K8:6)
				This:C1470.id:=$1
			: (Value type:C1509($1)=Is text:K8:3)
				This:C1470.id:=Process number:C372($1)
			Else 
				ASSERT:C1129(False:C215;"Wront type for process")
		End case 
	Else 
		This:C1470.id:=Current process:C322
	End if 
	
/*
https://doc.4d.com/4Dv17/4D/17.4/Process-state.301-4882769.en.html
*/
Function state
	C_LONGINT:C283($0)
	$0:=Process state:C330(This:C1470.id)
	
/*
https://doc.4d.com/4Dv17/4D/17.4/DELAY-PROCESS.301-4882762.en.html
*/
Function delay
	C_REAL:C285($1)  // delay
	DELAY PROCESS:C323(This:C1470.id;$1)
	
/*
https://doc.4d.com/4Dv17/4D/17.4/PAUSE-PROCESS.301-4882754.en.html
*/
Function pause
	PAUSE PROCESS:C319(This:C1470.id)
	
/*
https://doc.4d.com/4Dv17/4D/17.4/RESUME-PROCESS.301-4882772.en.html
*/
Function resume
	RESUME PROCESS:C320(This:C1470.id)
	
/*
Wait until this process finish from an other process.
/!\ do not call it from same process.
*/
Function wait
	ASSERT:C1129(Current process:C322#This:C1470.id)
	Repeat 
		
		DELAY PROCESS:C323(Current process:C322;60)
		
	Until (Process state:C330(This:C1470.id)=Aborted:K13:1)
	
Function name
	C_TEXT:C284($0)
	C_TEXT:C284($vName)
	C_LONGINT:C283($vState)
	C_LONGINT:C283($vTime)
	PROCESS PROPERTIES:C336(This:C1470.id;$vName;$vState;$vTime)
	$0:=$vName
	
Function isCurrent
	C_BOOLEAN:C305($0)
	$0:=Current process:C322=This:C1470.id
	
/*
https://doc.4d.com/4Dv17/4D/17.4/PROCESS-PROPERTIES.301-4882760.en.html
*/
Function properties
	C_OBJECT:C1216($0)
	C_TEXT:C284($vName)
	C_LONGINT:C283($vState)
	C_LONGINT:C283($vTime)
	C_LONGINT:C283($vFlags)
	C_LONGINT:C283($uniqueID)
	C_LONGINT:C283($origin)
	PROCESS PROPERTIES:C336(This:C1470.id;$vName;$vState;$vTime;$vFlags;$uniqueID;$origin)
	$0:=New object:C1471("name";$vName;"state";$vState;"time";$vTime;"flag";$vFlags;"uniqueID";$uniqueID;"origin";$origin)
	$0.isVisible:=$vFlags ?? 0
	$0.isPreemptive:=$vFlags ?? 0
	
	  // user interface
	
Function hide
	HIDE PROCESS:C324(This:C1470.id)
	
Function show
	SHOW PROCESS:C325(This:C1470.id)
	
Function bringToFront
	BRING TO FRONT:C326(This:C1470.id)
	
	  // Static
	
Function static_frontmost
	C_OBJECT:C1216($0)
	If (Count parameters:C259>1)
		$0:=cs:C1710.Process.new(Frontmost process:C327(*))
	Else 
		$0:=cs:C1710.Process.new(Frontmost process:C327)
	End if 
	