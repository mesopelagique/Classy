//%attributes = {}
C_OBJECT:C1216($🎩)
$🎩:=classy 

C_OBJECT:C1216($⚙️;$process)
$⚙️:=$🎩.Process
$process:=$⚙️.new()
ASSERT:C1129(Length:C16($process.name())>0)

ASSERT:C1129($process.isCurrent())

C_OBJECT:C1216($🏭;$worker)
$🏭:=$🎩.Worker
$worker:=$🏭.new()

$worker.call($process;"isCurrent")
$worker.call($process;"delay";10)
  //$worker.call($process.staticFunction;10) // work only if no This because no instance

$worker.call($worker;"kill")  // auto kill worker
