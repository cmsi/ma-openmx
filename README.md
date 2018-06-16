# ma-openmx

## How to prepare source files for phi package

1. on host

        VERSION=3.8
        DATE_PATCH=18June12
        VERSION_PATCH=3.8.5
        cd $HOME/vagrant/data/src
        wget http://www.openmx-square.org/openmx$VERSION.tar.gz
        wget http://www.openmx-square.org/bugfixed/$DATE_PATCH/patch$VERSION_PATCH.tar.gz
	tar zxvf openmx$VERSION.tar.gz
        (cd openmx$VERSION/source && tar zxvf ../../patch$VERSION_PATCH.tar.gz)
        mv openmx$VERSION openmx_$VERSION_PATCH
        tar zcvf openmx_$VERSION_PATCH.orig.tar.gz openmx_$VERSION_PATCH
	rm -f openmx$VERSION.tar.gz patch$VERSION_PATCH.tar.gz
