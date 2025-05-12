# Inception

> This project aims to broaden your knowledge of system administration by using Docker. You will virtualize several Docker images, creating them in your new personal virtual machine.

***Concepts**: containerization, virtual machines, system administration, Docker.*

## Definitions

### What even is a (linux) container ?

- Video [EN] - [Containers explanation](https://youtu.be/0qotVMX-J5s?feature=shared)
- Article [EN] - [Containers // Virtual Machines](https://www.ibm.com/think/topics/containers-vs-vms)
- PDF [EN] - [What is an hypervisor and how does it work ?](https://blackberry.qnx.com/content/dam/qnx/whitepapers/2017/what-is-a-hypervisor-and-how-does-it-work-pt1.pdf)

A container is segmented part of the Linux kernel that is independant from the rest of the machine. That allows to isolate processes and dependancies, which enables the deployement of self-contained applications, which will run smoothly not matter the [infrastructure](#infrastructure)

That being said, the containers differ from a VM in the way that it *does not* implement a guest OS.

## Container primitives

Containerization was made possible by specific features of the Linux kernel, namely cgroups, namespaces and filesystems.

## Sources

- Video [EN] - [Cgroups & namespaces in the Linux kernel: containers primitives](https://www.youtube.com/watch?v=x1npPrzyKfs)
- Article [FR] - [Cgroups overview](https://blog.stephane-robert.info/docs/admin-serveurs/linux/cgroups/)
- Blog [FR] - [A nice DevOps blog full of ressources I'm keeping for later](https://blog.stephane-robert.info/)

## Infrastructure

The underlying physical or virtual framework that supports the execution of the running processes. Infrastructure can be physical (a laptop, desktop computer, a bare-metal server...), or virtual (applications running within a VM, or cloud-based computing).


https://www.perplexity.ai/search/please-explain-to-me-what-is-a-ZR8WDqT2TFGrHZfbe1QNmg
https://www.perplexity.ai/search/please-explain-the-underlying-F1mbBMQ_RbW2sTrOzTtAkw
https://www.perplexity.ai/search/what-is-container-SDrV.NnwT8itmDuL1HM2JQ
https://learn.microsoft.com/fr-fr/virtualization/hyper-v-on-windows/reference/hyper-v-architecture
https://cdn.intra.42.fr/pdf/pdf/133020/en.subject.pdf
https://blog.stephane-robert.info/docs/admin-serveurs/linux/cgroups/
https://blog.stephane-robert.info/
https://duckduckgo.com/?q=infrastructure+OS+diagram&t=ffab&iar=images&iai=https%3A%2F%2Fwww.interviewbit.com%2Fblog%2Fwp-content%2Fuploads%2F2022%2F06%2FLinux-Architecture-2048x1456.png
https://www.interviewbit.com/blog/linux-architecture/
https://en.wikipedia.org/wiki/Virtualization#cite_note-VMware_Paper-7
https://pdf.sciencedirectassets.com/282073/1-s2.0-S2212017312X00045/1-s2.0-S2212017312002587/main.pdf?X-Amz-Security-Token=IQoJb3JpZ2luX2VjECsaCXVzLWVhc3QtMSJHMEUCID4F186zqhptdxDVD6Q1GcEVIBZfbjUxt0kodLcdDrRpAiEA%2F3%2BoKVZ%2Bqazf%2FIcHSDFwPjYQjBiHYAmm2HAdJ7M8wNUquwUI1P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAFGgwwNTkwMDM1NDY4NjUiDIKDLzCOs6gBmITI8iqPBWjCEgd3xDC279RVGo110JCswsC%2BU5SsomyE%2BLysFTObLZpWE8CRlp2JPO6LPtrvKmn%2BHfolBDz6B4k0NJ5KiXr0lBU64U3XS5%2FVga6gnpYpHIxAKMMNgBwFEhc1jD3KANBIJWjZtJn04nFghWFUD8zjPl2%2Bixw8qSR1O9sIHKCA%2FKwW9Fdd5FMQ9OWZTgoHRMTxUzH3ozyXREkppXT3KkaDUq%2BGR2Yn%2FnUJQOydZyBtHuDXADNS9MlwvRLgdwlzTLXIsMHvRExrqN%2BqZa2xQDD%2FHuFgAaUDHqSVFpPvD0t4PlXxf9vsFMaFIkMTP1u6agQwZ5150qDGc9TPGMwnV14e%2Bl7tjuZS9FJufyHr6j2BO%2Fq1Qm3ZYHvd4G4%2FTmkVXd2aSk5yupxauLuhzpPHXgordzeA89WrmcEJkOLAY4DDg%2BdaNpT%2Bhb18%2FIdBaFFtqZFkNo0IltBuBc0w7LHPD8LmQpGUkVN0XrbRoAGEICgQKQ%2FkGoaC7YD7ASYHbpNJxcTBmewW%2B%2BgtKZXwzJZ4nWSHulVFVL%2FJ7BauU5F2pPHKCaXVAHkkXVlB6j465ik0NtEJ6hQ1%2Bp1nSLV6iekAA7DbEUqbAutZ6nKGScn7Lvo1HMd9p%2F4v%2BLN4ypQFbS%2ByW7lcmf8Q3AubJMCaa9EkdaSua9izAl3aQ6IpvAG1pXdTH44TBzpYQaxPQ2Al7Vs4YjF7awuNPXVyVdeqsE1DgzYv0xGebVwsRbfhUxoizbnnBN1btMtEd2DFHVrcw8yyUgtozt62FmenaBXDYOHPaOJEangNVml1TptKgRlf4iIKC%2FJ%2FEYS3OVXKX4QKd3kSuntf0eJI7BjzMNOl2hBw7rRUVGHraDmf331Uez7Gfm8w%2F6aHwQY6sQG6MUaiy4Pdyx8jMNwwv%2BiTux7oN8btz0r3nA7ZU7EWOKf0M9zNVADz0porn1inCDQjQj1yGUTw9oUJkIx7CSnpJMZ40pqmAlo%2FrINGqUQ2bujyl0zLlvmRGHhOsTpgNZ%2BqsAE7B2UoRmt58wEtpl7JjuRuSSD89P29M75nVM%2FGR1jHZdzcbsaTR8j24B5vn9svW1D1Fwj0vC38qKsedWF6373SLHN1K5KcIvipYEOON8c%3D&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20250512T114941Z&X-Amz-SignedHeaders=host&X-Amz-Expires=300&X-Amz-Credential=ASIAQ3PHCVTY4WOWF7IS%2F20250512%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=343514d4aff56ddf1082964dc5fb0e1555d6a5c57bcbb8cd098ce7754ca3d221&hash=556163149a9dd70df19e8d24989a64958ac8fae2328025e9a6148e1b77b90592&host=68042c943591013ac2b2430a89b270f6af2c76d8dfd086a07176afe7c76c2c61&pii=S2212017312002587&tid=spdf-408aed2e-9728-4bac-af87-e725c49b81f4&sid=de235c4781860140787b7ea706d4dec9d993gxrqb&type=client&tsoh=d3d3LnNjaWVuY2VkaXJlY3QuY29t&rh=d3d3LnNjaWVuY2VkaXJlY3QuY29t&ua=00145f500058065e0257&rr=93e9b1b39a012797&cc=fr
https://en.wikipedia.org/wiki/X86_virtualization#AMD_virtualization_(AMD-V)
https://www.mimuw.edu.pl/~wjaworski/RW/1_logika_eng.pdf
https://www.historytools.org/docs/how-does-emulation-work
https://omar.alkadi.net/wp-content/uploads/ch06.pdf
https://openclassrooms.com/fr/courses/2035766-optimisez-votre-deploiement-en-creant-des-container-avec-docker/6211517-creez-votre-premier-dockerfile
https://www.ibm.com/think/topics/containers-vs-vms
https://www.docker.com/resources/what-container/
https://superuser.com/questions/96739/is-there-a-method-to-export-the-urls-of-the-open-tabs-of-a-firefox-window