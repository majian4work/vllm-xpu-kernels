find_program(CCACHE_PROGRAM ccache)
find_program(DISTCC_PROGRAM distcc)

set(COMPILER_LAUNCHERS "")

if(CCACHE_PROGRAM)
    message(STATUS "Found ccache: ${CCACHE_PROGRAM}")
    list(APPEND COMPILER_LAUNCHERS "${CCACHE_PROGRAM}")
endif()

if(DISTCC_PROGRAM)
    message(STATUS "Found distcc: ${DISTCC_PROGRAM}")
    list(APPEND COMPILER_LAUNCHERS "${DISTCC_PROGRAM}")
endif()

if(COMPILER_LAUNCHERS)
    message(STATUS "Using compiler launchers: ${COMPILER_LAUNCHERS}")
    set(CMAKE_C_COMPILER_LAUNCHER ${COMPILER_LAUNCHERS})
    set(CMAKE_CXX_COMPILER_LAUNCHER ${COMPILER_LAUNCHERS})
else()
    message(WARNING "Neither ccache nor distcc found, using default compiler settings")
endif()