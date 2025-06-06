# SSH Magic

## SSH tunnelling

Since it doesn't make sense for the VM hosting the Dockers and the webapp to have a full graphical interface, we are going to use SSH tunneling in order to have our local machine browser remotely connect to the webapp.

In order to do that, we use :

```bash
$ ssh -L [local IP]:[local port]:[remote ip]:[remote port] user@vm-ip

# example:
$ ssh -L localhost:8443:localhost:443 cdomet-d@127.0.0.1
```

> NB: we've already done all the SSH setup on the VM; if you haven't done that, I recommand you do it now.

SSH tunnelling opens an encrypted, bidirectionnal channel between two machines. It allows the user on the local machine to request data from a remote host (IE, a webserver), and for that webserver to reply to the user's query.

The request for data is **always** made by the local machine.

This allows us to circumvent issues created by the fact that most default (22, 80, 443...) are already setup to listen to specific services on the machines we use; SSH tunnelling allows users to avoid permissions and network issues.
