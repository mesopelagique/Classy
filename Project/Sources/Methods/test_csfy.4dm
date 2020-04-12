//%attributes = {}
C_OBJECT:C1216($🎩;$⚙️;$process)
$🎩:=classy 
$⚙️:=$🎩.Process

$process:=$⚙️.new()
ASSERT:C1129(Length:C16($process.name())>0)

ASSERT:C1129($process.isCurrent())