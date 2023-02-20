# FindCSPDK
CMake module, that discovers Cryptographic Service Provider Development Kit by Microsoft.

## Introduction

This simple module helps to find a Cryptographic Service Provider Development Kit (CSP Development Kit)
and makes possible to use it in CMake projects.

Requirements:
- CMake 3.0 or higher

## Usage

Just add FindCSPDK to the module search path as follows:
```cmake
list(APPEND CMAKE_MODULE_PATH "<path_to_FindCSPDK>")
```

And then call `find_package`:
```cmake
find_package(CSPDK)
```

You can specify any of the following components (if none specified, then all of them will be included):
- `bcrypt_provider`
- `ncrypt_provider`
- `cng_provider`

FindCSPDK will search for the installed CSP Development Kit and define the following variables:

- `CSPDK_FOUND` - if false, then CSP Development Kit is absent
- `CSPDK_ROOT` - path to the root folder of CSP Development Kit
- `CSPDK_INCLUDE_DIRS` - CSP Development Kit include directories
- `CSPDK_LIBRARY_DIRS_X86` - CSP Development Kit X86 library directories
- `CSPDK_LIBRARY_DIRS_X64` - CSP Development Kit X86-64 library directories
- `CSPDK_LIBRARY_DIRS` - CSP Development Kit library directories for current platform
- `CSPDK_LIBRARIES` - CSP Development Kit libraries to link with (depends on COMPONENTS)

## Samples

Consider to visit [samples][1] directory.

## License

FindCSPDK is distributed under [MIT][2] license.

[1]: https://github.com/GeorgyFirsov/FindCSPDK/tree/main/samples
[2]: https://github.com/GeorgyFirsov/FindCSPDK/blob/main/LICENSE
