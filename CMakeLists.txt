project(teste)
cmake_minimum_required(VERSION 2.8.8)

# verifica se tá no Travis da vida
if($ENV{CI})
	set(LUA_LIBRARIES ${LUALIB})
	set(LUA_INCLUDE_DIR ${LUA_INCDIR})
else()
	find_package(Lua REQUIRED)
endif()

message(STATUS "${LUA_INCLUDE_DIR} | ${LUA_LIBRARIES}")

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
