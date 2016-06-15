# Copyright 2013 Hacking Networked Solutions
# Distributed under the terms of the GNU General Public License v3
# $Header: $

EAPI="3"

inherit eutils git-r3

DESCRIPTION="A 'wiring' like library for the Raspberry Pi"
HOMEPAGE="http://wiringpi.com/"
EGIT_REPO_URI="git://github.com/ED6E0F17/WiringPi.git"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="arm64"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

MAKEDIRS="wiringPi devLib gpio"

src_compile() {
	for d in ${MAKEDIRS}; do
		cd "${WORKDIR}/${P}/${d}"	
		emake 
	done
}

src_install() {
	tc-export CXX
	mkdir -p "${D}/lib"
	mkdir -p "${D}/bin"
	for d in ${MAKEDIRS}; do
		cd "${WORKDIR}/${P}/${d}"	
		emake DESTDIR="${D}/" PREFIX="./" install
	done
}
