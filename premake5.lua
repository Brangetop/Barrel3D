workspace "Barrel3D"
	architecture "x64"
	startproject "Sandbox"

	configurations
	{
		"Debug",
		"Release",
		"Distribution"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Barrel3D"
	location "Barrel3D"
	kind "SharedLib"
	language "C++"
	cppdialect "C++17"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"Barrel3D/vendor/spdlog/include"
	}

	filter "system:windows"
		staticruntime "On"
		systemversion "10.0.26100.0"
		buildoptions "/utf-8"

		defines
		{
			"BR_PLATFORM_WINDOWS",
			"BR_BUILD_DLL"
		}


	filter "configurations:Debug"
		defines "BR_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "BR_RELEASE"
		optimize "On"

	filter "configurations:Distribution"
		defines "BR_DIST"
		optimize "On"


project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++17"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"Barrel3D/vendor/spdlog/include",
		"Barrel3D/src"
	}

	links
	{
		"Barrel3D"
	}

	filter "system:windows"
		staticruntime "On"
		systemversion "10.0.26100.0"
		buildoptions "/utf-8"

		defines
		{
			"BR_PLATFORM_WINDOWS"
		}

	filter "configurations:Debug"
		defines "BR_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "BR_RELEASE"
		optimize "On"

	filter "configurations:Distribution"
		defines "BR_DIST"
		optimize "On"
