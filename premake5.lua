project "CoACD"
	kind "StaticLib"
	language "C++"
	cppdialect "C++20"
	staticruntime "Off"
	warnings "Off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	DefaultTargetParams(true)

	defines {
		"DISABLE_SPDLOG",
		"COACD_NO_PREPROCESS"
	}

	files {
		"src/process.cpp",
		"src/mcts.cpp",
		"src/shape.cpp",
		"src/cost.cpp",
		"src/clip.cpp",
		"src/bvh.cpp",
		"src/model_obj.cpp",
		"src/io.cpp",
		"src/logger.cpp",
		"src/sobol.cpp",
		"public/coacd.cpp",
		"src/btConvexHull/btAlignedAllocator.cpp",
		"src/btConvexHull/btConvexHullComputer.cpp",
		"src/quickhull/QuickHull.cpp",
	}

	includedirs {
		"src/",
		"public/",
		"3rd/cdt/CDT/",
	}

	-- OpenMP is optional — CoACD guards all usage with #ifdef _OPENMP.
	-- Add '-fopenmp' to buildoptions if libomp-dev is installed and you want
	-- parallel decomposition.  The corresponding linkoption in Dependencies.lua
	-- must also be kept in sync.