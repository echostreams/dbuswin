include(CheckIncludeFile)
include(CheckIncludeFiles)
include(CheckSymbolExists)
include(CheckStructMember)
include(CheckTypeSize)

check_include_file(alloca.h     HAVE_ALLOCA_H)
check_include_file(byteswap.h     HAVE_BYTESWAP_H)
check_include_file(crt/externs.h     HAVE_CRT_EXTERNS_H)
check_include_file(dirent.h     HAVE_DIRENT_H)  # dbus-sysdeps-util.c
check_include_file(dlfcn.h     HAVE_DLFCN_H)
check_include_file(execinfo.h     HAVE_EXECINFO_H)
check_include_file(errno.h     HAVE_ERRNO_H)    # dbus-sysdeps.c
check_include_file(expat.h     HAVE_EXPAT_H)
check_include_file(grp.h        HAVE_GRP_H)     # dbus-sysdeps-util-win.c
check_include_file(inttypes.h     HAVE_INTTYPES_H)   # dbus-pipe.h
check_include_file(io.h         HAVE_IO_H)      # internal
check_include_file(locale.h     HAVE_LOCALE_H)
check_include_file(memory.h     HAVE_MEMORY_H)
check_include_file(signal.h     HAVE_SIGNAL_H)
check_include_file(stdint.h     HAVE_STDINT_H)   # dbus-pipe.h
check_include_file(stdlib.h     HAVE_STDLIB_H)
check_include_file(stdio.h      HAVE_STDIO_H)   # dbus-sysdeps.h
check_include_file(string.h     HAVE_STRING_H)
check_include_file(strings.h     HAVE_STRINGS_H)
check_include_file(syslog.h     HAVE_SYSLOG_H)
check_include_files("stdint.h;sys/types.h;sys/event.h" HAVE_SYS_EVENT_H)
check_include_file(sys/inotify.h     HAVE_SYS_INOTIFY_H)
check_include_file(sys/resource.h     HAVE_SYS_RESOURCE_H)
check_include_file(sys/stat.h     HAVE_SYS_STAT_H)
check_include_file(sys/types.h     HAVE_SYS_TYPES_H)
check_include_file(sys/uio.h     HAVE_SYS_UIO_H)
check_include_file(sys/poll.h   HAVE_POLL)      # dbus-sysdeps.c, dbus-sysdeps-win.c
check_include_file(sys/prctl.h  HAVE_SYS_PRCTL_H)
check_include_file(sys/syslimits.h    HAVE_SYS_SYSLIMITS_H)   # dbus-sysdeps-unix.c
check_include_file(sys/time.h   HAVE_SYS_TIME_H)# dbus-sysdeps-win.c
check_include_file(sys/wait.h   HAVE_SYS_WAIT_H)# dbus-sysdeps-win.c
check_include_file(time.h       HAVE_TIME_H)    # dbus-sysdeps-win.c
check_include_file(ws2tcpip.h   HAVE_WS2TCPIP_H)# dbus-sysdeps-win.c
check_include_file(unistd.h     HAVE_UNISTD_H)  # dbus-sysdeps-util-win.c

check_symbol_exists(backtrace    "execinfo.h"       HAVE_BACKTRACE)          #  dbus-sysdeps.c, dbus-sysdeps-win.c
check_symbol_exists(getgrouplist "grp.h"            HAVE_GETGROUPLIST)       #  dbus-sysdeps.c
check_symbol_exists(getpeerucred "ucred.h"          HAVE_GETPEERUCRED)       #  dbus-sysdeps.c, dbus-sysdeps-win.c
check_symbol_exists(nanosleep    "time.h"           HAVE_NANOSLEEP)          #  dbus-sysdeps.c
check_symbol_exists(getpwnam_r   "errno.h;pwd.h"    HAVE_POSIX_GETPWNAM_R)   #  dbus-sysdeps-util-unix.c
check_symbol_exists(setenv       "stdlib.h"         HAVE_SETENV)             #  dbus-sysdeps.c
check_symbol_exists(unsetenv     "stdlib.h"         HAVE_UNSETENV)           #  dbus-sysdeps.c
check_symbol_exists(clearenv     "stdlib.h"         HAVE_CLEARENV)           #  dbus-sysdeps.c
check_symbol_exists(writev       "sys/uio.h"        HAVE_WRITEV)             #  dbus-sysdeps.c, dbus-sysdeps-win.c
check_symbol_exists(setrlimit    "sys/resource.h"   HAVE_SETRLIMIT)          #  dbus-sysdeps.c, dbus-sysdeps-win.c, test/test-segfault.c
check_symbol_exists(socketpair   "sys/socket.h"     HAVE_SOCKETPAIR)         #  dbus-sysdeps.c
check_symbol_exists(setlocale    "locale.h"         HAVE_SETLOCALE)          #  dbus-test-main.c
check_symbol_exists(localeconv   "locale.h"         HAVE_LOCALECONV)         #  dbus-sysdeps.c
check_symbol_exists(strtoll      "stdlib.h"         HAVE_STRTOLL)            #  dbus-send.c
check_symbol_exists(strtoull     "stdlib.h"         HAVE_STRTOULL)           #  dbus-send.c
set(CMAKE_REQUIRED_DEFINITIONS -D_GNU_SOURCE)
check_symbol_exists(pipe2        "fcntl.h;unistd.h"         HAVE_PIPE2)
check_symbol_exists(accept4      "sys/socket.h"             HAVE_ACCEPT4)
check_symbol_exists(dirfd        "dirent.h"                 HAVE_DIRFD)
check_symbol_exists(inotify_init1 "sys/inotify.h"           HAVE_INOTIFY_INIT1)
check_symbol_exists(SCM_RIGHTS    "sys/types.h;sys/socket.h;sys/un.h" HAVE_UNIX_FD_PASSING)
check_symbol_exists(prctl        "sys/prctl.h"              HAVE_PRCTL)
check_symbol_exists(raise        "signal.h"                 HAVE_RAISE)
check_symbol_exists(getrlimit    "sys/resource.h;sys/time.h" HAVE_GETRLIMIT)
check_symbol_exists(prlimit      "sys/resource.h;sys/time.h" HAVE_PRLIMIT)
check_symbol_exists(setrlimit    "sys/resource.h;sys/time.h" HAVE_SETRLIMIT)

