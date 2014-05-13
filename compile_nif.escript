#!/usr/bin/env escript

main([]) ->
    io:format("2 arguments are missing~n");
main([Result, Src]) ->
    Base = code:root_dir(),
    Path = io_lib:format("~s/usr/include",[Base]),
    Gcc = io_lib:format("gcc -fPIC -shared -o ~s ~s -I ~s",[Result, Src, Path]),
    os:cmd(lists:flatten(Gcc)),
    ok.
