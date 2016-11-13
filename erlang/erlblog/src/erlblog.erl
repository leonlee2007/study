-module(erlblog).
 
-export([start/0]).
 
start() ->
    io:format("webserver starting...~n"),
    ok = application:start(crypto),
    ok = application:start(ranch),
    ok = application:start(cowboy),
    ok = application:start(erlblog),
    io:format("webserver finished~n").