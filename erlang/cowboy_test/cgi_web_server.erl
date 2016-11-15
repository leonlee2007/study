
-module(cgi_web_server).
-compile(export_all).
start(Port) ->
	ok = application:start(crypto),
	ok = application:start(ranch),
	ok = application:start(cowboy),
	N_acceptors = 10,
	Dispatch = cowboy_router:compile(
	[
	%% {URIHost, list({URIPath, Handler, Opts})}
	{'_', [{'_', cgi_web_server, []}]}
	]),
	cowboy:start_http(http,
				      N_acceptors,
					  [{port, Port}],
					  [{env, [{dispatch, Dispatch}]}]
					  ).

init({tcp, http}, Req, _Opts_) ->
	{ok, Req, undifined}.

handle(Req,State) ->
	{Path, Req1} = cowboy_req:path(Req),
	handle1(Path, Req1, State).

handle1(<<"/cgi">>, Req, State) ->
	{Args, Req1} = cowboy_req:qs_vals(Req),
	{ok, Bin, Req2} = cowboy_req:body(Req1),
	Val = mochijson2:decode(Bin),
	Response = call(Args, Val),
	Json = mochijson2:encode(Response),
	{ok, Req3} = cowboy_req:reply(200, [], Json, Req2),
	io:format("==========>>>>>~p =====~p~n", [Json, Req2]),
	{ok, Req3, State};

handle1(Path, Req, State) ->
	Response = read_file(Path),
	{ok, Req1} = cowboy_req:reply(200, [], Response, Req),
	{ok, Req1, State}.

read_file(Path) ->
	File = ["."|binary_to_list(Path)],
	io:format("11=========>~p~n", [binary_to_list(Path)]),
	case file:read_file(File) of 
		{ok, Bin} -> 
		io:format("22=========>~p~n", [binary_to_list(Bin)]),
		Bin;
		_ -> ["<pre>cannot read:", File, "</prie>"]
	end.
call([{<<"mod">>, MB}, {<<"func">>, FB}],X) ->
	Mod = list_to_atom(binary_to_list(MB)),
	Func = list_to_atom(binary_to_list(FB)),
	apply(Mod, Func, [X]);

call(C,X) ->
	io:format("callaaa=========>~p =====~p~n", [C, X]).


start_from_shell([PortAsAtom]) ->
	PortAsInt = list_to_integer(atom_to_list(PortAsAtom)),
	start(PortAsInt).







terminate(_Reason, _Req, _State) ->
	ok.
