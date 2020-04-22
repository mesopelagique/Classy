Class constructor
	C_TEXT:C284($1)
	This:C1470.rawValue:=$1
	
Function split
	C_COLLECTION:C1488($0)
	C_TEXT:C284($1)  // separators
	$0:=Split string:C1554(This:C1470.rawValue;$1)
	
Function length
	C_LONGINT:C283($0)
	$0:=Length:C16(This:C1470.rawValue)
	
/* Uppercase the current string. */
Function uppercase
	This:C1470.rawValue:=Uppercase:C13(This:C1470.rawValue)
	
/* Lowercase the current string. */
Function lowercase
	This:C1470.rawValue:=Lowercase:C14(This:C1470.rawValue)
	
/* Returns a lowercase version of the string. */
Function lowercased
	C_OBJECT:C1216($0)
	$0:=cs:C1710.String.new(Lowercase:C14(This:C1470.rawValue))
	
/* Returns an uppercase version of the string. */
Function uppercased
	C_OBJECT:C1216($0)
	$0:=cs:C1710.String.new(Uppercase:C13(This:C1470.rawValue))
	
Function insert
	C_TEXT:C284($1)
	C_LONGINT:C283($2)
	This:C1470.rawValue:=Insert string:C231(This:C1470.rawValue;$1;$2)
	
Function inserted
	C_OBJECT:C1216($0)
	C_TEXT:C284($1)
	C_LONGINT:C283($2)
	$0:=cs:C1710.String.new(Insert string:C231(This:C1470.rawValue;$1;$2))
	
Function delete
	C_LONGINT:C283($1;$2)
	This:C1470.rawValue:=Delete string:C232(This:C1470.rawValue;$1;$2)
	
Function deleted
	C_OBJECT:C1216($0)
	C_LONGINT:C283($1;$2)
	$0:=cs:C1710.String.new(Delete string:C232(This:C1470.rawValue;$1;$2))
	
Function change
	C_TEXT:C284($1)
	C_LONGINT:C283($2)
	This:C1470.rawValue:=Change string:C234(This:C1470.rawValue;$1;$2)
	
Function changed
	C_OBJECT:C1216($0)
	C_TEXT:C284($1)
	C_LONGINT:C283($2)
	$0:=cs:C1710.String.new(Change string:C234(This:C1470.rawValue;$1;$2))
	
Function num
	C_REAL:C285($0)
	C_TEXT:C284($1)
	If (Count parameters:C259>0)
		$0:=Num:C11(This:C1470.rawValue;$1)
	Else 
		$0:=Num:C11(This:C1470.rawValue)
	End if 
	
Function localized
	C_OBJECT:C1216($0)
	$0:=cs:C1710.String.new(Get localized string:C991(This:C1470.rawValue))
	
Function substring
	C_OBJECT:C1216($0)
	C_LONGINT:C283($1;$2)
	$0:=cs:C1710.String.new(This:C1470.substringRaw($1;$2))
	
Function substringRaw
	C_TEXT:C284($0)
	C_LONGINT:C283($1;$2)
	If (Count parameters:C259>1)
		$0:=Substring:C12(This:C1470.rawValue;$1;$2)
	Else 
		$0:=Substring:C12(This:C1470.rawValue;$1)
	End if 
	
Function indexOf
	C_LONGINT:C283($0)
	C_TEXT:C284($1)
	C_LONGINT:C283($2)
	
	If (Count parameters:C259>1)
		$0:=Position:C15($1;This:C1470.rawValue;$2)
	Else 
		$0:=Position:C15($1;This:C1470.rawValue)
	End if 
	
Function parseJSON
	C_OBJECT:C1216($0)
	$0:=JSON Parse:C1218(This:C1470.rawValue)