Class constructor
	C_REAL:C285($1)
	This:C1470.rawValue:=$1
	
Function rounded
	C_OBJECT:C1216($0)
	$0:=cs:C1710.Numeric.new(Round:C94(This:C1470.rawValue; 0))
	
Function round
	This:C1470.rawValue:=Round:C94(This:C1470.rawValue; 0)
	
Function squareRoot
	This:C1470.rawValue:=Square root:C539(This:C1470.rawValue)
	
Function cos
	This:C1470.rawValue:=Cos:C18(This:C1470.rawValue)
	