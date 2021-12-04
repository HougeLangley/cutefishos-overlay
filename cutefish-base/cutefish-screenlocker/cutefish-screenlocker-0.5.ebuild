# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CMAKE_MAKEFILE_GENERATOR="emake"
inherit cmake

if [[ ${PV} = 9999* ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/cutefishos/screenlocker.git"
	EGIT_CHECKOUT_DIR=screenlocker-${PV}
	KEYWORDS=""
else
	SRC_URI="https://github.com/cutefishos/screenlocker/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm64 ~riscv"
fi

DESCRIPTION="CutefishOS system screen locker"
HOMEPAGE="https://github.com/cutefishos/core"
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
	dev-qt/linguist-tools[qml]
	dev-qt/assistant
	dev-qt/designer
	dev-qt/qdbusviewer
"

S="${WORKDIR}/screenlocker-${PV}"

src_configure(){
	mycmakeargs=(
		-DCMAKE_INSTALL_PREFIX="/usr"
	)
	cmake_src_configure
}
