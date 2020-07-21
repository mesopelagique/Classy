Class constructor
	This:C1470.refresh()
	
Function refresh
	C_TEXT:C284($key)
	C_OBJECT:C1216($env)
	$env:=GET ENVIRONMENT VARIABLES
	For each ($key; $env)
		This:C1470[$key]:=$env[$key]
	End for each 
	
Function set
	C_TEXT:C284($1; $2)
	SET ENVIRONMENT VARIABLE:C812($1; $2)
	This:C1470[$1]:=$2
	
Function get
	C_TEXT:C284($1; $2)
	SET ENVIRONMENT VARIABLE:C812($1; $2)
	
Function load
	C_OBJECT:C1216($env; $1)
	$env:=$1
	If (OB Instance of:C1731($env; 4D:C1709.File))
		C_TEXT:C284($txt)
		$txt:=$env.getText()
		If (Position:C15("{"; $txt)=1)
			$env:=JSON Parse:C1218($txt)
		Else 
			$env:=ParseEnv($txt)
		End if 
	End if 
	If ($env#Null:C1517)
		C_TEXT:C284($key)
		For each ($key; $env)
			Case of 
				: (Value type:C1509($env[$key])=Is text:K8:3)
					This:C1470.set($key; $env[$key])
				: (Value type:C1509($env[$key])=Is longint:K8:6)
					This:C1470.set($key; String:C10($env[$key]))
				: (Value type:C1509($env[$key])=Is real:K8:4)
					This:C1470.set($key; String:C10($env[$key]))
			End case 
		End for each 
	End if 