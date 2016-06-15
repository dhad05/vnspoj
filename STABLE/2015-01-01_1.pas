//*** stable voi 2010 (2015-01-01_1)

type int=word;
     link=^node;
     node=record
        d: int;
        next: link;
     end;

var n, s: int;
    ke: array[1..10000] of link;

var d, q, trc: array[1..10000] of int;
    f: array[1..10000] of int64;
    first, last: int;

procedure nhap;
var m, i, u, v: int;
    f: text;
    t: link;
begin
    assign(f, 'stable.inp');
    reset(f);
    readln(f, n, m, s);
    for i:=1 to m do begin
        readln(f, u, v);
        new(t);
        t^.d:=v;
        t^.next:=ke[u];
        ke[u]:=t;
    end;
    close(f);
end;

procedure main;
var u, v: int;
    t: link;
    count: int;
begin
    for u:=1 to n do begin
        trc[u]:=0;
        d[u]:=0;
        f[u]:=0;
    end;
    first:=1;
    last:=1;
    q[last]:=s;
    trc[s]:=s;
    d[s]:=1;
    f[s]:=1;
    while first<=last do begin
        u:=q[first];
        first:=first+1;
        t:=ke[u];
        while t<>nil do begin
            v:=t^.d;
            t:=t^.next;
            if d[v]=0 then begin
                d[v]:=d[u]+1;
                f[v]:=f[u];
                trc[v]:=u;
                last:=last+1;
                q[last]:=v;
            end else if (d[v]=d[u]+1) and (trc[v]<>u) then begin
                f[v]:=f[v]+f[u];
                if f[v]>1 then f[v]:=2;
                trc[v]:=u;
            end;
        end;
    end;
    count:=0;
    for u:=1 to n do if f[u]>1 then count:=count+1;
    writeln(count);
end;

begin
nhap;
main;
end.
