#!/usr/bin/sudo sh

BOOTLOADER_NAME="ARCH"
EFI_DIR="/boot/EFI"

cp -r themes/ /usr/share/grub/
cp -ri grub.d/ /etc/default/
cp -i grub /etc/default/

echo "----------- GENERATING NEW grub.cfg -----------" && \
grub-mkconfig -o /boot/grub/grub.cfg && \

echo "----------- INSTALLING BOOTLOADER -----------" && \
grub-install --target=x86_64-efi --efi-directory=$EFI_DIR --bootloader-id=$BOOTLOADER_NAME --recheck
