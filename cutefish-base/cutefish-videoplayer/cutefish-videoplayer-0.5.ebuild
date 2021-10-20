# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CMAKE_MAKEFILE_GENERATOR="emake"
inherit cmake

SRC_URI="https://github.com/cutefishos/videoplayer/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="amd64 arm64"
DESCRIPTION="An open source video player built with Qt/QML and libmpv"
HOMEPAGE="https://github.com/cutefishos/videoplayer"
LICENSE="GPL-3"
SLOT="0"
IUSE=""
RDEPEND=""
DEPEND="dev-qt/qtquickcontrols2[widgets]
	dev-qt/qtdeclarative
	media-video/mpv[libmpv]
	net-misc/youtube-dl
"
BDEPEND="${DEPEND}
	kde-frameworks/extra-cmake-modules
	dev-qt/linguist-tools[qml]
	dev-qt/assistant
	dev-qt/designer
	dev-qt/qdbusviewer
"

S="${WORKDIR}/videoplayer-${PV}"

src_configure(){
	mycmakeargs=(
		-DCMAKE_INSTALL_PREFIX="/usr"
	)
	cmake_src_configure
}
