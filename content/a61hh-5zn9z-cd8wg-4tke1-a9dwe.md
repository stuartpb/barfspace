# Proper Session Handling Best Practices

Coming off from [Implementing User Accounts](rt4ha-04jzn-wm9m5-6q6kc-sqfcm)

## How to store a user login

When authenticated, have the server create a random token and send it to the client to store via cookie (if you're returning stateful content) or localStorage (if only doing AJAX calls).

This is the identifier for the logged-in session.

## HTTPS

You should *really* have HTTPS if you're going to do user login. Without it, anybody on the same network with Firesheep will be able to steal their session.

*(this was written in October 2013: HTTPS has become such a no-brainer since then that I honestly think this should just be a passing mention)*

## Logout and session invalidation

Allow users to invalidate (log out) any sessions from their account page.

https://github.com/blog/1658-view-active-browser-sessions

Have a dedicated logout/lockdown API so users can invalidate sessions and access methods in case of breach.

## How *not* to store state

Sessions should be access tokens *only*. You should not associate any state with a token (except maybe details about the authentication that generated it).

State is a property of the user, and should be handled by the user agent. If the user wants to switch from their computer to their phone, it should be up to them how much continuity they're going to lose or carry between them.

## Subsume Secret Action Tokens Into The Session

This is a minor point, but when designing a page using a secret token in the URL (like a "Forgot password" page), loading page content under that secret URL [will leak that URL via the Referer header to third-party resource providers][leak].

[leak]: https://robots.thoughtbot.com/is-your-site-leaking-password-reset-links

The proper way to handle these is to load the page in a fashion that copies the reset token into the session, and then redirect to a page with a clean URL to present any UI to take action using that token that's now part of the session.

For more about this kind of token, see [Doing Out-of-Band Tokens Right](01sbr-54vmr-v49er-je7q6-cz2m9)
