Class constructor
	C_VARIANT:C1683($1)
	If (Count parameters:C259>1)
		Case of 
			: (Value type:C1509($1)=Is longint:K8:6)
				This:C1470.ref:=$1
			: (Value type:C1509($1)=Is text:K8:3)
				This:C1470.ref:=Process number:C372($1)
			Else 
				ASSERT:C1129(False:C215;"Wront type for process")
		End case 
	Else 
		This:C1470.ref:=Current form window:C827
	End if 
	
Function kind
	C_LONGINT:C283($0)
	$0:=Window kind:C445(This:C1470.ref)
	
Function process
	C_OBJECT:C1216($0)
	$0:=cs:C1710.Process.new(Window process:C446(This:C1470.ref))
	
Function nextWindow
	C_OBJECT:C1216($0)
	$0:=cs:C1710.Window.new(Next window:C448(This:C1470.ref))
	
Function minimize
	MINIMIZE WINDOW:C454(This:C1470.ref)
	
Function maximize
	MAXIMIZE WINDOW:C453(This:C1470.ref)
	
Function redraw
	REDRAW WINDOW:C456(This:C1470.ref)
	
Function show
	SHOW WINDOW:C435(This:C1470.ref)
	
Function hide
	HIDE WINDOW:C436(This:C1470.ref)
	
Function erase
	ERASE WINDOW:C160(This:C1470.ref)
	
Function close
	CLOSE WINDOW:C154(This:C1470.ref)
	
Function getTitle
	C_TEXT:C284($0)
	$0:=Get window title:C450(This:C1470.ref)
	
Function setTitle
	C_TEXT:C284($1)
	SET WINDOW TITLE:C213($1;This:C1470.ref)
	
Function getEdge
	C_OBJECT:C1216($0)
	C_LONGINT:C283($left;$top;$right;$bottom)
	GET WINDOW RECT:C443($left;$top;$right;$bottom;This:C1470.ref)
	$0:=cs:C1710.Edge.new($left;$top;$right;$bottom)
	
Function setEdge
	C_OBJECT:C1216($1)
	SET WINDOW RECT:C444($1.left;$1.top;$1.right;$1.bottom;This:C1470.ref)
	
	  // Static
	
Function static_find
	C_OBJECT:C1216($0)
	C_LONGINT:C283($1;$2;$3)
	If (Count parameters:C259>2)
		$0:=cs:C1710.Window.new(Find window:C449($1;$2;$3))
	Else 
		$0:=cs:C1710.Window.new(Find window:C449($1;$2))
	End if 
	
Function static_frontmost
	C_OBJECT:C1216($0)
	$0:=cs:C1710.Window.new(Frontmost window:C447())
	
Function static_all
	C_COLLECTION:C1488($0;$windows)
	
	ARRAY LONGINT:C221($alWnd;0)
	WINDOW LIST:C442($alWnd)
	
	$windows:=New collection:C1472()
	C_LONGINT:C283($vlWnd)
	For ($vlWnd;1;Size of array:C274($alWnd))
		$windows.push(cs:C1710.Window.new($alWnd{$vlWnd}))
	End for 
	$0:=$windows
	
Function static_open
	C_OBJECT:C1216($0;$1)
	C_LONGINT:C283($2)
	ASSERT:C1129(OB Instance of:C1731($1;cs:C1710.Edge))
	If (Count parameters:C259>1)
		$0:=cs:C1710.Window.new(Open window:C153($1.left;$1.top;$1.right;$1.bottom;$2))
	Else 
		$0:=cs:C1710.Window.new(Open window:C153($1.left;$1.top;$1.right;$1.bottom))
	End if 