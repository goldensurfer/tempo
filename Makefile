PROJECT = tempo

ERLC_OPTS = +debug_info +warn_export_all +warn_export_vars +warn_shadow_vars +warn_obsolete_guard

PLT_APPS = hipe sasl mnesia crypto compiler syntax_tools
DIALYZER_OPTS = -Werror_handling -Wrace_conditions -Wunmatched_returns | fgrep -v -f ./dialyzer.ignore-warning

DEPS_DIR = deps
DEPS = edown proper

dep_edown = https://github.com/goldensurfer/edown 1.2
dep_proper = https://github.com/goldensurfer/proper 1.2

my_all: priv/tempo_drv.so all

include erlang.mk

priv/tempo_drv.so:
	mkdir -p priv
	./compile_nif.escript priv/tempo_drv.so c_src/tempo.c
