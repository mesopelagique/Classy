# Classy 🎩
Classy code using `Class`

- [classy.Process](Documentation/Classes/Process.md)
- [classy.Semaphore](Documentation/Classes/Semaphore.md)
- [classy.Worker](Documentation/Classes/Worker.md)
- [classy.Pasteboard](Documentation/Classes/Pasteboard.md)
- [classy.WebArea](Documentation/Classes/WebArea.md)
- [classy.Window](Documentation/Classes/Window.md)

## Example

```4d
$🎩:=classy 
$⚙️:=$🎩.Process

$process:=$⚙️.new(1)

$process.delay(10)

$process.kill()
```
