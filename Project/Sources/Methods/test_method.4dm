//%attributes = {}

C_COLLECTION:C1488($methods)
$methods:=classy.Method.new().static_all()

ASSERT:C1129($methods.length>0; "No methods")