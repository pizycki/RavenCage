# RavenCage - dockerized RavenDB

Containers with RavenDB server inside containers.

# Links
* RavenCage on DockerHub: [pizycki/ravendb](https://hub.docker.com/r/pizycki/ravendb/)
* RavenDB: [official site](https://ravendb.net/)
* Docker: [official site](https://www.docker.com/)
* Windows Server Containers: [official site at MSDN](https://msdn.microsoft.com/virtualization/windowscontainers/containers_welcome)

# Versions

Images contain only `stable` builds of RavenDB. All `unstable` releases will be skipped.

## Released

### RavenDB Stable 3.5 (latest)
* **Tag:** `3.5.179`, `latest`
* **RavenDB version**: 3.5 Stable
* **RavenDB release**: 35179
* **Base image:** [Windows Server Core](https://hub.docker.com/r/microsoft/windowsservercore/)


### RavenDB 3.5 RC
* **Tag:** `3.5.166`
* **RavenDB version**: 3.5-RC
* **RavenDB release**: 35166
* **Base image:** [Windows Server Core](https://hub.docker.com/r/microsoft/windowsservercore/)


RavenDB 3.0 and 2.5 are skipped.

## Planned

### RavenDB 4
Images contain only `stable` builds of RavenDB. All `unstable` releases will be skipped.
**Tag:** -
**RavenDB version**: -
**RavenDB release**: -
**Base image:** [Ubuntu](https://hub.docker.com/_/ubuntu/)/[Alpine](https://hub.docker.com/_/alpine/)


# Requirements

In prior to use RavenCage you need to have one of the following:

* Windows 2016 build `14393` with installed Windows Server Constainers or Hyper-V Containers
* Windows 10 build `14393.222` with installed Hyper-V Containers

To check your OS build, `Win+R` and type `winver`.

To install Windows Containers on your machine follow on of there guides: [Windows Server 2016](https://msdn.microsoft.com/pl-pl/virtualization/windowscontainers/quick_start/quick_start_windows_server), [Windows 10](https://msdn.microsoft.com/en-us/virtualization/windowscontainers/quick_start/quick_start_windows_10)

# Container usage
## Windows Server 2016 (Windows Server Containers)

### Run in background
Run server on port `8080` as service.

```docker
docker run -d pizycki/ravendb:latest
```

### Run in console and debug mode
Run server on port `8080` in `debug` mode and interactive console.

```docker
docker run -it -e mode=debug pizycki/ravendb:latest
```

> Running on IIS is not supported here.

### Map storage
Map directory where your databases will be stored to `C:\db\` on your host. You can also map place in your network.
```docker
docker run -d -v C:\db\:C:\RavenDB\Server\Databases\ pizycki/ravendb:latest 
```

### Map RavenDB listen port
Make you container listen on port `5555`
```docker
docker run -d -p 5555:8080 pizycki/ravendb:latest 
```

Both **volume** and **port** mapping work with either `service` and `debug` mode.

### Compose 
Run with other dockerized apps
TBD

### Swarm
RavenDB clusters

TBD

## Windows 10 (Hyper-V Containers)
TBD

---

# Repository

## How to upgrade RavenDB in container

Modify your `Dockerfile` and `powershell` scripts. If you modify any of `powershell` script files **you have to**  add `--no-cache` flag while building new image. Another way is to  delete layer containing `ADD`/`COPY` instruction with modified script file. Most common change in container image will be RavenDB ZIP file URL. 
For more information how layer caching in Docker works, see [this article](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/#/build-cache).

Build image with this command. Remember to replace `<tag>` with actual tag, i.e.: RavenDB version.
```docker
docker build -t pizycki/ravendb:<tag> .
```

If it's the latest version of RavenDB, tag new created images as `latest`.
```docker
docker tag pizycki/ravendb:<tag> pizycki/ravendb:latest
```

# FAQ

## I cannot access my RavenDB server website.
There is something wrong with `localhost`, Win2016 and Docker. I have no idea what can that be.
To get access to RavenDB website, get container IP. Simply type `docker inspect <container_ID>` and look for `Networks.IPAddress`.
Make sure the port you mapped to is open in your firewall settings!

## Can I run Windows Containers without Hyper-V on Windows 10?

Right now, Windows 10 allows to run containers only in Hyper-V mode.

# Very Fast Snippets

```docker
# Remove all old containers
docker rm $(docker ps -q -f status=exited)

# Delete all containers (that are not started) 
docker rm $(docker ps -a -q)

# Delete all images
docker rmi $(docker images -q)

# Customize docker containers list
docker ps --format '{{.Names}}\t{{.Image}}' 
```