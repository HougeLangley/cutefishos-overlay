# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CMAKE_MAKEFILE_GENERATOR="emake"
inherit cmake

if [[ ${PV} == 9999* ]] ; then
	EDIT_REPO_URI="https://github.com/cutefishos/statusbar.git"
	EGIT_CHECKOUT_DIR=${WORKDIR}/statusbar-${PV}
else
	SRC_URI="https://github.com/cutefishos/statusbar/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86 ~x64-cygwin ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
fi

DESCRIPTION="Status of the system, such as time, system tray"
HOMEPAGE="https://github.com/cutefishos/statusbar"
LICENSE="GPL-3"
SLOT="0"
IUSE=""
RDEPEND=""
DEPEND="
	sys-libs/fishui
	sys-libs/libcutefish
	dev-libs/libdbusmenu-qt
	dev-qt/qtsvg
"
BDEPEND="${DEPEND}
	kde-frameworks/extra-cmake-modules
	dev-util/ninja
	dev-qt/linguist-tools[qml]
	dev-qt/assistant
	dev-qt/designer
	dev-qt/qdbusviewer
"

S="${WORKDIR}/statusbar-${PV}"

src_configure(){
	mycmakeargs=(
		-DCMAKE_INSTALL_PREFIX="/usr"
	)
	cmake_src_configure
}
