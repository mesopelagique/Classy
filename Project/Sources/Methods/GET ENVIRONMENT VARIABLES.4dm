//%attributes = {"invisible":true,"preemptive":"capable"}
C_OBJECT:C1216($0;$env)

C_TEXT:C284($in;$out;$err)

If (Is Windows:C1573)
	LAUNCH EXTERNAL PROCESS:C811("set";$in;$out;$err)  // TODO test
Else 
	LAUNCH EXTERNAL PROCESS:C811("/usr/bin/env";$in;$out;$err)
End if 

$0:=ParseEnv ($out)
