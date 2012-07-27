-module(eredis_engine_SUITE).
-compile(export_all).
-include_lib("common_test/include/ct.hrl").


init_per_suite(Config)->    
    C1=code:lib_dir(eredis_engine,'c_src/redis/redis.conf'),
    D1=code:lib_dir(eredis_engine,'test/redis.rdb'),
    {ok,Db}=eredis_engine:open(D1,C1,0),
    [{db,Db}|Config].

end_per_suite(Config)->

    Config.

init_per_testcase(_,Config)->
    Config
    .

end_per_testcase(_Config)->
    
    ok.

all()->
    [get,save].

    
save(Config)->
    Db=?config(db,Config),
    ok=eredis_engine:put(Db,<<"a1">>,<<"b1">>),
    ok=eredis_engine:put(Db,<<"a2">>,<<"b1">>),
    eredis_engine:save_db(Db,code:lib_dir(eredis_engine,'test/redis2.rdb')).

get(Config)->
    Db=?config(db,Config),
    ok=eredis_engine:put(Db,<<"get">>,<<"v1">>),
    timer:sleep(50),
    {ok,<<"v1">>}=eredis_engine:get(Db,<<"get">>).


