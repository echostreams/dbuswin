# CMakeList.txt : CMake project for dbuswin, include source and define
# project specific logic here.
#
cmake_minimum_required (VERSION 3.8)

message(STATUS "CMAKE_INSTALL_PREFIX: ${CMAKE_INSTALL_PREFIX}")

include_directories(
	"${CMAKE_INSTALL_PREFIX}/include/dbus-1.0"
	"${CMAKE_INSTALL_PREFIX}/lib/dbus-1.0/include"
)

# Add source to this project's executable.
add_executable (dbuswin "dbuswin.c" "dbuswin.h")
target_link_libraries(dbuswin "${CMAKE_INSTALL_PREFIX}/lib/dbus-1d.lib")

add_custom_target(dbusdll
	COMMAND ${CMAKE_COMMAND} -E copy "$<TARGET_FILE:dbus-1>" "${CMAKE_CURRENT_BINARY_DIR}"
)
add_dependencies(dbuswin dbusdll)

# TODO: Add tests and install targets if needed.
