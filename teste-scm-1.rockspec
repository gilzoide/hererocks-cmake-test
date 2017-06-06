package = 'teste'
version = 'scm-1'

source = {
	url = 'https://github.com/gilzoide/hererocks-cmake-test.git',
}
dependencies = {
	"lua >= 5.1",
}
build = {
	type = "cmake",
	variables = {
		CMAKE_INSTALL_PREFIX = "$(PREFIX)",
		LUADIR = "$(LUADIR)",
		LUA_INCDIR = "$(LUA_INCDIR)",
		LIBDIR = "$(LIBDIR)",
		BINDIR = "$(BINDIR)",
	}
}
