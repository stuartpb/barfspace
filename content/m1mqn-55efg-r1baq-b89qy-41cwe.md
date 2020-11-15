# The Sudoer Provisioner Model

Because I don't think Ignition has anything as clean as

```yaml
# this is the only real class of user this script sets up
sudoers:
  stuart:
    github: stuartpb
```

where it sets up a script to get that user's GitHub keys for authorization for this user

## the "needs-three-users-watching" sudoers format

this is the way I think it's safe to set up a system: have it run on a Raspberry Pi in a "public" place (bottom line: not at any one person's house, somewhere where physical access would be noted)

anyway you'd make it so that, to become superuser, you need at least two others approving the login and connected. if a heartbeat fails for either watcher, the session is suspended until they're back

## why you don't generally see this

Machines are generally administered in such a way that they can work as a sealed box because they're managed like "cattle": you just destroy the whole thing if you have any problem, and you only insert a superuser for testing (this is how Kubic's setup is)

## update: I've reviewed what Ignition has

I think what'd make the most sense, after looking at what Ignition provides (and how Red Hat created a YAML-to-JSON compilation / translation / validation tool), would be a tool that produces an Ignition definition for a simplified / higher-level user setup, since "user setup" is pretty much the extent of what Ignition is for

IOW, this layer appears to generally be handled by something like Terraform - Ignition is just the raw format used to roll it out

## moving on

[June 21, 2020 In Review](yhyh1-1fdz8-gn932-yxnfh-49z95)
