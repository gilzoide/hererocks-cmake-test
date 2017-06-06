project(testeHererocksCMake)
cmake_minimum_required(VERSION 2.6)

find_package(Lua REQUIRED)

message(STATUS "${LUA_INCLUDE_DIR} | ${LUA_LIBRARIES}")

add_library(teste SHARED teste.c)
target_include_directories(teste PUBLIC ${LUA_INCLUDE_DIR})
target_link_libraries(teste ${LUA_LIBRARIES})
set_target_properties(teste PROPERTIES PREFIX "")

# Installlllll
if(NOT LIBDIR)
	set(LIBDIR lib/lua/${LUA_VER})
endif()

install(TARGETS teste
	LIBRARY DESTINATION ${LIBDIR})
