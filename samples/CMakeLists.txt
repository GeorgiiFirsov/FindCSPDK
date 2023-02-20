cmake_minimum_required(VERSION 3.0.0)
project(samples VERSION 0.1.0)

#
# Global config
#
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED True)

#
# Directories
#
set(SAMPLES_ROOT ${CMAKE_CURRENT_LIST_DIR})

#
# Add CMake module
#
list(APPEND CMAKE_MODULE_PATH	${SAMPLES_ROOT}/../cmake)

#
# List of samples
#
add_subdirectory(simple)
