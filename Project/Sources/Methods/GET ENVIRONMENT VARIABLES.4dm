//%attributes = {"invisible":true,"preemptive":"capable"}
C_OBJECT:C1216($0; $env)

C_TEXT:C284($in; $out; $err)

If (Is Windows:C1573)
	SET ENVIRONMENT VARIABLE:C812("_4D_OPTION_HIDE_CONSOLE"; "true")
	LAUNCH EXTERNAL PROCESS:C811("cmd /C SET"; $in; $out; $err)  // TODO test
Else 
	LAUNCH EXTERNAL PROCESS:C811("/usr/bin/env"; $in; $out; $err)
End if 

$0:=ParseEnv($out)
