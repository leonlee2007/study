-module(name_server1).
-export([init/0, add/2, find/1, handle/2]).
-import(server3, [rpc/2]).
add(Name, Place) -> rpc(name_server, {add, Name, Place}).
find(Name) -> rpc(name_server, {find, Name}).

%%回调方法
init() -> dict:new().
handle({add, Name, Place}, Dict) ->
  io:format("=======>22:  ~p~n", [Name]),
   {ok, dict:store(Name, Place, Dict)};
handle({find, Name}, Dict)       ->  
  io:format("=======>find:  ~p~n", [Name]),
    {dict:find(Name, Dict), Dict}.        


