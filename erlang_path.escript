#!/usr/bin/env escript

main(_Args) ->
           Base = code:root_dir(),
           Path = io_lib:format("~s/usr/include",[Base]),
           io:format("~s~n",[Path]),                    
ok.
