# Process

## Constructor

```4d
$process:=classy.Process.new(<process id>)
```

or current process

```4d
$process:=classy.Process.new()
```

## Functions

### Flow

#### state

```4d
$process.state()
```

#### delay

```4d
$process.delay(10)
```

#### pause

```4d
$process.pause()
```

#### resume

```4d
$process.pause()
```

### Properties

```4d
$process.properties()
```

```4d
$process.name()
```

```4d
$bool:=process.isCurrent()
```

### User Interface

#### hide

```4d
$process.hide()
```
#### show

```4d
$process.show()
```

#### bringToFront

```4d
$process.bringToFront()
```

