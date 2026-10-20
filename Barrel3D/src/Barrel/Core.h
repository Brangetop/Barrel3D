#pragma once

#ifdef BR_PLATFORM_WINDOWS
	#ifdef BR_BUILD_DLL
		#define BARREL_API __declspec(dllexport)
	#else
		#define BARREL_API __declspec(dllimport)
	#endif // BR_BUILD_DLL
#else
	#error Barrel only supports Win64
#endif