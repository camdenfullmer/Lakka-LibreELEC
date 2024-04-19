PKG_NAME="mgba"
PKG_VERSION="5d92c3ca0a2b58db253b4296cdcd220335316040"
PKG_LICENSE="MPLv2.0"
PKG_SITE="https://github.com/mgba-emu/mgba"
PKG_URL="${PKG_SITE}.git"
PKG_DEPENDS_TARGET="toolchain libzip libpng zlib"
PKG_LONGDESC="mGBA Game Boy Advance Emulator"
PKG_TOOLCHAIN="cmake"

PKG_CMAKE_OPTS_TARGET="-DCMAKE_BUILD_TYPE=Release \
                       -DBUILD_LIBRETRO=ON \
                       -DSKIP_LIBRARY=ON \
                       -DBUILD_QT=OFF \
                       -DBUILD_SDL=OFF \
                       -DUSE_DISCORD_RPC=OFF \
                       -DUSE_GDB_STUB=OFF \
                       -DUSE_DEBUGGERS=OFF \
                       -DUSE_EDITLINE=OFF \
                       -DUSE_EPOXY=OFF"

if [ "${OPENGL_SUPPORT}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" ${OPENGL}"
  PKG_CMAKE_OPTS_TARGET+=" -DBUILD_GL=ON"
elif [ "${OPENGL_SUPPORT}" = "no" ]; then
  PKG_CMAKE_OPTS_TARGET+=" -DBUILD_GL=OFF"
fi

if [ "${OPENGLES_SUPPORT}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" ${OPENGLES}"
  PKG_CMAKE_OPTS_TARGET+=" -DUSING_GLES2=ON"
fi


makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/libretro
    cp -v mgba_libretro.so ${INSTALL}/usr/lib/libretro/
}
