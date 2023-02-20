# Redistribution and use is allowed under the MIT license.
# Copyright (c) 2023 Georgy Firsov (gfirsov007 at gmail.com). All rights reserved.

#
# FindCSPDK
# ---------
#
# Simple CMake module, that discovers a Cryptographic Service Provider Development Kit
#

#
# Firstly try to find CSP Development Kit root
#

file(GLOB CSPDK_ROOT
	"C:/Program Files*/Windows Kits/*/Cryptographic Provider Development Kit"
)

#
# Include directory
#

set(CSPDK_INCLUDE_DIRS			${CSPDK_ROOT}/Include)

#
# Library directories
#

set(CSPDK_LIBRARY_DIRS_X86		${CSPDK_ROOT}/Lib/x86)
set(CSPDK_LIBRARY_DIRS_X64		${CSPDK_ROOT}/Lib/x64)

if (CMAKE_SIZEOF_VOID_P EQUAL 8)
	set(CSPDK_LIBRARY_DIRS		${CSPDK_LIBRARY_DIRS_X64})
else (CMAKE_SIZEOF_VOID_P EQUAL 8)
	set(CSPDK_LIBRARY_DIRS		${CSPDK_LIBRARY_DIRS_X86})
endif (CMAKE_SIZEOF_VOID_P EQUAL 8)

#
# Compose link libraries from components
#

set(CSPDK_INTERNAL_ALL_COMPONENTS bcrypt_provider ncrypt_provider cng_provider)

foreach(comp ${CSPDK_FIND_COMPONENTS})

	if (";${CSPDK_INTERNAL_ALL_COMPONENTS};" MATCHES ";${comp};")
		set(CSPDK_LIBRARIES ${CSPDK_LIBRARIES} ${comp})
	else ()
		message(FATAL_ERROR "[CSPDK]: Invalid component requested: ${comp}")
	endif ()

endforeach()

if (NOT DEFINED CSPDK_LIBRARIES OR
	CSPDK_LIBRARIES STREQUAL "")

	#
	# No component is requested, so let's include all
	#

	set(CSPDK_LIBRARIES ${CSPDK_INTERNAL_ALL_COMPONENTS})

endif ()

unset(CSPDK_INTERNAL_ALL_COMPONENTS)

#
# Now just print variables for debugging purposes
#

message("CSPDK_ROOT: ${CSPDK_ROOT}")
message("CSPDK_INCLUDE_DIRS: ${CSPDK_INCLUDE_DIRS}")
message("CSPDK_LIBRARY_DIRS_X86: ${CSPDK_LIBRARY_DIRS_X86}")
message("CSPDK_LIBRARY_DIRS_X64: ${CSPDK_LIBRARY_DIRS_X64}")
message("CSPDK_LIBRARY_DIRS: ${CSPDK_LIBRARY_DIRS}")
message("CSPDK_LIBRARIES: ${CSPDK_LIBRARIES}")