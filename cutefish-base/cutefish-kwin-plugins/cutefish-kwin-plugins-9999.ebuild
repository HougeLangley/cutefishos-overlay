# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

if [[ ${PV} == 9999* ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/cutefishos/kwin-plugins.git"
	EGIT_CHECKOUT_DIR=kwin-plugins-${PV}
else
	SRC_URI="https://github.com/cutefishos/kwin-plugins/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
		https://github.com/HougeLangley/cutefishos-overlay/releases/download/v0.5-patches/fixed_kwin-plugins_QApplication.patch"
	KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86 ~x64-cygwin ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
fi

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

src_prepare(){
	if [[ ${PV} != 9999* ]] ; then
		eapply "${DISTDIR}/fixed_kwin-plugins_QApplication.patch"
	fi
	
	cmake_src_prepare
}

src_configure(){
	mycmakeargs=(
		-DCMAKE_INSTALL_PREFIX="/usr"
	)
	cmake_src_configure
}
