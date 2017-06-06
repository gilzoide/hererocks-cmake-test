#include "lua.h"

int luaopen_teste(lua_State *L) {
	lua_pushinteger(L, 5);
	return 1;
}
