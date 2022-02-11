# CMakeList.txt : Top-level CMake project file, do global configuration
# and include sub-projects here.
#
cmake_minimum_required (VERSION 3.8)

project ("dbuswin")

if(WIN32)
	add_subdirectory("expat-win32bin-2.4.4/Source")

	set(EXPAT_INCLUDE_DIR "${CMAKE_SOURCE_DIR}/expat-win32bin-2.4.4/Source/lib")
	set(EXPAT_LIBRARY "${CMAKE_BINARY_DIR}/expat-win32bin-2.4.4/Source")
	set(EXPAT_LIBRARIES "${CMAKE_BINARY_DIR}/expat-win32bin-2.4.4/Source/libexpatd")
	set(EXPAT_FOUND TRUE)
endif(WIN32)

# where to look first for cmake modules, before ${CMAKE_ROOT}/Modules/ is checked
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/dbus-dbus-1.12/cmake/modules")
add_subdirectory("dbus-dbus-1.12/cmake")

if(WIN32)
	add_custom_target(expatdll
		COMMAND ${CMAKE_COMMAND} -E copy "$<TARGET_FILE:expat>" "${CMAKE_CURRENT_BINARY_DIR}/bin"
	)
	add_dependencies(dbus-daemon expatdll)
	add_definitions(-DDBUS_INSTALL_SYSTEM_LIBS=1)
endif(WIN32)

# Include sub-projects.
add_subdirectory ("dbuswin")

