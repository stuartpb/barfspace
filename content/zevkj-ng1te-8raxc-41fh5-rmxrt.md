# DDNS Stuff

logged into OpenDNS via DNS-O-Matic for the first time since 2011

> Malware/Botnet Activity Detected
> Activity 	Label 	IP 	Stats 	Last seen 	Hide
> Malware 	O101 	67.170.100.80 	[Stats are not enabled for this network.] 	Jan 3, 2011, 3:31am UTC

That's my old IP. I guess stuff still points at it. Lol

adding my network via https://dashboard.opendns.com/settings

checking out dnsomatic.com

oh wow. okay so I had 4 things plugged in here: Afraid.org, DynDNS, NoIP, and OpenDNS of course

Right, wow, I forgot about OpenDNS's model. That would actually be a cool thing to base a Home Network System on

my DynDNS was o101.endoftheinternet.org, and NoIP was ob101.zapto.org

## wow, legacies

Changing testtrack4.com to point to CloudFlare

Ah, OK, I'm noticing something while I'm here: "Always Use SSL" is now an option under SSL/TLS -> Edge Certificates

## software change

installed drill per the DDNS page's advice

## okay so

changing the DNS server to 1.1.1.1 for lookups because if you give it your own network's name it checks what the existing record for the network is and it goes "well, it's localhost"

deleting the wildcards CloudFlare made

to get around what I think are bugs in the system's password "encoding", I set my password to a random alphanumeric token

## thinking about gitops

wow, Git would be like 4 megs to install, making it prohibitive
