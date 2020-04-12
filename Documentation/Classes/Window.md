# Window

## Constructor

```4d
$window:=classy.Window.new(<window ref>)
```

or for current window

```4d
$window:=classy.Window.new()
```

## Functions
### Properties
#### Title
```4d
$window.getTitle()
```

```4d
$window.setTitle()
```
#### Kind

```4d
$window.kind()
```

#### Edge

```4d
$edge:=$window.getEdge()
```

```4d
$window.setEdge(classy.Edge.new(10;10;10;10))
```


### Operations
	
```4d
$window.minimize()
$window.maximize()
$window.redraw()
$window.show()
$window.hide()
$window.erase()
$window.close()
```

### Others

#### nextWindow

```4d
$anOtherWindow:=$window.nextWindow()
```

#### process associated

```4d
$aProcess:=$window.process()
```

