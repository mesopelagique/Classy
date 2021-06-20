

Class constructor
	This:C1470.name:=Current form name:C1298
	
/*
Function call
CALL FORM*/
	
	// https://doc.4d.com/4Dv19/4D/19/FORM-FIRST-PAGE.301-5392157.en.html
Function goToFirstPage
	FORM FIRST PAGE:C250
	
	// https://doc.4d.com/4Dv19/4D/19/FORM-GOTO-PAGE.301-5392171.en.html
Function goToPage($pageNumber : Integer; $currentSubForm : Boolean)
	If (Count parameters:C259>1)
		If ($currentSubForm)
			FORM GOTO PAGE:C247($pageNumber; *)
		Else 
			FORM GOTO PAGE:C247($pageNumber)
		End if 
	Else 
		FORM GOTO PAGE:C247($pageNumber)
	End if 
	
	// https://doc.4d.com/4Dv19/4D/19/FORM-LAST-PAGE.301-5392153.en.html
Function goToLastPage
	FORM LAST PAGE:C251
	
	// https://doc.4d.com/4Dv19/4D/19/FORM-NEXT-PAGE.301-5392166.en.html
Function goToNextPage
	FORM NEXT PAGE:C248
	
	// https://doc.4d.com/4Dv19/4D/19/FORM-PREVIOUS-PAGE.301-5392156.en.html
Function goToPreviousPage
	FORM PREVIOUS PAGE:C249
	
	// https://doc.4d.com/4Dv19/4D/19/FORM-Get-current-page.301-5392158.en.html
Function getCurrentPage()->$pageNumber : Integer
	$pageNumber:=FORM Get current page:C276
	
Function getPageCount()->$numPage : Integer
	var $name : Text
	var $width; $height : Integer
	FORM GET PROPERTIES:C674($name; $width; $height; $numPage)
	
	// https://doc.4d.com/4Dv19/4D/19/FORM-GET-OBJECTS.301-5392161.en.html
Function getObjects()->$objectCollection : Collection
	$objectCollection:=New collection:C1472
	ARRAY TEXT:C222($objects; 0)
	FORM GET OBJECTS:C898($objects)
	
	ARRAY TO COLLECTION:C1563($objectCollection; $objects)
	
Function getHorizontalResizing()->$result : Object
	var $resize; $minWidth; $maxWidth : Integer
	FORM GET HORIZONTAL RESIZING:C1077($resize; $minWidth; $maxWidth)
	$result:=New object:C1471("resize"; $resize; "minWidth"; $minWidth; "maxWidth"; $maxWidth)
	
	// https://doc.4d.com/4Dv19/4D/19/FORM-GET-VERTICAL-RESIZING.301-5392163.en.html
Function getVerticalResizing()->$result : Object
	var $resize; $minWidth; $maxWidth : Integer
	FORM GET VERTICAL RESIZING:C1078($resize; $minWidth; $maxWidth)
	$result:=New object:C1471("resize"; $resize; "minWidth"; $minWidth; "maxWidth"; $maxWidth)
	
	// https://doc.4d.com/4Dv19/4D/19/FORM-SET-HORIZONTAL-RESIZING.301-5392167.en.html
Function setHorizontalResizing($resize : Integer; $minWidth : Integer; $maxWidth : Integer)
	Case of 
		: (Count parameters:C259>2)
			FORM SET HORIZONTAL RESIZING:C892($resize; $minWidth; $maxWidth)
		: (Count parameters:C259>1)
			FORM SET HORIZONTAL RESIZING:C892($resize; $minWidth)
		Else 
			FORM SET HORIZONTAL RESIZING:C892($resize)
	End case 
	
	// https://doc.4d.com/4Dv19/4D/19/FORM-SET-VERTICAL-RESIZING.301-5392160.en.html
Function setVerticalResizing($resize : Integer; $minWidth : Integer; $maxWidth : Integer)
	Case of 
		: (Count parameters:C259>2)
			FORM SET HORIZONTAL RESIZING:C892($resize; $minWidth; $maxWidth)
		: (Count parameters:C259>1)
			FORM SET HORIZONTAL RESIZING:C892($resize; $minWidth)
		Else 
			FORM SET HORIZONTAL RESIZING:C892($resize)
	End case 
	
Function getSize()->$size : Object
	var $name : Text
	var $width; $height : Integer
	FORM GET PROPERTIES:C674($name; $width; $height)
	$size:=New object:C1471("width"; $width; "height"; $height)
	
Function setSize($width : Integer; $height : Integer)
	FORM SET SIZE:C891($width; $height)
	
/*function load
FORM LOAD*/
	
Function unload
	FORM UNLOAD:C1299
	
Function screenshot()->$picture : Picture
	FORM SCREENSHOT:C940($picture)
	
/*
function setIntput
FORM SET INPUT
	
function setOutput
FORM SET OUTPUT
*/
	
	// https://doc.4d.com/4Dv19/4D/19/FORM-Get-color-scheme.301-5430182.en.html
Function getColorScheme()->$scheme : Text
	$scheme:=FORM Get color scheme:C1761  // v19
	
	