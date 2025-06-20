# Inception

> This project aims to broaden your knowledge of system administration by using Docker. You will virtualize several Docker images, creating them in your new personal virtual machine.

***Concepts**: containerization, virtual machines, system administration, Docker.*

## What even is a (Linux) container ?

- Video [EN] - [Containers explanation](https://youtu.be/0qotVMX-J5s?feature=shared)
- Article [EN] - [Containers // Virtual Machines](https://www.ibm.com/think/topics/containers-vs-vms)

A container is a process or group of processes, running on a host OS, that is isolated from the rest of the machine. Containers leverage [kernel primitives](https://www.youtube.com/watch?v=x1npPrzyKfs), namely [cgroups](https://man7.org/linux/man-pages/man7/cgroups.7.html) (also [here, but in french](https://blog.stephane-robert.info/docs/admin-serveurs/linux/cgroups/)) and [namespaces](https://www.man7.org/linux/man-pages/man7/namespaces.7.html).

### What a container is not (and some rambling about emulation)

A container is **not a virtual machine**: it shares the host's OS, though it possesses an *isolated* user space, filesystem, network stack and process tree.

That allows to isolate processes and dependencies, which enables the deployment of self-contained applications, which will run smoothly not matter the [infrastructure](https://www.techtarget.com/searchdatacenter/definition/infrastructure)), as long as the **kernel is compatible** with the containers being used (ie, Linux containers will run on any infrastructure running a Linux kernel; you'll need Windows containers to run a Windows infrastructure).

You will often see online that a container is **lighter** than a virtual machine. That is true; a virtual machine is completely isolated from the host machine, including the operating system. This allows users to run incompatible on **any machine** regardless of the host OS or CPU architecture. This is achieved through virtualization technology (notably [hypervisors](https://blackberry.qnx.com/content/dam/qnx/whitepapers/2017/what-is-a-hypervisor-and-how-does-it-work-pt1.pdf) and [emulators]), leveraging **virtualized** versions of hardware components.

Virtualized software components are simply programs that emulate the behavior of a given hardware component and "translates" it so the instructions given by the guest OS make sense to host OS and the physical hardware.

The [QEMU](https://www.qemu.org/docs/master/about/index.html) (also on [Github](https://github.com/qemu/qemu)) documentation is full of information on how these things work. I haven't read it all, and it's a bit beyond the scope of this project, but I found very interesting to skim.

> Thanks to [@bbischof](https://github.com/B-Bischoff) for his help in understanding what the fuck hardware virtualization means :).

### Docker

Docker is an abstraction layer leveraging kernel container primitives to provide developpers with a standardized working environnement. As long as the kernel is compatible, it is possible to generate and **image** in which you can install everything your application needs. It also allows to ship applications in a self-contained way, limiting unused dependancies and bloat.

## Reading

### Misc

- Blog [FR] - [A nice DevOps blog full of ressources I'm keeping for later](https://blog.stephane-robert.info/)
- Obscure Polish Class Slides [EN] - [Logic knowledge representation](https://www.mimuw.edu.pl/~wjaworski/RW/1_logika_eng.pdf)
  - **Why do we care about this ?** At some point in my researched, I ran into the phrase "logical representation of an hardware component". As this means fuckall to me, I've endeavored to understand what *logic representation* means. Turns out it's part of [knowdledge representation](https://en.wikipedia.org/wiki/Knowledge_representation_and_reasoning), a pretty important skill to have when working as a programmer: it's basically the science of translating human knowledge into something a computer can understand, making the design and construction of complex systems easier.

### Emulation

- Article [EN] - [What is an emulator ?](https://www.historytools.org/docs/what-is-an-emulator)
- Article [EN] - [High level explanation of what emulation works](https://www.historytools.org/docs/how-does-emulation-work)

#### Instruction set architecture ()

- Video [EN] - [Why are applications operating system specific](https://youtu.be/eP_P4KOjwhs?feature=shared)
- The ol' reliable - [Instruction set architecture](https://en.wikipedia.org/wiki/Instruction_set_architecture)

### Virtualization

- Article [EN] - [Summary of virtualization techniques](https://www.sciencedirect.com/science/article/pii/S2212017312002587?ref=pdf_download&fr=RR-2&rr=93f13af21fe727a6) (scroll down to find PDF).
- The ol' reliable - [Virtualization on Wikipedia](https://en.wikipedia.org/wiki/Virtualization)
