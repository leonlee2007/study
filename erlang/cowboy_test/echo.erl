-module(echo).
-compile([me/1]).

me(X) ->
	io:format("echo:~p~n", [X]),
	X.
