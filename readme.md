# Inception

Inception is a containerization project using Docker. There is a potentially new things to learn in this project, and it can get quite overwhelming; this readme is intended as a guide to help you start out.

## Pedagogy goals

Inception's goal is to teach you:

- the basics & good practice of containers, through Docker and docker-compose;
- the logic of microservices architecture;
- webserving and webshosting.

Don't be fooled: this as much about databases and webserving that it is about containerization.

Inception can be a frustrating project, because for a while nothing will work until something does. Don't be discouraged ! There's a lot of interresting stuff to be learned here.

## Running in a virtual machine

Inception is supposed to be done in a virtual machine. Take a minute to set yours up, and take time to consider the following:

Heed the following advice:

- You do not need a graphical interface. Everything on your VM can be accessed through SSH:
  - VScode via the [Microsoft Remote SSH extentension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh)
  - Your browser can redirect its requests to your VM through a SOCKS5 proxy and SSH tunneling (see [SSH is your friend](#ssh-is-your-friend)).
  - You can work in your own terminal via SSH.
- The lighter your VM, the less lag you will have. I recommend using Alpine as your VM OS, but that's just me.

---

### SSH is your friend

For this part, you should brush up on SSH functionnalities: [here is a good blog post about it](https://www.maxmanders.co.uk/2015/06/04/getting-more-out-of-ssh/).

- You can use SSH tunnelling (static port forwarding, `-L`) to connect to your VM's localhost address. This will allow you to connect to your website **directly via your host machine**. [This](https://iximiuz.com/en/posts/ssh-tunnels/) is a great article about it.
- In order to access localhost at the address required by the subject (login.42.fr), you browser needs to **resolve** the domain name. You can't do that if you don't have root access, which we don't at school. A workaround is to set up a proxy in order to redirect the host requests to be resolved on your VM.
- A proxy is a intermediary server that stands between your machine and the remote machine. It's often used in the context of *security* and *anonymity* (since it shields you IP from the destination), but in our case it mostly allows us to bypass the issue of DNS configuration. I used a SOCKS5 proxy, which is set up using `ssh -D`, and a few configuration steps in your browser of choice. You may read more about it [in this guide](.doc/proxy.md).