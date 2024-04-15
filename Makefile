obj-m := avt-csi2-3.o

ccflags-y := -Werror
#obj-m += startstop.o
#startstop-objs := start.o stop.o


SRC := $(shell pwd)
KERNEL_SRC := "/lib/modules/$(shell uname -r)/build"

#CFLAGS += -DISP8000NANO_V1802
all:
	$(MAKE) -C $(KERNEL_SRC) M=$(SRC)

install:
	$(MAKE) -C $(KERNEL_SRC) M=$(SRC) modules_install

clean:
	rm -f *.o *~ core .depend .*.cmd *.ko *.mod.c
	rm -f Module.markers Module.symvers modules.order
	rm -rf .tmp_versions Modules.symvers