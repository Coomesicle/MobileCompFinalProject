

set(US_ShellService_LIBRARIES usShellService)
set(US_ShellService_RUNTIME_LIBRARY_DIRS "/home/pi/Documents/GarboTron/AtlasThingMiddleware_RPI-master/lib/bin")

if(NOT TARGET usShellService)
  include("${CMAKE_CURRENT_LIST_DIR}/usShellServiceTargets.cmake")
endif()