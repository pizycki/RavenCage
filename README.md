# Raven Cage 

Containers for running RavenDB server instances inside containers.

* RavenDB : [official site](https://ravendb.net/)
* Docker: [official site](https://www.docker.com/)
* Windows Server Containers: [official site at MSDN](https://msdn.microsoft.com/virtualization/windowscontainers/containers_welcome)

## Versions
|RavenDB version|Git branch|Technology|Base Image|Status|Commentary|
|:--|:--|:--|:--|:--|:--|
|`4.0`|[4.0](https://github.com/pizycki/RavenCage-4.0)|`Docker`|[Ubuntu](https://hub.docker.com/_/ubuntu/)|Planned|Waiting for stable `RavenDB:4.0`.|
|`3.5 (3.5.0-rc-35166)`|[3.5](https://github.com/pizycki/RavenCage-3.5)|`Windows Containers`|[Windows Server Core](https://hub.docker.com/r/microsoft/windowsservercore/)|Done|Some minor issues.|
|`3.0 (3.0.30153)`|-|-|-|Skipped||
|`2.5 (2.5.2996)`|-|-|-|Skipped||

Check `README.md` inside each project for requirements and intructions.

Images contain only `stable` and `alpha` builds of RavenDB. All `unstable` releases will be skipped.