# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git-2

DESCRIPTION=""
HOMEPAGE=""
SRC_URI=""

LICENSE="BeerBSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="net-libs/gloox
		dev-db/mongodb
		>=dev-lang/lua-5.1.0
		dev-libs/openssl"

RDEPEND="${DEPEND}"

EGIT_REPO_URI="https://github.com/mueller-wulff/zabbix_xmpp.git"

src_compile() {
	make release || die "Something went terribly wrong..."
}

src_install() {
    dodir /usr/bin/
	cp "${PORTAGE_BUILDDIR}/work/zabbix_bot-0.01/bin/Release/zabbix_xmpp" \
	"${D}/usr/bin/" || die
	
	dodir /etc/zabbix_bot
	cp "${PORTAGE_BUILDDIR}/work/zabbix_bot-0.01/config/bot.lua" \
	"${D}/etc/zabbix_bot" || die

	doinitd "${FILESDIR}"/init.d/zabbix_bot
}
