#!/bin/sh
. $(dirname $0)/path.sh

if [ -f openmx-${VERSION_BASE}.orig.tar.gz ]; then
  exit 127
fi

VERSION_MM=$(echo ${VERSION_BASE} | cut -d . -f 1,2)
if [ ${VERSION_BASE} = "3.9.9" ]; then
  VERSION_DATE="21Oct17"
fi
wget http://t-ozaki.issp.u-tokyo.ac.jp/openmx${VERSION_MM}.tar.gz
wget http://www.openmx-square.org/bugfixed/${VERSION_DATE}/patch${VERSION_BASE}.tar.gz

tar zxvf openmx${VERSION_MM}.tar.gz
mv openmx${VERSION_MM} openmx-${VERSION_BASE}
(cd openmx-${VERSION_BASE}/source; tar zxvf ../../patch${VERSION_BASE}.tar.gz)
(cd openmx-${VERSION_BASE}; find . -type f | xargs chmod -x)
tar zcvf openmx_${VERSION_BASE}.orig.tar.gz openmx-${VERSION_BASE}
rm -rf openmx-${VERSION_BASE} openmx${VERSION_MM}.tar.gz patch${VERSION_BASE}.tar.gz
