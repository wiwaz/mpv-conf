@echo OFF
set scripts_dir=.\scripts\
set shaders_dir=.\shaders\

set scripts=(^
	"https://raw.githubusercontent.com/mpv-player/mpv/master/TOOLS/lua/autocrop.lua"^
	"https://raw.githubusercontent.com/mpv-player/mpv/master/TOOLS/lua/autoload.lua"^
	"https://raw.githubusercontent.com/po5/trackselect/master/trackselect.lua"^
	"https://raw.githubusercontent.com/Dudemanguy/mpv-manga-reader/master/manga-reader.lua"^
)

set shaders=(^
	"https://raw.githubusercontent.com/bjin/mpv-prescalers/master/compute/nnedi3-nns128-win8x4.hook"^
	"https://raw.githubusercontent.com/Artoriuz/ArtCNN/main/ArtCNN_C4F32.glsl"^
)

if not exist %scripts_dir% mkdir %scripts_dir%
if not exist %shaders_dir% mkdir %shaders_dir%

for %%a in %scripts% do (
	powershell -Command "Invoke-WebRequest -Uri %%a -OutFile "%scripts_dir%%%~nxa""
)
for %%a in %shaders% do (
	powershell -Command "Invoke-WebRequest -Uri %%a -OutFile "%shaders_dir%%%~nxa""
)

echo Updating Finished
timeout 3