-module(echo).
-compile(export_all).

me(X) ->
	io:format("echo:~p~n", [X]),
	X.
