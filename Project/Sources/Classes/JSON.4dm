
Function static_parse
	C_VARIANT:C1683($0)
	C_TEXT:C284($1)
	$0:=JSON Parse:C1218($1)
	
Function static_stringify
	C_VARIANT:C1683($1)
	C_TEXT:C284($0)
	$0:=JSON Stringify:C1217($1)