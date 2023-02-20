//
// Windows headers
// 

#include <Windows.h>


//
// CSPDK headers
// 

#include "bcrypt_provider.h"
#include "bcrypt.h"


PWSTR kAlgorithms[1] = {
    const_cast<PWSTR>(L"SOME-CRYPTO-ALGORITHM")
};


CRYPT_INTERFACE_REG kInterfaceRegistration = {
    BCRYPT_CIPHER_INTERFACE,
    CRYPT_LOCAL,
    1,
    kAlgorithms
};


PCRYPT_INTERFACE_REG kInterfaces[1] = {
    &kInterfaceRegistration
};


CRYPT_IMAGE_REG kUmProviderImage = {
    const_cast<PWSTR>(L"sample_provider.dll"),
    1,
    kInterfaces
};


CRYPT_PROVIDER_REG kProviderReg = {
    0,
    nullptr,
    &kUmProviderImage,
    nullptr
};


int wmain()
{
    //
    // Just an example of provider's registration.
    // It demonstrates, that include directories, library
    // directories and link libraries are set correctly.
    // 

	NTSTATUS status = BCryptRegisterProvider(
		L"Sample bcrypt provider",
		0,
		&kProviderReg);

    return static_cast<int>(status);
}