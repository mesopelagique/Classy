# Classy 🎩
 
[![language][code-shield]][code-url] [![language-top][code-top]][code-url] ![code-size][code-size] [![release][release-shield]][release-url] [![license][license-shield]][license-url] [![discord][discord-shield]][discord-url]

Classy code using `Class`

- [⚙️ classy.Process](Documentation/Classes/Process.md)
- [🚦 classy.Semaphore](Documentation/Classes/Semaphore.md)
- [🏭 classy.Worker](Documentation/Classes/Worker.md)
- [📋 classy.Pasteboard](Documentation/Classes/Pasteboard.md)
- [🌐 classy.WebArea](Documentation/Classes/WebArea.md)
- [🖼️ classy.Window](Documentation/Classes/Window.md)

## Example

```4d
$🎩:=classy 
$⚙️:=$🎩.Process

$process:=$⚙️.new(1)

$process.delay(10)

$process.kill()
```

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[code-shield]: https://img.shields.io/static/v1?label=language&message=4d&color=blue
[code-top]: https://img.shields.io/github/languages/top/mesopelagique/Classy.svg
[code-size]: https://img.shields.io/github/languages/code-size/mesopelagique/Classy.svg
[code-url]: https://developer.4d.com/
[release-shield]: https://img.shields.io/github/v/release/mesopelagique/Classy
[release-url]: https://github.com/mesopelagique/Classy/releases/latest
[license-shield]: https://img.shields.io/github/license/mesopelagique/Classy
[license-url]: LICENSE.md
[discord-shield]: https://img.shields.io/badge/chat-discord-7289DA?logo=discord&style=flat
[discord-url]: https://discord.gg/dVTqZHr

