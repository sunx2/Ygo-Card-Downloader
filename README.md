# What is This ?
A tool for populating cards folder in Ygo sims based on Floro Ocgcore


# How does it looks like?

![main look](https://github.com/sunx2/Ygo-Card-Downloader/blob/master/screenshots/ss2.png?raw=true)

# how to use it?

You need to download nothing! 
### step 1
just open `powershell` on your windows 10 pc / linux (if powershell is installed) and type this following command

```powershell
powershell -ExecutionPolicy ByPass -File (iwr https://raw.githubusercontent.com/sunx2/Ygo-Card-Downloader/master/ygocarddownloader.ps1 -useb | iex)
```
and you will see the main interface.

### step 2

write Sqlite location and Ygo simulator (any with official ocgcore) location and click search.

example.
<br>
![example](https://github.com/sunx2/Ygo-Card-Downloader/blob/master/screenshots/ss1.png?raw=true)

you can download Sqlite dll from <a href="https://system.data.sqlite.org/index.html/doc/trunk/www/downloads.wiki">here</a>

### step 3
click download and enjoy

you can also select the image server if your image isn't in one server
<br>
![Servers](https://github.com/sunx2/Ygo-Card-Downloader/blob/master/screenshots/image.png?raw=true)
<br>
download notifications will be in powershell.
update the card.cdb if more images are missing.
not compatiable with edopro.
