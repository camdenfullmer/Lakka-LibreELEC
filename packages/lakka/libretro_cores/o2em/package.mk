PKG_NAME="o2em"
PKG_VERSION="d4e69f6"
PKG_LICENSE="Artistic License"
PKG_SITE="https://github.com/libretro/libretro-o2em"
PKG_URL="${PKG_SITE}.git"
PKG_DEPENDS_TARGET="toolchain"
PKG_SHORTDESC="Port of O2EM to the libretro API, an Odyssey 2 / VideoPac emulator."
PKG_TOOLCHAIN="make"

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/libretro
    cp -v o2em_libretro.so ${INSTALL}/usr/lib/libretro/
}
