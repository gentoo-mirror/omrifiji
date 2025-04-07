# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

SRC_TAG="v${PV}"

DESCRIPTION="XRay VPN client implementation in Go."
HOMEPAGE="https://github.com/goxray/tun"
SRC_URI="
https://github.com/goxray/tun/archive/refs/tags/${SRC_TAG}.tar.gz -> ${P}.tar.gz
https://github.com/OMRIFIJI/goxray-cli-dep-tarballs/releases/download/${SRC_TAG}/${PN}-deps.tar.xz -> ${P}-deps.tar.xz
"

LICENSE="GPL-3
	MPL-2.0
	BSD-2+
	Apache-2.0
	ISC
	MIT
"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

BDEPEND=">=dev-lang/go-1.23.3"

S="${WORKDIR}/tun-${PV}"

src_unpack() {
	go-module_src_unpack
}

src_compile() {
    ego build -o "${PN}" .
}

src_install() {
    dobin "${PN}"
}
