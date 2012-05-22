# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
USE_RUBY="ruby18 ruby19"
RUBY_FAKEGEM_TASK_TEST="spec"
inherit ruby-fakegem
DESCRIPTION="RSpec-syntax-compatible framework for RubySpec"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
ruby_add_bdepend "test? ( dev-ruby/rspec:0 )"
