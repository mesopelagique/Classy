//%attributes = {}

C_OBJECT:C1216($env;$obj;$upToDate)
$env:=cs:C1710.Env.new()

ASSERT:C1129($env.PATH#Null:C1517;"Must found path")

C_TEXT:C284($testKey)
$testKey:=Generate UUID:C1066
ASSERT:C1129($env[$testKey]=Null:C1517;"Must not found test key")

$env.set($testKey;"value")
ASSERT:C1129($env[$testKey]="value";"Must found test key")

$upToDate:=GET ENVIRONMENT VARIABLE 
ASSERT:C1129($upToDate[$testKey]="value";"Must found test key in real env")

$obj:=New object:C1471("randomKey";Generate UUID:C1066)
$env.load($obj)
ASSERT:C1129($env.randomKey=$obj.randomKey;"Must found randomKey")

$upToDate:=GET ENVIRONMENT VARIABLE 
ASSERT:C1129($upToDate.randomKey=$obj.randomKey;"Must found randomKey in real env")

