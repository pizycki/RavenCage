# Raven Cage 

Containers for running RavenDB server instances inside containers.

* RavenDB : [official site](https://ravendb.net/)
* Docker: [official site](https://www.docker.com/)
* Windows Server Containers: [official site at MSDN](https://msdn.microsoft.com/virtualization/windowscontainers/containers_welcome)

## Versions
|RavenDB version|GitHub|Engine|Base Image|Status|Notes|
|:--|:--|:--|:--|:--|:--|
|`4.0`|**[RavenCage-4.0](https://github.com/pizycki/RavenCage-4.0)**|`Docker`, `Windows Containers`|[Ubuntu](https://hub.docker.com/_/ubuntu/), [Windows Server Core](https://hub.docker.com/r/microsoft/windowsservercore/)|In progress||
|`3.5.2 (3.5.2-35181)`|**[RavenCage-3.5](https://github.com/pizycki/RavenCage-3.5)**|`Windows Containers`|[Windows Server Core](https://hub.docker.com/r/microsoft/windowsservercore/)|Done||
|`3.0 (3.0.30153)`|-|-|-|Skipped||
|`2.5 (2.5.2996)`|-|-|-|Skipped||

Check `README.md` inside each project for requirements and intructions.

Images contain only `stable` and `alpha` builds of RavenDB. All `unstable` releases will be skipped.
