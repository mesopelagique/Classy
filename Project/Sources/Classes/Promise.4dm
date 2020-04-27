Class constructor
	C_TEXT:C284($1)
	C_OBJECT:C1216($2)
	If (Count parameters:C259>1)
		This:C1470.description:=$1
		This:C1470.formula:=$2
		This:C1470.signal:=New signal:C1641(This:C1470.description)
		This:C1470.worker:=cs:C1710.Worker.new(This:C1470.description)
		
		If (Not:C34(Bool:C1537($3)))  // autostart? yes by default
			This:C1470._start()
		End if 
	Else 
		ASSERT:C1129(False:C215;"Missing Promise parameters")
	End if 
	
Function _start
	This:C1470.worker.call(This:C1470;"_trigger")
	
Function _trigger
	Use (This:C1470.signal)
		This:C1470.signal.value:=This:C1470.formula.call(This:C1470)
		This:C1470.signal.trigger()
		If (This:C1470.signal.then#Null:C1517)
			This:C1470.signal.then.formula.call(This:C1470;This:C1470.signal.value)
		End if 
		This:C1470.signal.then:=Null:C1517
	End use 
	
Function then
	  // TODO return a promise
	C_OBJECT:C1216($0)
	C_OBJECT:C1216($1)
	Use (This:C1470.signal)
		This:C1470.signal.then:=cs:C1710.Promise.new(This:C1470.description;$1;True:C214)  // do not start automatically
		If (This:C1470.signal.signaled)
			This:C1470.worker.call(This:C1470;"_thenWorker")
		End if 
	End use 
	$0:=This:C1470.signal.then
	
Function _thenWorker
	Use (This:C1470.signal)
		If (This:C1470.signal.then#Null:C1517)
			This:C1470.signal.then.formula.call(This:C1470.signal.value)
		End if 
		This:C1470.signal.then:=Null:C1517
	End use 
	
Function get
	This:C1470.signal.wait()
	$0:=This:C1470.signal.value
	
/*
Promise.all(promises) – waits for all promises to resolve and returns an array of their results. If any of the given promises rejects, it becomes the error of Promise.all, and all other results are ignored.
Promise.allSettled(promises) (recently added method) – waits for all promises to settle and returns their results as an array of objects with:
state: "fulfilled" or "rejected"
value (if fulfilled) or reason (if rejected).
Promise.race(promises) – waits for the first promise to settle, and its result/error becomes the outcome.
Promise.resolve(value) – makes a resolved promise with the given value.
Promise.reject(error) – makes a rejected promise with the given error.
*/