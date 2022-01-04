# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

if [[ ${PV} == 9999* ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/cutefishos/libcutefish.git"
	EGIT_CHECKOUT_DIR=${PN}-${PV}
	KEYWORDS=""
else
	EGIT_COMMIT="7a1f2fa580de0e4fab554793c7915a8258cd0f40"
	SRC_URI="https://github.com/cutefishos/libcutefish/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm64 ~riscv"
	S="${WORKDIR}/${PN}-${EGIT_COMMIT}"
fi

DESCRIPTION="System library for Cutefish applications"
HOMEPAGE="https://github.com/cutefishos/libcutefish"
LICENSE="GPL-3"
SLOT="0"
IUSE=""
RDEPEND=""
DEPEND="
	dev-qt/qtcore[egl]
	dev-qt/qtgui[icu]
	dev-qt/qtdeclarative
	dev-qt/qtquickcontrols2
	dev-qt/qtdbus
	dev-qt/qtxml
	dev-qt/qtconcurrent
	kde-frameworks/bluez-qt
	kde-frameworks/networkmanager-qt
	kde-frameworks/modemmanager-qt
	kde-plasma/libkscreen
	kde-frameworks/kio
	dev-qt/qtsensors
	media-libs/libcanberra[pulseaudio]
"
BDEPEND="${DEPEND}"

src_configure(){
	mycmakeargs=(
		-DCMAKE_INSTALL_PREFIX="/usr"
	)
	cmake_src_configure
}
