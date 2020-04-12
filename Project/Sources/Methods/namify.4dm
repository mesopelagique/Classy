//%attributes = {"invisible":true}
C_OBJECT:C1216($1)
C_TEXT:C284($0)
  //ASSERT(OB Instance of($1;4D.Class))
Use ($1)
	If ($1.cpt=0)
		$1.cpt:=0
	Else 
		$1.cpt:=$1.cpt+1
	End if 
	$0:=$1.name+String:C10($1.cpt)
End use 