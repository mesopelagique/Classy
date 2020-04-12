Class constructor
	C_VARIANT:C1683($1)
	This:C1470.area:=$1
	This:C1470.star:=Value type:C1509(This:C1470.area)=Is text:K8:3
	
Function openURL
	C_TEXT:C284($1)
	If (This:C1470.star)
		WA OPEN URL:C1020(*;This:C1470.area;$1)
	Else 
		WA OPEN URL:C1020(This:C1470.area;$1)
	End if 
	
Function hasBack
	C_BOOLEAN:C305($0)
	If (This:C1470.star)
		$0:=WA Back URL available:C1026(*;This:C1470.area)
	Else 
		$0:=WA Back URL available:C1026(This:C1470.area)
	End if 
	
Function back
	If (This:C1470.star)
		WA OPEN BACK URL:C1021(*;This:C1470.area)
	Else 
		WA OPEN BACK URL:C1021(This:C1470.area)
	End if 
	
Function hasForward
	C_BOOLEAN:C305($0)
	If (This:C1470.star)
		$0:=WA Forward URL available:C1027(*;This:C1470.area)
	Else 
		$0:=WA Forward URL available:C1027(This:C1470.area)
	End if 
	
Function forward
	If (This:C1470.star)
		WA OPEN FORWARD URL:C1022(*;This:C1470.area)
	Else 
		WA OPEN FORWARD URL:C1022(This:C1470.area)
	End if 
	
Function refresh
	If (This:C1470.star)
		WA REFRESH CURRENT URL:C1023(*;This:C1470.area)
	Else 
		WA REFRESH CURRENT URL:C1023(This:C1470.area)
	End if 
	
Function stop
	If (This:C1470.star)
		WA STOP LOADING URL:C1024(*;This:C1470.area)
	Else 
		WA STOP LOADING URL:C1024(This:C1470.area)
	End if 
	
Function getCurrentURL
	C_TEXT:C284($0)
	If (This:C1470.star)
		$0:=WA Get current URL:C1025(*;This:C1470.area)
	Else 
		$0:=WA Get current URL:C1025(This:C1470.area)
	End if 
	
Function getLastFilteredURL
	C_TEXT:C284($0)
	If (This:C1470.star)
		$0:=WA Get last filtered URL:C1035(*;This:C1470.area)
	Else 
		$0:=WA Get last filtered URL:C1035(This:C1470.area)
	End if 
	
Function getContent
	C_TEXT:C284($0)
	If (This:C1470.star)
		$0:=WA Get page content:C1038(*;This:C1470.area)
	Else 
		$0:=WA Get page content:C1038(This:C1470.area)
	End if 
	
Function setContent
	C_TEXT:C284($1;$2)
	If (This:C1470.star)
		WA SET PAGE CONTENT:C1037(*;This:C1470.area;$1;$2)
	Else 
		WA SET PAGE CONTENT:C1037(This:C1470.area;$1;$2)
	End if 
	
Function getTitle
	C_TEXT:C284($0)
	If (This:C1470.star)
		$0:=WA Get page title:C1036(*;This:C1470.area)
	Else 
		$0:=WA Get page title:C1036(This:C1470.area)
	End if 
	
Function setTextLarger
	If (This:C1470.star)
		WA SET PAGE TEXT LARGER:C1039(*;This:C1470.area)
	Else 
		WA SET PAGE TEXT LARGER:C1039(This:C1470.area)
	End if 
	
Function setTextSmaller
	If (This:C1470.star)
		WA SET PAGE TEXT SMALLER:C1040(*;This:C1470.area)
	Else 
		WA SET PAGE TEXT SMALLER:C1040(This:C1470.area)
	End if 
	
Function evaluateJavascript
	C_VARIANT:C1683($0)
	C_TEXT:C284($1)  //code
	C_LONGINT:C283($2)  // $type
	If (This:C1470.star)
		$0:=WA Evaluate JavaScript:C1029(*;This:C1470.area;$1;$2)
	Else 
		$0:=WA Evaluate JavaScript:C1029(This:C1470.area;$1;$2)
	End if 
	
Function getPreference
	C_LONGINT:C283($1)
	C_BOOLEAN:C305($0;$value)
	If (This:C1470.star)
		WA GET PREFERENCE:C1042(*;This:C1470.area;$1;$value)
		$0:=$value
	Else 
		WA GET PREFERENCE:C1042(This:C1470.area;$1;$value)
	End if 
	
Function setPreference
	C_LONGINT:C283($1)
	C_BOOLEAN:C305($2)
	If (This:C1470.star)
		WA SET PREFERENCE:C1041(*;This:C1470.area;$1;$2)
	Else 
		WA SET PREFERENCE:C1041(This:C1470.area;$1;$2)
	End if 
	