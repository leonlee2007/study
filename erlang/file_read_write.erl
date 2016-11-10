file:consult(File)    => 输出:erlang的数据结构
~:unconsult(File)    =>  输入:erlang的数据结构（需自己实现）

file:open(File, read)   =>输出：{ok, S} 
(io:read(S, '') =>输出erlang的数据结构 部分)
(io:get_line(S, '') =>输出文件的一行 字符串)
file:open(File, write)   =>输出：{ok, S} 
(io:format(S, "~p~n", [X]) =>X是erlang的数据结构 部分 用erlang的语法写入)
(io:format(S, "~s~n", [X]) =>X是erlang的数据结构 部分 用打印的字符串写入)
(io:format(S, "~w~n", [X]) =>X是erlang的数据结构 部分 用打印的字符串写入))
file:close(S)

file:read_file(File) => 输出 一次性输出文件的全部二进制格式 dssff => <<"dssff">>
file:write_file(File) => 输入 列表一次性写入文件 "dssff" => dssff

file:open(File, ［read, binary, raw])   =>输出：{ok, S} 二进制可分段读取   
file:pread(IoDevice, Start, Len) => {ok, Bin} or {error, Why}
file:open(File, ［raw, binary, write])   =>输出：{ok, S} 二进制可分段读取   
file:pwrite(IoDevice, Position, Bin) 写入文件
file:close(S)



% ---------------------目录和文件操作
file:list_dir(Dir)   ==>file:list_dir(".")
file:make_dir(Dir)  
file:del_dir(Dir)   
file:read_file_info(Dir or File) =>{ok, #file_info}

file:copy(Source, Destination)
file:delete(File)