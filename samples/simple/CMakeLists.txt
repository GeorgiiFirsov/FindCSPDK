#
# Find Cryptographic Service Provider Development Kit
# The only component needed is bcrypt_provider
#
find_package(CSPDK COMPONENTS bcrypt_provider REQUIRED)

#
# Just a simple target from one cpp file
#
add_executable(simple simple.cpp)

#
# Add include directories for the target
#
target_include_directories(simple PRIVATE ${CSPDK_INCLUDE_DIRS})

#
# Introduce a folder with libraries
#
target_link_directories(simple PRIVATE ${CSPDK_LIBRARY_DIRS})

#
# Link with necessary libraries
#
target_link_libraries(simple PRIVATE ${CSPDK_LIBRARIES})
