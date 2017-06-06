project(teste)
cmake_minimum_required(VERSION 2.8.8)

# verifica se tá no Travis da vida
if($ENV{CI})
	# Magia pra funfar o Lua do Hererocks
	include(CMakePackageConfigHelpers)
	set(lua_config_path "${CMAKE_CURRENT_BINARY_DIR}/LuaConfig.cmake")
	configure_package_config_file(
		"Config.cmake.in"
		"${lua_config_path}"
		INSTALL_DESTINATION "lib"
	)
	set($ENV{Lua_DIR} ${lua_config_path})
	find_package(Lua CONFIG REQUIRED)
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
