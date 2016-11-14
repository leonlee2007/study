-module(simple_web_server).
-compile(export_all).
start(Port) ->
	ok = application:start(crypto),
	ok = application:start(ranch),
	ok = application:start(cowboy),
	N_acceptors = 10,
	Dispatch = cowboy_router:compile(
	[
	%% {URIHost, list({URIPath, Handler, Opts})}
	{'_', [{'_', simple_web_server, []}]}
	]),
	cowboy:start_http(my_simple_web_server,
				      N_acceptors,
					  [{port, Port}],
					  [{env, [{dispatch, Dispatch}]}]
					  ).

init({tcp, http}, Req, _Opts_) ->
	{ok, Req, undifined}.

handle(Req,State) ->
	{Path, Req1} = cowboy_req:path(Req),
	Response = read_file(Path),
	io:format("--------->~p~n", [Response]),
	{ok, Req2} = cowboy_req:reply(200, [], Response, Req1),
	{ok, Req2, State}.

read_file(Path) ->
	File = ["."|binary_to_list(Path)],
	case file:read_file(File) of 
		{ok, Bin} -> Bin;
		_ -> ["<pre>cannot read:", File, "</prie>"]
		end.


terminate(_Reason, _Req, _State) ->
	ok.
