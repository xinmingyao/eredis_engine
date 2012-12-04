#ifndef _EREDIS_H
#define _EREDIS_H
#include "erl_nif.h"
#include "redis.h"
typedef struct _eredis_handle
{
  char * db_name;
} eredis_handle;

// Prototypes
ERL_NIF_TERM eredis_open(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]);
ERL_NIF_TERM eredis_put(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]);
ERL_NIF_TERM eredis_get(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]);
ERL_NIF_TERM eredis_delete(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]);
ERL_NIF_TERM eredis_save(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]);

#endif

