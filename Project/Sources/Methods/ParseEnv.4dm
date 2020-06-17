//%attributes = {"invisible":true,"preemptive":"capable"}
C_OBJECT:C1216($0;$result)
C_TEXT:C284($1)
$result:=New object:C1471()

C_TEXT:C284($line)
For each ($line;Split string:C1554($1;Char:C90(Line feed:K15:40);sk ignore empty strings:K86:1))
	$pos:=Position:C15("=";$line)
	If ($pos>0)
		$result[Substring:C12($line;1;$pos-1)]:=Substring:C12($line;$pos+1)
	Else 
		$result[$line]:=""
	End if 
End for each 

$0:=$result
