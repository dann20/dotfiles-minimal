#!/usr/bin/sudo sh

BOOTLOADER_NAME="ARCH"
EFI_DIR="/boot/EFI"

cp -rv themes/ /usr/share/grub/
cp -irv grub.d/ /etc/default/
cp -iv grub /etc/default/

echo "----------- GENERATING NEW grub.cfg -----------"
grub-mkconfig -o /boot/grub/grub.cfg && \

echo "----------- INSTALLING BOOTLOADER -----------"
grub-install --target=x86_64-efi --efi-directory=$EFI_DIR --bootloader-id=$BOOTLOADER_NAME --recheck
