# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="CutefishOS Desktop Enviroment (meta package)"
HOMEPAGE="https://cutefishos.com"
SRC_URI=""

LICENSE="metapackage"
SLOT="0"
KEYWORDS="amd64"
IUSE="+base terminal extra"

RDEPEND="
		>=sys-libs/cutefish-core-0.3
		>=cutefish-base/cutefish-kwin-plugins-0.3
		>=cutefish-base/cutefish-icons-0.3
		>=cutefish-base/cutefish-filemanager-0.3
		>=cutefish-base/cutefish-calculator-0.3
		>=cutefish-base/cutefish-launcher-0.3
		>=cutefish-base/cutefish-qt-plugins-0.3
		>=cutefish-base/cutefish-settings-0.3
		>=cutefish-base/cutefish-statusbar-0.3
		>=cutefish-base/cutefish-dock-0.3
		>=cutefish-base/cutefish-wallpapers-0.2
		x11-misc/sddm
		terminal?	(	>=cutefish-base/cutefish-terminal-0.1	)
		extra?	(	>=cutefish-base/cutefish-texteditor-0.1
			>=cutefish-base/cutefish-videoplayer-0.1	)
"
