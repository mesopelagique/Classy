

Class constructor
	
	
Function getText
	C_TEXT:C284($0)
	$0:=Get text from pasteboard:C524
	
Function setText
	C_TEXT:C284($1)
	SET TEXT TO PASTEBOARD:C523($1)
	
Function getFile  //(index)
	C_LONGINT:C283($1)
	C_OBJECT:C1216($0)
	$0:=File:C1566(Get file from pasteboard:C976($1);fk platform path:K87:2)
	
Function setFile
	C_OBJECT:C1216($1)
	SET FILE TO PASTEBOARD:C975($1.platformPath)
	
Function getPicture
	C_PICTURE:C286($picture;$0)
	GET PICTURE FROM PASTEBOARD:C522($picture)
	$0:=$picture
	
Function setPicture
	C_PICTURE:C286($1)
	SET PICTURE TO PASTEBOARD:C521($1)
	
Function clear
	CLEAR PASTEBOARD:C402