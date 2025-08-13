# Immich-retro

## How to build

Launch a Docker in Docker container

```bash
docker run --rm -d --privileged \
  --name dind-test \
  -v "$(pwd)":/home \
  -v "$(pwd)/overlay/var/lib/docker":/var/lib/docker \
  -e DOCKER_TLS_CERTDIR= \
  docker:dind
```

Download images (you may have to wait a few moments for the dind container to start dockerd)

```bash
docker exec -it dind-test sh ./home/docker-gen.sh
```

You can now kill the dind-test container

```bash
docker container stop dind-test
```

Run the following from the root of this repository

```bash
docker run --rm -it -v "$(pwd)":/home --privileged --name iso-build alpine sh ./home/build.sh
```

The built image will be placed in `out/`

### A couple of notes:

- The entirety of the operating system runs from RAM. No configuration, assets, or settings will be persisted on reboot of the machine. DO NOT use this as your main Immich instance.
  - All assets are stored in RAM so you may quickly run out of "storage" if your machine has less than 16GB of RAM.
- If booting from the DVD, the boot process **will be slow**. You may see "0%" for a prolonged period of time during boot. _Be patient!_. This part of the boot process requires reading the entire DVD and loading it into RAM.
- Minimum system requirements:
  - 2 core x86 processor
  - 8GB of RAM, 16GB recommended
  - No storage drive needed!

