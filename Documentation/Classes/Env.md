# Env

## Constructor

```4d
$env:=classy.Env.new()
```

or get current from process (javascript style)

```4d
$process:=classy.Process.new()
$env:=$process.env
```

## Get variable value

If you want to access an env variable named FOO, there is many way.

```4d
$value:=$env.FOO
```

```4d
$value:=$env["FOO"]
```

```4d
$value:=$env.get("FOO")
```

> It will be up to date only if you use this class only.
If you set variable using `SET ENVIRONMENT VARIABLE` you must call `$env.refresh()` to have an object up to date.

## Set variable value

To set a string value for an env variable named FOO

```4d
$env.set("FOO";"a new value")
```

### Load from object or env file

You can set multiples variable from object

```4d
$env.load(New object("FOO1";"value1";"FOO2";"value2"))
```

or from `.env` file

```ini
FOO1=value1
FOO2=value2
```

```4d
$env.load(Folder(fk resources folder).file("app.env"))
```
