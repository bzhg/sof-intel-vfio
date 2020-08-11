all : vfio_boot.o probe.o
	cc -o vfio_sof vfio_boot.o probe.o
	scp vfio_sof device_to_vfio.sh dut:/root

vfio_boot.o : vfio_boot.c common.h
	cc -c vfio_boot.c
probe.o : probe.c
	cc -c probe.c

clean :
	rm *.o vfio_sof