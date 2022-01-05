# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CMAKE_MAKEFILE_GENERATOR="emake"
inherit cmake

if [[ ${PV} == 9999* ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/cutefishos/settings.git"
	EGIT_CHECKOUT_DIR=cutefish-settings-${PV}
	KEYWORDS=""
else
	EGIT_COMMIT="abbaa8c7f0c5b267cd6d0478d6ebab97819e0078"
	SRC_URI="https://github.com/cutefishos/settings/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm64 ~riscv"
	S="${WORKDIR}/settings-${EGIT_COMMIT}"
fi

DESCRIPTION="System Settings application for Cutefish Desktop"
HOMEPAGE="https://github.com/cutefishos/settings"
LICENSE="GPL-3"
SLOT="0"
IUSE=""
RDEPEND="
	sys-libs/fishui
	sys-libs/libcutefish
"
DEPEND="
	dev-qt/qtcore[egl]
	dev-qt/qtgui
	dev-qt/qtquickcontrols2
	dev-qt/qtx11extras
	dev-qt/qtdbus
	dev-qt/qtxml
	dev-qt/qtconcurrent
	dev-qt/linguist-tools
	dev-libs/icu
	x11-libs/libXi
	x11-libs/libXcursor
	kde-frameworks/networkmanager-qt
	kde-frameworks/modemmanager-qt
"
BDEPEND="${DEPEND}
	dev-util/ninja
"

src_configure(){
	mycmakeargs=(
		-DCMAKE_INSTALL_PREFIX="/usr"
	)
	cmake_src_configure
}
