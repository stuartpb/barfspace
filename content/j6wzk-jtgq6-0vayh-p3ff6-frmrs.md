# Making a project with a variant fork via Git locally

I had the personal stuff I'd been working on in a side project where I realized that the more basic design should have its own project/repo. I hadn't comitted anything to Git yet

what I did was I copied the content from the current work I'd done to a more generic workspace (specifically, I created a new directory, initialized a README.md, and created a new file with the project's name, opened it in Code, and pasted the code in)

I edited the pasted code to remove personal sizing comments, etc. (the original directory also had unnecessary art assets)

then I did a git init there, did a commit with the cleaned-up core, then did a `git clone` of that project to a subdirectory, did a `git mv clonedir/.git . && rm -r clonedir`

this lets me make general changes in the "upstream" directory, where I have a clean version of the project, and 
