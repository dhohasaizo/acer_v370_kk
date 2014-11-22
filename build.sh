#script compile kernel acer e2 by doha saizo
#setting build

# CCACHE
export CCACHE_DIR=/home/doha/.ccache
export CC=ccache gcc
export PATH=/usr/lib/ccache:$PATH
export USE_CCACHE=1

cd /home/doha/kernel/android_KK_v370
export CROSS_COMPILE=/home/doha/toolchain-4.6.3/bin/arm-linux-androideabi-
./makeMtk -o=TARGET_BUILD_VARIANT=user n k

cd /home/doha/kernel/android_KK_v370/mediatek/build/tools
./mkimage /home/doha/kernel/android_KK_v370/out/target/product/doha86_wet_kk/obj/KERNEL_OBJ/arch/arm/boot/zImage KERNEL > /home/doha/kernel/android_KK_v370/mtktools/boot.img-kernel.img

cd /home/doha/kernel/android_KK_v370/mtktools
./repack.pl -boot boot.img-kernel.img boot.img-ramdisk /home/doha/kernel/android_KK_v370/mtktools/doha/boot.img

cd /home/doha/kernel/android_KK_v370/mtktools/doha
zip -r out .
mv /home/doha/kernel/android_KK_v370/mtktools/doha/out.zip /home/doha/kernel/android_KK_v370/kernel3.4.67KK.zip
