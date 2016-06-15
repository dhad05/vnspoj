//*** stnode voi 2009 (2015-01-01)

type int=integer;
     long=longint;
     link=^node;
     node=record
        d: int;
        next: link;
     end;

var n,m,s,t: int;
    ke: array[1..10000] of link;
    list: array[1..10000] of int;

var trc, q: array[1..10000] of int;
    first, last: int;

procedure nhap;
var f: text;
    u, v: int;
    i,m: long;
    r: link;
begin
    assign(f, 'stnode.inp');
    reset(f);
    readln(f, n, m, s, t);
    for u:=1 to n do ke[u]:=nil;

    for i:=1 to m do begin
        readln(f, u, v);
        new(r);
        r^.d:=v;
        r^.next:=ke[u];
        ke[u]:=r;
    end;
    close(f);
end;

function bfs(z: int; b: boolean): boolean;
var u, v: int;
    r: link;
begin
    first:=1;
    last:=1;
    q[last]:=s;
    trc[s]:=s;
    trc[z]:=z;
    while first<=last do begin
        u:=q[first];
        first:=first+1;
        r:=ke[u];
        while r<>nil do begin
            v:=r^.d;
            r:=r^.next;
            if trc[v]=0 then begin
                trc[v]:=u;
                last:=last+1;
                q[last]:=v;
                if v=t then begin
                    first:=last+1;
                    break;
                end;
            end;
        end;
    end;

    if trc[t]=0 then bfs:=false else bfs:=true;

    if b then if trc[t]<>0 then begin
        m:=0;
        u:=trc[t];
        while u<>s do begin
            m:=m+1;
            list[m]:=u;
            u:=trc[u];
        end;
    end;

    trc[z]:=0;
    for u:=1 to last do trc[q[u]]:=0;
end;

procedure main;
var i, count: int;
begin
    for i:=1 to n do trc[i]:=0;

    m:=0;
    bfs(s, true);
    count:=0;
    for i:=1 to m do if not bfs(list[i], false) then count:=count+1;
    writeln(count);
end;

begin
nhap;
main;
end.
