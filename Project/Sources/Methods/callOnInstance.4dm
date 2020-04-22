//%attributes = {"invisible":true}
C_OBJECT:C1216($1)  // instance or function
C_VARIANT:C1683(${2})  // parameters

C_COLLECTION:C1488($params)  // An internal 4D methods to get collection of parameters will be cool
$params:=New collection:C1472()
C_LONGINT:C283($index)

If (OB Instance of:C1731($1;4D:C1709.Function))
	For ($index;2;Count parameters:C259;1)
		$params.push(${$index})
	End for 
	$1.apply($1;$params)
Else 
	For ($index;3;Count parameters:C259;1)
		$params.push(${$index})
	End for 
	$1[$2].apply($1;$params)
End if 