# What is This ?
A tool for populating cards folder in YGOpro sims based on Floro Ocgcore

# How does it looks like?

![main look](https://github.com/sunx2/Ygo-Card-Downloader/blob/master/screenshots/ss2.png?raw=true)

# how to use it?
### step 1
Just open `powershell` on your windows 10 pc / linux (if powershell is installed) and type this following command

```powershell
powershell -ExecutionPolicy ByPass -File (iwr https://raw.githubusercontent.com/sunx2/Ygo-Card-Downloader/master/ygocarddownloader.ps1 -useb | iex)
```
and you will see the main interface.

### step 2

Input the `System.Data.SQLite.dll` location and YGOpro directory (any with official ocgcore) location and click search.

Example:
<br>
![example](https://github.com/sunx2/Ygo-Card-Downloader/blob/master/screenshots/ss1.png?raw=true)

Download `System.Data.SQLite.dll` from <a href="https://system.data.sqlite.org/downloads/1.0.112.0/sqlite-netFx451-binary-bundle-x64-2013-1.0.112.0.zip">here</a>

### step 3
Click download and wait until it completes the process.

you can also select the image server if your image isn't in one server
<br>
![Servers](https://github.com/sunx2/Ygo-Card-Downloader/blob/master/screenshots/image.png?raw=true)
<br>
Download notifications will occur in powershell.
Update card.cdb the cdb folder if images are missing.
Currently incompatiable with edopro.
