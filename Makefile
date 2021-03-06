
##############################################
# EDIT THESE VARIABLES ACCORDING TO YOUR CONFIGURATION:

# if you want to build UPMT with security extensions, decomment the following line
#EXTRA_CFLAGS := -DUPMT_S

# if you want to build UPMT with rme extensions, decomment the following line
#EXTRA_CFLAGS := -DRME
##############################################

.PHONY: default install clean

default:
	$(MAKE) -C kernel/
	$(MAKE) -C upmtconf/
	$(MAKE) -C upmt-appmon/
	$(MAKE) -C java/upmt/src/
	$(MAKE) -C netem/custom/
	sh compileRME
install:
	$(MAKE) -C kernel/ install
	$(MAKE) -C upmtconf/ install
	$(MAKE) -C upmt-appmon/ install
	$(MAKE) -C java/upmt/src/ install
	$(MAKE) -C netem/custom/ install

clean:
	$(MAKE) -C kernel/ clean
	$(MAKE) -C upmtconf/ clean
	$(MAKE) -C upmt-appmon/ clean
	$(MAKE) -C java/upmt/src/ clean
	$(MAKE) -C netem/custom/ clean
