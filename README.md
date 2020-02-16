# ma-openmx

## How to prepare source files for phi package

1. on host

        VERSION=3.9
        DATE_PATCH=20Feb11
        VERSION_PATCH=3.9.2
        cd $HOME/vagrant/data/src
	rm -f openmx$VERSION.tar.gz patch$VERSION_PATCH.tar.gz
        wget http://t-ozaki.issp.u-tokyo.ac.jp/openmx$VERSION.tar.gz
        wget http://www.openmx-square.org/bugfixed/$DATE_PATCH/patch$VERSION_PATCH.tar.gz
        rm -rf openmx$VERSION
	tar zxvf openmx$VERSION.tar.gz
        (cd openmx$VERSION && wget http://www.openmx-square.org/openmx_man$VERSION/openmx$VERSION.pdf)
        (cd openmx$VERSION/source && tar zxvf ../../patch$VERSION_PATCH.tar.gz)
        mv openmx$VERSION/source/kpoint.in openmx$VERSION/work
        chmod 644 openmx$VERSION/work/kpoint.in
        find openmx$VERSION/work -name *.out | xargs rm -f
        mv openmx$VERSION openmx_$VERSION_PATCH
        tar zcvf openmx_$VERSION_PATCH.orig.tar.gz openmx_$VERSION_PATCH
        rm -rf openmx_$VERSION_PATCH
	rm -f openmx$VERSION.tar.gz patch$VERSION_PATCH.tar.gz
