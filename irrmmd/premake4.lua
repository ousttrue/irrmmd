-- A project defines one build target
project "irrmmd"
--kind "WindowedApp"
--kind "ConsoleApp"
--kind "SharedLib"
kind "StaticLib"
language "C++"
files { "*.h", "*.cpp" }
flags {
	"Unicode",
}
buildoptions {
	"/wd4996",
}
includedirs {
	IRR_DIR.."/include",
    BULLET_DIR.."/src",
    "../libpolymesh",
    "../rigid",
}
defines {
	"NOMINMAX",
}
linkoptions {
}
libdirs {
}
links {
}

configuration "Debug"
do
	defines { "DEBUG" }
	flags { "Symbols" }
	targetdir "debug"
end

configuration "Release"
do
	defines { "NDEBUG" }
	flags { "Optimize" }
	targetdir "release"
end

