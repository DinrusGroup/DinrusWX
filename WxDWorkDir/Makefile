BUD = bud
REBUILD=rebuild

all:
	cd wxc
	dmmake
	cd ..
	cd wx
	dmmake
	cd ..

samp:
	cd Samples
	dmmake
	cd ..

test: samp
	

helpers:
	cd wxc
	dmmake helpers
	cd ..

build:
	cd wxc
	dmmake build
	cd ..

bud: build build.brf
	cd wxc
	dmmake
	cd ..
	$(BUD) @build.brf -op -allobj
	move wx\wx.lib wxd.lib

rebuild: build build.brf
	cd wxc
	dmmake
	cd ..
	$(REBUILD) -rfbuild.brf -oqwx -ofwxd.lib

clean:
	cd wx
	dmmake clean
	cd ..
	cd wxc
	dmmake clean
	cd ..
	cd Samples
	dmmake clean
	cd ..

