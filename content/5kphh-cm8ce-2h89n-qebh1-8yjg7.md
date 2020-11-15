# Email and Phone Numbers

Part of the [Zero to Software](gmpsm-6b804-gp8sy-hyne0-txv0w) set of [Lean Notes](y063t-8w892-wm8ty-pg17v-k8gwm)

[Background stock image](https://trello-backgrounds.s3.amazonaws.com/51901b73c30c061842001c4b/054d5f48335664306ad28d0403f1f9f8/Email-network.jpg)

## Previous

You might want to build some of this (like the Email stuff) as part of your [Hosting and Infrastructure](hhypz-mtvwt-g0bq6-n8vma-gzy0y).

## Overture

Email is the *old* Internet. Email isn't just older than the Web: email is *older than the Internet itself*. The whole Internet project was basically invented just so the computers people were already sending internal mail on could send mail to each other.

All this is to say, when you dive into the world of email, you're diving into a world that was defined, more than any other modern interoperable technology, by a bunch of disparate entities that weren't in good coordination.

Things are going to get *rough*...

But not as rough as the *phone system*, which has an operational legacy that can be traced back to the *nineteenth century*.

## How Email Works

Basically, there are a few mail servers that all speak protocols specified a very long time ago, in RFCs (the Internet standards that I should probably have a note explaining - you can look them up on Wikipedia).

You need an Unsubscribe link when you're sending any kind of automated/bulk email. It's more than just a courtesy: you can get nailed with a CAN-SPAM penalty in the US if you send unsolicited email without allowing users to opt out. (See [Going International](1tbaz-mjmyd-179pr-8d2r6-sqtr6) for relevant laws in your area.)

## Services

There are a few ways to do email *sending* for free (my old notes mentioned Mandrill, which I'm pretty sure is dead now), but for email *receiving*, the only service I know that hosts this for free is [Zoho Mail](https://www.zoho.com/mail/).

You might be able to get cheap/free email hosting with your domain name registrar: in fact, you probably don't even need to pay for hosting - most registrars will do forwarding for free, so you can just set your desired address to forward to your own personal inbox on whatever service you already use.

I also had a note in my old notes to plug [MailShadows](gxrvf-7g6hb-m2avg-0jxhg-txjwq) here, but I don't know if that'll ever materialize

## Sending Email

Your server matters. If you send bulk mail out of some arbitrary IP address, ISPs will likely expect that it's spam and block it. This is the big advantage of services like Mandrill: they've already negotiated with mail receivers to trust MailChimp's servers. *(yes, I know I just said Mandrill is dead, this is legacy content, I'll fix it later)*

There's also DKIM stuff to worry about around what's involved in setting your service up.

## See also

For more detail, check out the [Email Deep Dive Hub](z3ygc-q7ey9-ws9hr-zpqp7-zsj42)

the notes on [HTML Email design specifically](tc58z-f839r-mjasq-30466-c37my) cover a lot of hair-pulling frustrations

## Phone calls

When it comes to basic interfacing with the phone system, [Twilio](https://www.twilio.com/) is pretty much the only game in town.

You could probably hack something with a VOIP node or a burner cell phone, but, like, that's a lot of dependency

## SMS

Twilio has SMS compatibility, so they make sense if you're already doing phone stuff through them.

[TextMarks](https://www.textmarks.com/) is also still around: they used to have a really neat free tier, but that was in, like, 2010, back when I had a bar phone.

If all you need to do is *send* SMS, you can actually do that via email. This is the approach used by TextBelt, which can be used as a Node.JS library, or as a service: http://textbelt.com/

Behind the scenes, TextBelt sends the text as an email to any provider which may control the phone number: https://github.com/typpo/textbelt/blob/master/lib/text.js

## Next up

Now that you're looking at these pay-communication services, you might want to look into [Monetizing and Accounting](cpqbk-avea2-ab8fg-m2m7b-c28pj).
