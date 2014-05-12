PROJECT = tempo

ERLC_OPTS = +debug_info +warn_export_all +warn_export_vars +warn_shadow_vars +warn_obsolete_guard

PLT_APPS = hipe sasl mnesia crypto compiler syntax_tools
DIALYZER_OPTS = -Werror_handling -Wrace_conditions -Wunmatched_returns | fgrep -v -f ./dialyzer.ignore-warning

DEPS_DIR = deps
DEPS = edown proper

dep_edown = https://github.com/goldensurfer/edown 1.2
dep_proper = https://github.com/goldensurfer/proper 1.2

my_all: priv all

include erlang.mk

priv:
	export ERL_PATH=`erlang_path.escript`
	mkdir -p priv
	gcc -fPIC -shared -o priv/tempo_drv.so c_src/tempo.c -I $(ERL_PATH)
