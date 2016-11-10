{application, sellaprime,
[{discription, "The Prime Number Shop"},
{vsn, "1.0"},
{modules,[sellaprime_app, sellaprime_supervisor, area_server, prime_server, my_alarm_handler]},
{registered, [area_server, prime_server, sellaprime_surpervisor]},
{applications, [kernel, stdlib]},
{mod, {sellaprime_app, []}},
{start_phases, []}
]}.