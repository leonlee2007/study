-module(prime_server).
-compile(export_all).
-behaviour(gen_server).




start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

new_prime(N) ->
    gen_server:call(?MODULE, {prime, N}, 20000).


init([])->
    process_flag(trap_exit, true),
    io:format("~p starting~n", [?MODULE]),
    {ok, 0}.

handle_call({prime, K}, _F, N) ->
    {reply, make_new_prime(K), N + 1}.


handle_cast(_Msg, N) ->{noreply, N}.
handle_info(_Info, N) ->{noreply, N}.
terminate(_R, _N) ->
  io:format("~p stoping ~n", [?MODULE]),
  ok.
code_change(_OldVsn, N, _Extra) -> {ok, N}.


make_new_prime(K) ->
    if 
        K > 100 ->
            alarm_handler:set_alarm(tooHot),
            % N = lib_primes:make_prime(K),
            io:format("gen prime ~n"),
            N = K,
            alarm_handler:clear_alarm(tooHot),
            N;
        true ->
            io:format("gen prime ~n"),
            K
            % lib_primes:make_prime(K)
    end.
                             