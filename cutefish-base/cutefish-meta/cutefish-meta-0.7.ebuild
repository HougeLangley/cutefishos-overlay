# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="CutefishOS Desktop Enviroment (meta package)"
HOMEPAGE="https://cutefishos.com"
SRC_URI=""

LICENSE="metapackage"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="+base +terminal +extra"

RDEPEND="
		=sys-libs/cutefish-core-0.7
		=cutefish-base/cutefish-kwin-plugins-0.7
		=cutefish-base/cutefish-icons-0.7
		=cutefish-base/cutefish-filemanager-0.7
		=cutefish-base/cutefish-calculator-0.7
		=cutefish-base/cutefish-launcher-0.7
		=cutefish-base/cutefish-qt-plugins-0.7
		=cutefish-base/cutefish-settings-0.7
		=cutefish-base/cutefish-statusbar-0.7
		=cutefish-base/cutefish-dock-0.7
		=cutefish-base/cutefish-wallpapers-0.7
		=cutefish-base/cutefish-screenlocker-0.7
		=cutefish-base/cutefish-screenshot-0.7
		=cutefish-base/cutefish-videoplayer-0.7
		x11-misc/sddm
		terminal?	(	=cutefish-base/cutefish-terminal-0.7	)
		extra?	(	=cutefish-base/cutefish-texteditor-0.7	)
"
