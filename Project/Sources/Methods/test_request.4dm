//%attributes = {}

C_OBJECT:C1216($request)  // Request
$request:=classy .Request.new()

$request.options.headers["X-Test"]:=1
$request.options.headers["X-Test2"]:="aze"

C_OBJECT:C1216($response)  // Response
$response:=$request.get("http://www.google.com/")

ASSERT:C1129(Length:C16($response.text())>1)

$response:=$request.get("http://httpbin.org/get")
C_OBJECT:C1216($object)
$object:=$response.object()

C_TEXT:C284($myExternalIp)
$myExternalIp:=$request.get("http://httpbin.org/ip").object().origin
ASSERT:C1129(Length:C16($myExternalIp)>0)

  //$request.options.text:=False
C_OBJECT:C1216($file)
$file:=Folder:C1567(Temporary folder:C486;fk platform path:K87:2).file(Generate UUID:C1066+".png")
$response:=$request.get("https://avatars2.githubusercontent.com/u/59135882")
$response.save($file)

ASSERT:C1129($file.size>0)
If (Shift down:C543)
	SHOW ON DISK:C922($file.platformPath)
End if 