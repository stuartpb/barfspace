# ditched draft for Hubs slowdown issue reply

I realized this wasn't helpful, so I ended up stripping it down to just "let me know if you'd like to try a different solution"

> I'm sorry to hear that! To be clear, you were having issues with a delay between you and the rest of the room (where, once you got in, you could see and hear people moving smoothly, but were only hearing what people had said minutes ago), and not just choppy performance (where you can hear everyone normally, but with crackly audio and the stuff on screen barely moving)?
>
> My dad had a similar issue when he tried to join the hub in our initial tests, and it went away when he tried a different computer (which is why I sent out the email asking for people to test their connection in advance of the meeting, albeit on such short notice that nobody really had a chance to do so). If you'd like to try a different machine before the next virtual get-together, let me know and I'll hop back into the room to test.
>
> I'm not sure what the underlying cause for this slowdown issue is yet, but my working theory is that it's a software problem rather than a network quality issue. It seems like something is forcing the connection to go from UDP (the lazy mode where, if your signal drops for a second, the system forgets about the lost packets and just moves on) to TCP (the fastidious mode where, if your signal drops for a second, the system holds everything up until the part that was dropped can get through).
>
> I've reached out to one of the Hubs developers about this - a few questions I'd ask to diagnose:
>
> - What OS/browser (ie. Windows 10 and Chrome) were you using? Is your system (both the browser and the OS) fully up-to-date?
> - If this is a wireless connection issue, do you know the details of your Wi-Fi network (eg. whether it's 2.4GHz or 5GHz, which 802.11 revision it supports, if there are other networks that might be interfering)?
> - Is it possible you were connecting via a VPN (ie. for work), or something else that would be routing your network connection through some kind of (TCP-based) tunnel?
> - Do you have a firewall installed, or something else that might block Hubs from using UDP (forcing it to try TCP as a fallback)?
