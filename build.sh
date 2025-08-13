#!/bin/sh

apk add alpine-sdk alpine-conf xorriso squashfs-tools grub grub-efi doas docker openrc fuse-overlayfs mtools dosfstools grub-efi

echo "permit persist root" > /etc/doas.d/doas.conf
echo "permit nopass root" >> /etc/doas.d/doas.conf

addgroup build docker

# su - build -c "
abuild-keygen -i -a -n
apk update

cd /home
./scripts/mkimage.sh --tag immich --outdir out --arch x86_64 --repository https://dl-cdn.alpinelinux.org/alpine/latest-stable/main --repository https://dl-cdn.alpinelinux.org/alpine/latest-stable/community --profile immich
