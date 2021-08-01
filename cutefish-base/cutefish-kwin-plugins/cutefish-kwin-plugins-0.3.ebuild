# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

SRC_URI="https://github.com/cutefishos/kwin-plugins/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
https://github.com/HougeLangley/cutefishos-overlay/releases/download/v0.3-patches/fixed_kwin-plugins_QApplication.patch
"
KEYWORDS="~amd64"
DESCRIPTION="CutefishOS KWin Plugins"
HOMEPAGE="https://github.com/cutefishos/kwin-plugins"
LICENSE="GPL-3"
SLOT="0"
IUSE=""
RDEPEND=""
DEPEND="
	kde-frameworks/kconfig
	kde-plasma/kdecoration
	kde-frameworks/kguiaddons
	kde-frameworks/kcoreaddons
	kde-frameworks/kconfigwidgets
	kde-frameworks/kwindowsystem
	kde-frameworks/kwayland
	kde-plasma/kwin
"
BDEPEND="${DEPEND}
	kde-frameworks/extra-cmake-modules
	dev-util/ninja
	dev-qt/linguist-tools[qml]
	dev-qt/assistant
	dev-qt/designer
	dev-qt/qdbusviewer
	dev-qt/qtopengl
"

S="${WORKDIR}/kwin-plugins-${PV}"

PATCHES=( "${DISTDIR}/fixed_kwin-plugins_QApplication.patch" )

src_prepare(){
	cmake_src_prepare
}

src_configure(){
	mycmakeargs=(
		-DCMAKE_INSTALL_PREFIX="/usr"
	)
	cmake_src_configure
}
