type int=longint;
	 link=^node;
     node=record
     	d: int;
        next: link;
     end;
var n: int;
    cha1,cha2,rank1,rank2,trc,con: array[1..50000] of int;
    uu,vv: array[1..100000] of int;
    ke: array[1..50000] of link;

procedure init();
var i: int;
begin
    for i:=1 to n do begin
        cha1[i]:=i;
        cha2[i]:=i;
        rank1[i]:=0;
        rank2[i]:=0;
    end;
end;

function find1(u: int): int;
begin
    if cha1[u]<>u then cha1[u]:=find1(cha1[u]);
    exit(cha1[u]);
end;
function union1(u,v: int): boolean;
begin
    u:=find1(u);
    v:=find1(v);
    if u=v then exit(false);
    if rank1[u]=rank1[v] then inc(rank1[u]);
    if rank1[u]>rank2[v] then cha1[v]:=u
    else cha1[u]:=v;
    exit(true);
end;

function find2(u: int): int;
begin
    if cha2[u]<>u then cha2[u]:=find2(cha2[u]);
    exit(cha2[u]);
end;
function union2(u,v: int): boolean;
var x,y,t: int;
begin
    x:=find2(u);
    y:=find2(v);
    if x=y then exit(false);
    if rank2[x]=rank2[y] then inc(rank2[x]);
    if rank2[x]>rank2[y] then begin
        cha2[y]:=x;
        t:=x;
    end else begin
        cha2[x]:=y;
        t:=y;
    end;
    if con[u]>con[v] then begin
        con[t]:=con[u];
        trc[t]:=trc[u];
    end else begin
        con[t]:=con[v];
        trc[t]:=trc[v];
    end;
end;

procedure dfs(u: int);
var t: link;
	v: int;
begin
	con[u]:=1;
    t:=ke[u];
    while t<>nil do begin
    	v:=t^.d; t:=t^.next;
        if trc[u]=v then continue;
        trc[v]:=u;
        dfs(v);
        con[u]:=con[u]+con[v];
    end;
end;

procedure main();
var fi: text;
    t,u,v,i,m,x,kq: int;
    r: link;
begin
    readln(t);
    for t:=t downto 1 do begin
        readln(n,m);
        init();
        for i:=1 to n do ke[i]:=nil;
        for i:=1 to m do begin
            readln(u,v); inc(u); inc(v);
            uu[i]:=u; vv[i]:=v;
            if not union1(u,v) then continue;
            new(r);
            r^.d:=u;
            r^.next:=ke[v];
            ke[v]:=r;
            new(r);
            r^.d:=v;
            r^.next:=ke[u];
            ke[u]:=r;
        end;
        dfs(1);
        init();
        kq:=0;
        for i:=1 to m do begin
            u:=uu[i]; v:=vv[i];
            if find1(u)<>find1(v) then begin
                union1(u,v);
                inc(kq);
            end else if find2(u)<>find2(v) then begin
                u:=find2(u);
                v:=find2(v);
                while u<>v do begin
                    dec(kq);
                    if con[u]<con[v] then begin
                        x:=find2(trc[u]);
                        union2(u,x);
                        u:=x;
                    end else begin
                        x:=find2(trc[v]);
                        union2(v,x);
                        v:=x;
                    end;
                    u:=find2(u);
                    v:=find2(v);
                end;
            end;
            writeln(kq);
        end;
    end;
end;

begin
main();
end.
