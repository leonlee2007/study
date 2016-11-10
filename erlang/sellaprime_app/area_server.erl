-module(area_server).
-compile(export_all).
-behaviour(gen_server).

start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

area(Thing) ->
    gen_server:call(?MODULE, {area, Thing}).



init([])->
    process_flag(trap_exit, true),
    io:format("~p starting~n", [?MODULE]),
    {ok, 0}.

handle_call({area, Thing}, _F, N) -> {reply, computer_arer(Thing), N + 1} .       


handle_cast(_Msg, N) ->{noreply, N}.
handle_info(_Info, N) ->{noreply, N}.
terminate(_R, _N) ->
  io:format("~p stoping ~n", [?MODULE]),
  ok.
code_change(_OldVsn, N, _Extra) -> {ok, N}.


computer_arer({square, X}) -> X * X ;
computer_arer({rectongle, X, Y}) -> X * Y.