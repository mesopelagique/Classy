
Class constructor
	C_OBJECT:C1216($1)
	If (Count parameters:C259>0)
		This:C1470.options:=$1
	Else 
		This:C1470.options:=New object:C1471("text";True:C214)  // New object() // 
	End if 
	
	If (This:C1470.options.headers=Null:C1517)
		This:C1470.options.headers:=New object:C1471()
	End if 
	
	If (This:C1470.options.downloadFolder=Null:C1517)
		This:C1470.options.downloadFolder:=Folder:C1567(Temporary folder:C486;fk platform path:K87:2)
	End if 
	
Function get
	C_OBJECT:C1216($0)  // $response
	C_TEXT:C284($1)  // $url
	C_OBJECT:C1216($2)
	$0:=This:C1470.request(HTTP GET method:K71:1;$1;"";$2)
	
Function post
	C_OBJECT:C1216($0)  // $response
	C_TEXT:C284($1)  // $url
	C_VARIANT:C1683($2;$3)
	$0:=This:C1470.request(HTTP POST method:K71:2;$1;$2;$3)
	
Function put
	C_OBJECT:C1216($0)  // $response
	C_TEXT:C284($1)  // $url
	C_VARIANT:C1683($2;$3)
	$0:=This:C1470.request(HTTP PUT method:K71:6;$1;$2;$3)
	
Function delete
	C_OBJECT:C1216($0)  // $response
	C_TEXT:C284($1)  // $url
	C_OBJECT:C1216($2)
	$0:=This:C1470.request(HTTP DELETE method:K71:5;$1;"";$2)
	
Function head
	C_OBJECT:C1216($0)  // $response
	C_TEXT:C284($1)  // $url
	C_OBJECT:C1216($2)
	$0:=This:C1470.request(HTTP HEAD method:K71:3;$1;"";$2)
	
Function trace
	C_OBJECT:C1216($0)  // $response
	C_TEXT:C284($1)  // $url
	C_OBJECT:C1216($2)
	$0:=This:C1470.request(HTTP TRACE method:K71:4;$1;"";$2)
	
Function options
	C_OBJECT:C1216($0)  // $response
	C_TEXT:C284($1)  // $url
	C_OBJECT:C1216($2)
	$0:=This:C1470.request(HTTP OPTIONS method:K71:7;$1;"";$2)
	
Function request
	C_TEXT:C284($1;$method)
	$method:=$1
	C_TEXT:C284($2;$url)  // XXX later could be a varient with url object
	$url:=$2
	C_VARIANT:C1683($3;$content)
	If (Count parameters:C259>2)
		$content:=$3
	Else 
		$content:=""
	End if 
	
	C_OBJECT:C1216($0;$response)
	$response:=cs:C1710.Response.new()
	$response.url:=$url
	
	C_OBJECT:C1216($options)
	$options:=This:C1470.options  // TODO merge with option passed as parameters
	If (Count parameters:C259>3)
		  // $options merge with $4 
	End if 
	
	
	C_LONGINT:C283($httpResponse;$index)
	
	C_COLLECTION:C1488($col)
	$col:=OB Entries:C1720($options.headers)
	ARRAY TEXT:C222($headerNames;$col.length)
	ARRAY TEXT:C222($headerValues;$col.length)
	For ($index;1;$col.length;1)
		$headerNames{$index}:=$col[$index-1].key
		$headerValues{$index}:=String:C10($col[$index-1].value)
	End for 
	
	C_TEXT:C284($oldMethod)
	$oldMethod:=Method called on error:C704
	lastError:=0
	
	ON ERR CALL:C155("catchError")
	C_VARIANT:C1683($data)
	  // get according to expected type // C_VARIANT directlry if working?
	Case of 
		: (Bool:C1537($options.json) | Bool:C1537($options.object))
			C_OBJECT:C1216($object)
			$httpResponse:=HTTP Request:C1158($method;$url;$content;$object;$headerNames;$headerValues)
			$data:=$object
		: (Bool:C1537($options.text))
			C_TEXT:C284($text)
			$httpResponse:=HTTP Request:C1158($method;$url;$content;$text;$headerNames;$headerValues)
			$data:=$text
		: (Bool:C1537($options.picture))
			C_PICTURE:C286($image)
			$httpResponse:=HTTP Request:C1158($method;$url;$content;$image;$headerNames;$headerValues)
			$data:=$image
		Else 
			C_BLOB:C604($blob)
			$httpResponse:=HTTP Request:C1158($method;$url;$content;$blob;$headerNames;$headerValues)
			$data:=$blob
	End case 
	
	$response.code:=$httpResponse
	ON ERR CALL:C155($oldMethod)
	If (lastError#0)
		$response.error:=lastError
	End if 
	
	$response.headers:=New object:C1471()
	For ($index;1;Size of array:C274($headerNames);1)
		$response.headers[$headerNames{$index}]:=$headerValues{$index}
	End for 
	
	Case of 
		: (Value type:C1509($data)=Is BLOB:K8:12)
			$response.data:=This:C1470.options.downloadFolder.file("request_"+Generate UUID:C1066)
			$response.data.setContent($data)  // XXX encoding?
		: (Value type:C1509($data)=Is text:K8:3)
			
			$response.data:=$data
			If (Length:C16($data)=0)
				C_TEXT:C284($mimeType)
				$mimeType:=$response.headers["Content-Type"]
				If (Position:C15("image";$mimeType)=1)  // TODO complete mime type support, and binary detect
					This:C1470.options.text:=False:C215
					$response:=This:C1470.request($1;$2;$3)
					This:C1470.options.text:=True:C214
				End if 
			End if 
		Else 
			$response.data:=$data
	End case 
	
	
	$0:=$response