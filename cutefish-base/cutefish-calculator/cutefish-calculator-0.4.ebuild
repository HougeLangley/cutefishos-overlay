# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CMAKE_MAKEFILE_GENERATOR="emake"
inherit cmake

SRC_URI="https://github.com/cutefishos/calculator/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64"
DESCRIPTION="CutefishOS Calculator"
HOMEPAGE="https://github.com/cutefishos/calculator"
LICENSE="GPL-3"
SLOT="0"
IUSE=""
RDEPEND=""
DEPEND="
	sys-libs/fishui
	sys-libs/libcutefish
"
BDEPEND="${DEPEND}
	kde-frameworks/extra-cmake-modules
	dev-util/ninja
	dev-qt/linguist-tools[qml]
	dev-qt/assistant
	dev-qt/designer
	dev-qt/qdbusviewer
"

S="${WORKDIR}/calculator-${PV}"

src_configure(){
	mycmakeargs=(
		-DCMAKE_INSTALL_PREFIX="/usr"
	)
	cmake_src_configure
}