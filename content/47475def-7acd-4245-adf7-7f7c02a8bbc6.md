# 2019-10-15 stushiba log

## Why did Code OSS vanish from my Applications

I tried Alt+F2 and `r`, and restarting the GNOME shell doesn't display it.

But it's definitely in `/usr/share/applications/code-oss.desktop`

```
-rw-r--r-- 1 root root   404 Oct 14 05:24 code-oss.desktop
-rw-r--r-- 1 root root   294 Oct 14 05:24 code-oss-url-handler.desktop
```

[asked the forum](https://bbs.archlinux.org/viewtopic.php?id=249997)

Running `yay -Syu` the next day fixed it
