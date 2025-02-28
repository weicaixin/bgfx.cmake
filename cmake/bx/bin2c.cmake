# bgfx.cmake - bgfx building in cmake
# Written in 2017 by Joshua Brookover <joshua.al.brookover@gmail.com>
#
# To the extent possible under law, the author(s) have dedicated all copyright
# and related and neighboring rights to this software to the public domain
# worldwide. This software is distributed without any warranty.
#
# You should have received a copy of the CC0 Public Domain Dedication along with
# this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

add_executable(bin2c)

# Grab the bin2c source files
file(GLOB_RECURSE BIN2C_SOURCES #
	 ${BX_DIR}/tools/bin2c/*.cpp #
	 ${BX_DIR}/tools/bin2c/*.h #
)

target_sources(bin2c PRIVATE ${BIN2C_SOURCES})
target_link_libraries(bin2c PRIVATE bx)
set_target_properties(
	bin2c PROPERTIES FOLDER "bgfx/tools" #
					 OUTPUT_NAME ${BGFX_TOOLS_PREFIX}bin2c #
)

if(BGFX_BUILD_TOOLS_BIN2C AND BGFX_CUSTOM_TARGETS)
	add_dependencies(tools bin2c)
endif()

if(ANDROID)
	target_link_libraries(bin2c PRIVATE log)
elseif(IOS)
	set_target_properties(bin2c PROPERTIES MACOSX_BUNDLE ON MACOSX_BUNDLE_GUI_IDENTIFIER bin2c)
endif()
