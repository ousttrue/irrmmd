-- A solution contains projects, and defines the available configurations
solution "irrmmd"
configurations { "Debug", "Release" }

IRR_DIR="../../irrlicht-1.7.3"
BULLET_DIR="../../../_bullet/bullet-2.79"

------------------------------------------------------------------------------
-- sample
------------------------------------------------------------------------------
-- A project defines one build target
project "sample"
--kind "WindowedApp"
kind "ConsoleApp"
--kind "SharedLib"
--kind "StaticLib"
language "C++"
files { "*.h", "*.cpp" }
flags {
	"NoIncrementalLink",
}
buildoptions {
	"/wd4996",
}
includedirs {
	"../irrlicht-1.7.3/include",
    "../../_bullet/bullet-2.79/src",
    "irrmmd",
    "libpolymesh",
    "rigid",
}
defines {
	"NOMINMAX",
}
linkoptions {
}
libdirs {
    "../irrlicht-1.7.3/lib/Win32-visualstudio",
    "../../_bullet/bullet-2.79/lib",
}
links {
    "Irrlicht",
	"vfw32", "glew32",
	"irrmmd", "libpolymesh",
}

configuration "Debug"
do
	defines { "DEBUG" }
	flags { "Symbols" }
	targetdir "debug"
    links {
        "BulletCollision_debug", 
        "BulletDynamics_debug", 
        "LinearMath_debug",
    }
    linkoptions {
        "/NODEFAULTLIB:LIBCMTD",
    }
end

configuration "Release"
do
	defines { "NDEBUG" }
	flags { "Optimize" }
	targetdir "release"
    links {
        "BulletCollision", 
        "BulletDynamics", 
        "LinearMath",
    }
    linkoptions {
        "/NODEFAULTLIB:LIBCMT",
    }
end

configuration {}

------------------------------------------------------------------------------
-- dependency
------------------------------------------------------------------------------
include "irrmmd"
include "libpolymesh"
include "rigid"

