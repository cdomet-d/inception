# Alpine commands

## Services

List running services

```bash
rc-status
```

Check status of a specific service

```bash
rc-status <ServiceName> status
```

List services enabled at boot

```bash
rc-update show
```

List services for a specific runlevel (here, default)

```bash
rc-update show default
```

List all services (not just running):

```bash
rc-status -s
```
