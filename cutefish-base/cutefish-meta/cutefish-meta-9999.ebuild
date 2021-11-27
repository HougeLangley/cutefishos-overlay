# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="CutefishOS Desktop Enviroment (meta package)"
HOMEPAGE="https://cutefishos.com"
SRC_URI=""

LICENSE="metapackage"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86 ~x64-cygwin ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE="+base +terminal extra"

RDEPEND="
		>=sys-libs/cutefish-core-9999
		>=cutefish-base/cutefish-kwin-plugins-9999
		>=cutefish-base/cutefish-icons-9999
		>=cutefish-base/cutefish-filemanager-9999
		>=cutefish-base/cutefish-calculator-9999
		>=cutefish-base/cutefish-launcher-9999
		>=cutefish-base/cutefish-qt-plugins-9999
		>=cutefish-base/cutefish-settings-9999
		>=cutefish-base/cutefish-statusbar-9999
		>=cutefish-base/cutefish-dock-9999
		>=cutefish-base/cutefish-wallpapers-9999
		>=cutefish-base/cutefish-screenlocker-9999
		>=cutefish-base/cutefish-screenshot-9999
		>=cutefish-base/cutefish-videoplayer-9999
		x11-misc/sddm
		terminal?	(	>=cutefish-base/cutefish-terminal-9999	)
		extra?	(	>=cutefish-base/cutefish-texteditor-9999	)
"
