uses math;
type int=longint;
     pack=record
        u,v,c: int;
     end;
var n,m: int;
    cha,rank: array[1..10000] of int;
    c,tmp: array[1..100000] of pack;
    a: array[1..10000] of int;

procedure sort();
var i: int;
    x,num: array[0..4000] of int;
begin
    for i:=0 to 4000 do num[i]:=0;
    for i:=1 to m do inc(num[c[i].c]);
    x[0]:=1;
    for i:=1 to 4000 do x[i]:=x[i-1]+num[i-1];
    for i:=1 to m do begin
        tmp[x[c[i].c]]:=c[i];
        inc(x[c[i].c]);
    end;
    for i:=1 to m do c[i]:=tmp[i];
end;

function find(i: int): int;
begin
    if cha[i]<>i then cha[i]:=find(cha[i]);
    exit(cha[i]);
end;
function union(u,v: int): boolean;
begin
    u:=find(u);
    v:=find(v);
    if u=v then exit(false);
    if rank[u]=rank[v] then inc(rank[u]);
    if rank[u]>rank[v] then cha[v]:=u
    else cha[u]:=v;
    exit(true);
end;

procedure main();
var f: text;
    i: int;
    kq: int;
begin
    assign(f,'');
    reset(f);
    readln(f,n,m);
    for i:=1 to n do readln(f,a[i]);
    for i:=1 to m do with c[i] do begin
        readln(f,u,v,c);
        c:=c+c+a[u]+a[v];
    end;
    close(f);
    kq:=a[1];
    for i:=1 to n do kq:=min(kq,a[i]);
    sort();
    for i:=1 to n do begin
        cha[i]:=i;
        rank[i]:=0;
    end;
    for i:=1 to m do with c[i] do kq:=kq+c*int(union(u,v));
    writeln(kq);
end;

begin
main();
end.