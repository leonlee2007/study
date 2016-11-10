/**
 * VIM 操作目录
 **/
// 打开目录
vim .
vim a-path/ 
// 以下操作在操作目录时生效
//
p,P,t,u,U,x,v,o,r,s
//
c
使当前打开的目录成为当前目录
//
d
创建目录
//
%
创建文件
//
D
删除文件/目录 
//
-
转到上层目录
//
gb
转到上一个 bookmarked directory
//
i
改变目录文件列表方式
//
^l
刷新当前打开的目录
//
mf - 标记文件
mu - unmark all marked files
mz - Compress/decompress marked files
//
gh
显示/不显示隐藏文件( dot-files)
//
^h
编辑隐藏文件列表
//
a
转换显示模式, all - hide - unhide
//
qf
diplay infomation about file
//
qb
list the bookmarked directories and  directory traversal history
//
gi
Display information on file
//
mb
mc
md - 将标记的文件(mf标记文件)使用 diff 模式
me - 编辑标记的文件,只显示一个，其余放入 buffer 中
mh
mm - move marked files to marked-file target directory
mc - copy
mp
mr
mt
//
/**
 * vim 中复制,移动文件
 **/
1, mt - 移动到的目录
2, mf - 标记要移动的文件
3, mc - 移动/复制
//
R 移动文件
/**
 * 打开当前编辑文件的目录
 **/
:Explore
:Hexplore
:Nexplore
:Pexplore
:Sexplore
:Texplore
:Vexplore