EAPI=5

inherit eutils multilib

DESCRIPTION="Standard ML compiler with practical extensions"
HOMEPAGE="http://www.pllab.riec.tohoku.ac.jp/smlsharp/"
SRC_URI="http://www.pllab.riec.tohoku.ac.jp/smlsharp/download/${P}.tar.gz"

RESTRICT="nomirror"

LICENSE="smlsharp"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=sys-devel/llvm-3.4:0/3.4[abi_x86_32]
	dev-libs/gmp[abi_x86_32]"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}/${P}-llvm-config.patch"
}

src_configure() {
	use amd64 && multilib_toolchain_setup x86
	econf
}
