-module(eredis_engine).
-export([open/3,
	 put/4,
	 get/3,
	 delete/3,
	 save_db/2
	]).
-export([init/0]).



-on_load(init/0).


-spec init()->ok|{error,any()}.

init()->
    SoName=case code:priv_dir(?MODULE) of
	       {error,bad_name}->
		   case code:which(?MODULE) of 
		       FileName when is_list(FileName)->
			   filename:join([filename:dirname(FileName),"../priv","eredis_engine"]);
		       _ ->
			   filename:join("../priv","eredis_engine")
		   end;
	       Dir ->
		   filename:join(Dir,"eredis_engine")
	   end,
    erlang:load_nif(SoName,0).
open(_ConfigFile,_Name,_IsOpen)->
    erlang:nif_error({error,not_loader})    
.

save_db(_Ref,_FilePath)->	      
    erlang:nif_error({error,not_loader}).

put(_Ref,_Key,_Value,_DbIndex)->	      
    erlang:nif_error({error,not_loader}).

get(_Ref,_Key,_DbIndex)->
    erlang:nif_error({error,not_loader}).

delete(_Ref,_Key,_DbIndex)->
    erlang:nif_error({error,not_loader}).
