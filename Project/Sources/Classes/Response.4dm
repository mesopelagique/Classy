
Function string
	C_TEXT:C284($0)
	$0:=This:C1470.text()
	
Function text
	C_TEXT:C284($0)
	Case of 
		: (Value type:C1509(This:C1470.data)=Is text:K8:3)
			$0:=This:C1470.data
		: (Value type:C1509(This:C1470.data)=Is object:K8:27)
			
			If (OB Class:C1730(This:C1470.data).name="File")  // BLOB
				$0:=This:C1470.data.getText()
				This:C1470.data.delete()  // consume()
			Else 
				$0:=JSON Stringify:C1217(This:C1470.data)
			End if 
		: (Value type:C1509(This:C1470.data)=Is picture:K8:10)
			ASSERT:C1129(False:C215;"Picture cannot be converted to text")
		Else 
			$0:=Null:C1517
	End case 
	
Function json
	C_OBJECT:C1216($0)
	$0:=This:C1470.object()
	
Function object
	C_OBJECT:C1216($0)
	Case of 
		: (Value type:C1509(This:C1470.data)=Is object:K8:27)
			If (OB Class:C1730(This:C1470.data).name="File")  // BLOB
				$0:=JSON Parse:C1218(This:C1470.data.getText())
				This:C1470.data.delete()  // consume()
			Else 
				$0:=This:C1470.data
			End if 
		: (Value type:C1509(This:C1470.data)=Is picture:K8:10)
			$0:=New object:C1471("picture";This:C1470.data)  // TO TEST?
		: (Value type:C1509(This:C1470.data)=Is text:K8:3)
			$0:=JSON Parse:C1218(This:C1470.data)
		Else 
			$0:=Null:C1517
	End case 
	
Function blob
	C_BLOB:C604($0;$blob)
	Case of 
		: (Value type:C1509(This:C1470.data)=Is text:K8:3)
			TEXT TO BLOB:C554(This:C1470.data;$blob)
		: (Value type:C1509(This:C1470.data)=Is object:K8:27)
			
			If (OB Class:C1730(This:C1470.data).name="File")  // BLOB
				$blob:=This:C1470.data.getContent()
				This:C1470.data.delete()  // consume()
			Else 
				TEXT TO BLOB:C554(This:C1470.string();$blob)
			End if 
			
		: (Value type:C1509(This:C1470.data)=Is picture:K8:10)
			
			PICTURE TO BLOB:C692(This:C1470.data;$blob;".png")  // TODO according to mime type?
			
		Else 
			$0:=Null:C1517
	End case 
	$0:=$blob
	
Function save  // write to file
	C_OBJECT:C1216($1)
	ASSERT:C1129(OB Instance of:C1731($1;4D:C1709.File))
	Case of 
		: (Value type:C1509(This:C1470.data)=Is text:K8:3)
			$1.setText(This:C1470.data)
		: (Value type:C1509(This:C1470.data)=Is picture:K8:10)
			C_BLOB:C604($blob)
			PICTURE TO BLOB:C692(This:C1470.data;$blob;".png")  // TODO according to mime type?
			$1.setContent($blob)
		: (Value type:C1509(This:C1470.data)=Is object:K8:27)
			If (OB Class:C1730(This:C1470.data).name="File")  // BLOB
				This:C1470.data.copyTo($1.parent;$1.fullName)  // maybe use move to
				This:C1470.data.delete()  // consume()
			Else 
				$1.setText(JSON Stringify:C1217(This:C1470.data))
			End if 
			
	End case 