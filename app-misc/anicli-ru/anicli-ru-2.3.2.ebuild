# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

SRC_TAG="v${PV}"

DESCRIPTION="A cli to search and watch anime in russian"
HOMEPAGE="https://github.com/OMRIFIJI/anicli-ru"
SRC_URI="
https://github.com/OMRIFIJI/anicli-ru/archive/refs/tags/${SRC_TAG}.tar.gz -> ${P}.tar.gz
https://github.com/OMRIFIJI/anicli-ru/releases/download/${SRC_TAG}/anicli-ru-deps.tar.xz -> ${P}-deps.tar.xz
"

LICENSE="GPL-3
	MIT
	BSD-3-Clause
"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

BDEPEND=">=dev-lang/go-1.23.2"
RDEPEND="media-video/mpv
	media-video/ffmpeg[libxml2]"

src_unpack() {
	go-module_src_unpack
}

src_compile() {
    ego build -o "${PN}" ./cmd/unix/main.go
}

src_install() {
    dobin "${PN}"
}
