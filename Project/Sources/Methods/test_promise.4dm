//%attributes = {}




$promise:=cs:C1710.Promise.new("test";Formula:C1597(5+5)).then(Formula:C1597($1+$1))

$promise.then(Formula:C1597(ALERT:C41(String:C10($1))))

$value:=$promise.get()