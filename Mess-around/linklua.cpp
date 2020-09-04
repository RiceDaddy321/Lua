#include <iostream>
#include <string>

extern "C"
{
#include "lua535/include/lua.h"
#include "lua535/include/lauxlib.h"
#include "lua535/include/lualib.h"
}

#ifdef _WIN32
#pragma comment(lib, "lua535/liblua53.a")
#endif

bool checkLuaState(lua_State* L, int r);

int lua_HostFunction(lua_State* L)
{

	float a = (float)lua_tonumber(L, 1);
	float b = (float)lua_tonumber(L, 2);
	std::cout << "[C++] HostFunction(" << a << ", " << b << ") called" << std::endl;
	float c = a * b;
	lua_pushnumber(L, c);

	return 1;
}

int main()
{
	struct Player
	{
		std::string Title;
		std::string name;
		std::string Family;
		int Level;
	} player;

	lua_State* L = luaL_newstate();
	luaL_openlibs(L);

	lua_register(L, "HostFunction", lua_HostFunction);

	if (checkLuaState(L, luaL_dofile(L, "script.lua")))
	{
		lua_getglobal(L, "DoAThing");
		if (lua_isfunction(L, -1))
		{
			lua_pushnumber(L, 1.6f);
			lua_pushnumber(L, 4.5f);

			if (checkLuaState(L, lua_pcall(L, 2, 1, 0)))
			{
				std::cout << "[C++] Called in Lua  'DoAThing(1.6f, 4.5f)', got" << (float)lua_tonumber(L, -1) << std::endl;
			}
		}


		/*lua_getglobal(L, "player");
		if (lua_istable(L, -1))
		{
			lua_pushstring(L, "Name");
			lua_gettable(L, -2);
			player.name = lua_tostring(L, -1);
			lua_pop(L, 1);

			lua_pushstring(L, "Title");
			lua_gettable(L, -2);
			player.Title = lua_tostring(L, -1);
			lua_pop(L, 1);

			lua_pushstring(L, "Family");
			lua_gettable(L, -2);
			player.Family = lua_tostring(L, -1);
			lua_pop(L, 1);

			lua_pushstring(L, "Level");
			lua_gettable(L, -2);
			player.Level = lua_tonumber(L, -1);
			lua_pop(L, 1);*/
	}
	//std::cout << player.Title << " " << player.name << " of " << player.Family << "[Level: " << player.Level << "]" << std::endl;
}



bool checkLuaState(lua_State* L, int r)
{
	if (r != LUA_OK)
	{
		std::string errormsg = lua_tostring(L, -1);
		std::cout << "[LUA] " << errormsg << std::endl;
		return false;
	}
	return true;
}