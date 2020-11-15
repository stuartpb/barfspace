# stuartpb(1): EXIT CODES

If you're reading this, it's because I've exited your thread (on Twitter, email, whatever) with a terminating status code. Reading this manual page may give you further explanation as to the underlying causes of the error.

These exit codes are triggered by heuristics meant to terminate a non-halting process, as a general solution to determine whether there is an end to *any* online argument [does not exist](https://en.wikipedia.org/wiki/Halting_problem).

## code 0: success

Exiting a thread with code 0 (usually not printed) states that the thread simply has nowhere more to go; either it safely reached a conclusion, or all arguments were otherwise fully expressed.

## code 1: undefined error

catch-all status code, usually for yet-undefined error codes.

## code 5: arguing semantics

The thread is reiterating comfortable previously-argued points, instead of attempting to engage with unresolved issues. The thread may have devolved into "further defining" words that were already perfectly well understood, in order to project that participants' inability to comprehend the arguments of others lies in an inability of *others* to comprehend their *own* arguments.

## code 6: ignoring solutions

The thread continued to argue problems that aren't applicable, even after the reason the argument wasn't applicable was pointed out.

Threads exited with error code 6 are frequently fixated on using the wrong tool to solve the wrong problem. For instance, "why isn't there a well-supported standard for injecting raster images into a text console" ignores that the entire point of a *text console standard* is to define interoperability across environments *without raster image concerns*: if the user needs raster image support, they should be addressing it at the level of their platform that explicitly supports raster images (eg. X11, or VNC).

See also:

- [XY problems](http://xyproblem.info/)
- ["other side" problems](https://blogs.msdn.microsoft.com/oldnewthing/20060508-22/?p=31283)

## code 7: bikeshedding

The thread has had several users chime in with changes that would have no meaningful impact, and no such meaningful contributions have been made in some time.
