# immich-retro

This is the repo used to generate the ISO images for the Immich Stable release demo DVDs.

## How to build

Building requires Docker and a Linux host OS due to reliance on fuse-overlay and other kernal extensions to build. 

1. Select the Immich version you would like to run. Set the `IMMICH_VERSION` in **both** `docker-gen.sh` and `overlay/usr/app/.env`

2. Delete the `overlay/var/lib/docker` folder if present. Launch a "Docker in Docker" (dind) container

```bash
docker run --rm -d --privileged \
  --name dind-test \
  -v "$(pwd)":/home \
  -v "$(pwd)/overlay/var/lib/docker":/var/lib/docker \
  -e DOCKER_TLS_CERTDIR= \
  docker:dind
```

3. Download images (you may have to wait a few moments for the dind container to start dockerd)

```bash
docker exec -it dind-test sh ./home/docker-gen.sh
```

4. You can now kill the dind-test container

```bash
docker container stop dind-test
```

5. Run the following from the root of this repository

```bash
docker run --rm -it -v "$(pwd)":/home --privileged --name iso-build alpine sh ./home/build.sh
```

6. Success! The built `.iso` will be placed in `out/`.

### Adding a demo library

There is a `docker-compose.yml` inside of `utils/instance-gen` that you can run to create and customize an included in the image. Ensure that `docker compose up` is run from **within** `utils/instance-gen` in order to have the folders map properly

### A couple of notes:

- The entirety of the operating system runs from RAM. No configuration, assets, or settings will be persisted on reboot of the machine. DO NOT use this as your main Immich instance.
  - The entire system is run in RAM so you may quickly run out of storage if your machine only has 8GB of memory.
- If booting from the DVD, the boot process **will be slow**. You may see "0%" for a prolonged period of time during boot. _Be patient!_. This part of the boot process requires reading the entire DVD and loading it into RAM.
- Minimum system requirements:
  - 2 core x86 processor
  - 8GB of RAM, 12GB+ recommended
  - No storage drive needed!

