Steps to build:

1. Fire up a local alpine image on Docker:

```bash
docker run --rm -it -v "$(pwd)":/home alpine sh
```

2. Inside the container, run

```bash
apk add alpine-sdk abuild
```

3. Run

```bash
tar --numeric-owner --owner=0 --group=0 -cf root-overlay.tar -C overlay .
```

3. Run

```bash
./mkimage.sh --tag immich \
	--outdir out \
	--arch x86_64 \
	--repository https://dl-cdn.alpinelinux.org/alpine/latest-stable/main \
	--profile immich

```

4.
