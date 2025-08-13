# Immich-retro

## How to build

Run the following from the root of this repository

```bash
docker run --rm -it -v "$(pwd)":/home --privileged alpine sh ./home/build.sh
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
