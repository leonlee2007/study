-module (sellaprime_app).
-behaviour(application).
-compile(export_all).

start(_Type, StartArgs) ->
    sellaprime_supervisor:start_link(StartArgs).
stop(_State) ->
ok.    