check_struct_member(cmsgcred cmcred_pid "sys/types.h sys/socket.h" HAVE_CMSGCRED)   #  dbus-sysdeps.c

# missing:
# DBUS_HAVE_GCC33_GCOV

check_type_size("short"     SIZEOF_SHORT)
check_type_size("int"       SIZEOF_INT)
check_type_size("long"      SIZEOF_LONG)
check_type_size("long long" SIZEOF_LONG_LONG)
check_type_size("__int64"   SIZEOF___INT64)
set(CMAKE_EXTRA_INCLUDE_FILES "sys/socket.h")
check_type_size("socklen_t" SOCKLEN_T)          #  dbus-sysdeps-unix.c
set(CMAKE_EXTRA_INCLUDE_FILES)

# DBUS_INT64_TYPE
if(SIZEOF_INT EQUAL 8)
    set (DBUS_INT64_TYPE "int")
    set (DBUS_INT64_CONSTANT  "(val)")
    set (DBUS_UINT64_CONSTANT "(val##U)")
elseif(SIZEOF_LONG EQUAL 8)
    set (DBUS_INT64_TYPE "long")
    set (DBUS_INT64_CONSTANT  "(val##L)")
    set (DBUS_UINT64_CONSTANT "(val##UL)")
elseif(SIZEOF_LONG_LONG EQUAL 8)
    set (DBUS_INT64_TYPE "long long")
    set (DBUS_INT64_CONSTANT  "(val##LL)")
    set (DBUS_UINT64_CONSTANT "(val##ULL)")
elseif(SIZEOF___INT64 EQUAL 8)
    set (DBUS_INT64_TYPE "__int64")
    set (DBUS_INT64_CONSTANT  "(val##i64)")
    set (DBUS_UINT64_CONSTANT "(val##ui64)")
else(SIZEOF_INT EQUAL 8)
    message (FATAL_ERROR "Could not find a 64-bit integer type")
endif(SIZEOF_INT EQUAL 8)

# DBUS_INT32_TYPE
if(SIZEOF_INT EQUAL 4)
    set (DBUS_INT32_TYPE "int")
elseif(SIZEOF_LONG EQUAL 4)
    set (DBUS_INT32_TYPE "long")
elseif(SIZEOF_LONG_LONG EQUAL 4)
    set (DBUS_INT32_TYPE "long long")
endif(SIZEOF_INT EQUAL 4)

# DBUS_INT16_TYPE
if(SIZEOF_INT EQUAL 2)
    set (DBUS_INT16_TYPE "int")
elseif(SIZEOF_SHORT EQUAL 2)
    set (DBUS_INT16_TYPE "short")
endif(SIZEOF_INT EQUAL 2)

find_program(DOXYGEN doxygen)
find_program(XMLTO xmlto)

if(MSVC)
   SET(DBUS_VA_COPY_FUNC "_DBUS_VA_COPY_ASSIGN")
else(MSVC)
write_file("${CMAKE_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/CMakeTmp/cmake_try_compile.c" "#include <stdarg.h>
	#include <stdlib.h>
        static void f (int i, ...) {
	va_list args1, args2;
	va_start (args1, i);
	va_copy (args2, args1);
	if (va_arg (args2, int) != 42 || va_arg (args1, int) != 42)
	  exit (1);
	va_end (args1); va_end (args2);
	}
	int main() {
	  f (0, 42);
	  return 0;
	}
")
try_compile(DBUS_HAVE_VA_COPY
            ${CMAKE_BINARY_DIR}
            ${CMAKE_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/CMakeTmp/cmake_try_compile.c)

if(DBUS_HAVE_VA_COPY)
  SET(DBUS_VA_COPY_FUNC va_copy CACHE STRING "va_copy function")
else(DBUS_HAVE_VA_COPY)
  write_file("${CMAKE_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/CMakeTmp/cmake_try_compile.c" "#include <stdarg.h>
          #include <stdlib.h>
	  static void f (int i, ...) {
	  va_list args1, args2;
	  va_start (args1, i);
	  __va_copy (args2, args1);
	  if (va_arg (args2, int) != 42 || va_arg (args1, int) != 42)
	    exit (1);
	  va_end (args1); va_end (args2);
	  }
	  int main() {
	    f (0, 42);
	    return 0;
	  }
  ")
  try_compile(DBUS_HAVE___VA_COPY
              ${CMAKE_BINARY_DIR}
              ${CMAKE_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/CMakeTmp/cmake_try_compile.c)
  if(DBUS_HAVE___VA_COPY)
    SET(DBUS_VA_COPY_FUNC __va_copy CACHE STRING "va_copy function")
  else(DBUS_HAVE___VA_COPY)
    SET(DBUS_VA_COPY_AS_ARRAY "1" CACHE STRING "'va_lists' cannot be copies as values")
  endif(DBUS_HAVE___VA_COPY)
endif(DBUS_HAVE_VA_COPY)
endif(MSVC) # _not_ MSVC
