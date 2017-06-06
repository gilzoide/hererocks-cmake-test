project(teste)
cmake_minimum_required(VERSION 2.6)

find_package(Lua QUIET)
if(NOT Lua_FOUND)
	message(STATUS "Couldn't find systemwide Lua installation, using Luarocks defined variables")
	set(LUA_LIBRARIES ${LUALIB})
	set(LUA_INCLUDE_DIR ${LUA_INCDIR})
endif()

# e compila normal
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
