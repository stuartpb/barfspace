# We Need to Talk About Kubeapps

Is the problem just that it creates all cronjobs with no time variance so it pegs the CPU and makes things time out when it refreshes the repos?

[issue made](https://github.com/kubernetes/kubernetes/issues/91652)

They've all been dying like this:

```
time="2020-06-02T01:12:15Z" level=fatal msg="net/http: request canceled (Client.Timeout exceeded while reading body)"
```

thinking I might add a startup pod to these that sleeps them at random? or maybe I'll just reschedule them slightly

## staggering

Here's the new schedule:

- `*/10 * * * *` for stable
- `2-52/10 * * * *` for incubator
- `3-53/10 * * * *` for bitnami
- `5-55/10 * * * *` for svc-cat

figured out via [cron.guru's "every uneven (odd) minute" suggestion](https://crontab.guru/every-uneven-minute)

## anyway

this might have been a problem due to the time being 100 seconds off? we'll see after more monitoring
