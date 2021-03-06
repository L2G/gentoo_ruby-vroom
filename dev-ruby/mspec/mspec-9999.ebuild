# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# To bump to a specific Git commit:
#
# 1) Check out the commit to use.
# 2) Run "git describe".
# 3) Read the returned string like this: "v<version>-<patchlevel>-g<commit>".
# 4) Copy this ebuild to "mspec-<version>_p<patchlevel>.ebuild".
# 5) Edit the new ebuild to set MY_GIT_COMMIT to <commit>.

EAPI=4
EGIT_REPO_URI="https://github.com/rubyspec/mspec.git"
MY_GIT_COMMIT=""
inherit eutils git-2 versionator

if [[ "$(get_major_version)" != "9999" ]]; then
	if [[ "${MY_GIT_COMMIT}" == "" ]]; then
		EGIT_COMMIT="v${PV}"
	else
		DEPEND="${DEPEND} >=dev-vcs/git-1.7.6"
		EGIT_COMMIT="v${PV/_p/-}-g${MY_GIT_COMMIT}"
	fi
fi

RESTRICT="primaryuri"
DESCRIPTION="RSpec-syntax compatible framework for RubySpecs"
LICENSE="MIT BSD"
SLOT="0"
KEYWORDS=""
IUSE=""
RDEPEND="${RDEPEND} dev-ruby/mspec"

src_unpack() {
	git-2_src_unpack
	if [[ "${MY_GIT_COMMIT}" != "" ]]; then
		pushd ${S}
		GIT_DESCRIBE=$(git describe)
		[[ ${EGIT_COMMIT} == ${GIT_DESCRIBE} ]] || die \
			"Tried to check out ${EGIT_COMMIT} but got ${GIT_DESCRIBE}"
		popd
	fi
}
