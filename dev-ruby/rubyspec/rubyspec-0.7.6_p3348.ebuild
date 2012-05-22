# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# To bump to a specific Git commit:
#
# 1) Check out the commit to use.
# 2) Run "git describe".
# 3) Read the returned string like this: "v<version>-<patchlevel>-g<commit>".
# 4) Copy this ebuild to "rubyspec-<version>_p<patchlevel>.ebuild".
# 5) Edit the new ebuild to set MY_GIT_COMMIT to <commit>.

EAPI=4
EGIT_REPO_URI="https://github.com/rubyspec/rubyspec.git"
MY_GIT_COMMIT="0233f4f"
inherit eutils git-2 versionator

if [[ "$(get_major_version)" != "9999" && "${MY_GIT_COMMIT}" != "" ]]; then
	GIT_BRANCH="v${PV/_p/-}-g${MY_GIT_COMMIT}"
fi

RESTRICT="primaryuri"
DESCRIPTION="Executable specification for the Ruby programming language"
LICENSE="MIT BSD"
SLOT="0"
KEYWORDS=""
IUSE=""
RDEPEND="${RDEPEND} dev-ruby/mspec"

src_unpack() {
	git-2_src_unpack
	if [[ "${GIT_BRANCH}" != "" ]]; then
		pushd ${S}
		GIT_DESCRIBE=$(git describe)
		[[ ${GIT_BRANCH} == ${GIT_DESCRIBE} ]] || die \
			"Tried to check out ${GIT_BRANCH} but got ${GIT_DESCRIBE}"
		popd
	fi
}

src_install() {
	dodoc CHANGES.before-2008-05-10 README TODO
	insinto /usr/src/${PN}
	doins *.mspec *.rb
	doins -r command_line core fixtures language library optional shared tags
}
