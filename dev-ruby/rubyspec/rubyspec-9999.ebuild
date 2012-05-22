# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
USE_RUBY="ruby18 ruby19"
EGIT_REPO_URI="git://github.com/rubyspec/rubyspec.git \
               https://github.com/rubyspec/rubyspec.git"
RESTRICT="primaryuri test"
inherit eutils git-2 ruby-ng
DESCRIPTION="Executable specification for the Ruby programming language"
LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""
ruby_add_rdepend "dev-ruby/mspec"
