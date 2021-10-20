# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

SRC_URI="
https://github.com/cutefishos/fishui/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
https://github.com/HougeLangley/cutefishos-overlay/releases/download/v0.3-patches/fixed_QApplication.patch -> v0.3-fixed_QApplication.patch
"
KEYWORDS="amd64 arm64"
DESCRIPTION="GUI library based on QQC2 for Cutefish applications"
HOMEPAGE="https://github.com/cutefishos/fishui"
LICENSE="GPL-3"
SLOT="0"
IUSE=""
RDEPEND=""
DEPEND="
	kde-frameworks/kwindowsystem
	dev-qt/qtquickcontrols2[widgets]
"
BDEPEND="${DEPEND}
	kde-frameworks/extra-cmake-modules
	dev-util/ninja
	dev-qt/linguist-tools[qml]
	dev-qt/assistant
	dev-qt/designer
	dev-qt/qdbusviewer
"

S="${WORKDIR}/${PN}-${PV}"

PATCHES=( "${DISTDIR}/v0.3-fixed_QApplication.patch" )

src_prepare(){
	cmake_src_prepare
}

src_configure(){
	mycmakeargs=(
		-DCMAKE_INSTALL_PREFIX="/usr"
	)
	cmake_src_configure
}
