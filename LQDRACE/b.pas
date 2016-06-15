type int=longint;
     link=^node;
     node=record
        d, c: int;
        next: link;
     end;

var n, k: int;
    ke: array[1..200000] of link;
    count: int64;
    min: int;

var d, q, trc, l: array[1..200000] of int;
    first, last: int;


procedure bfs(s: int);
var u, v: int;
    t: link;
begin
    first:=1;
    last:=1;
    q[last]:=s;
    trc[s]:=s;
    d[s]:=0;
    l[s]:=0;
    while first<=last do begin
        u:=q[first];
        first:=first+1;
        t:=ke[u];
        while t<>nil do begin
            v:=t^.d;
            if trc[u]<>v then begin
                d[v]:=d[u]+t^.c;
                l[v]:=l[u]+1;
                if l[v]>min then break;
                if d[v]>=k then begin
                    if d[v]=k then begin
                        if l[v]<min then begin
                            min:=l[v];
                            count:=1;
                        end else count:=count+1;
                    end;
                end else begin
                    trc[v]:=u;
                    last:=last+1;
                    q[last]:=v;
                end;
            end;
            t:=t^.next;
        end;
    end;
end;

procedure nhap;
var f: text;
    u, v, c, i: int;
    t: link;
begin
    assign(f, '');
    reset(f);
    readln(f, n, k);
    for i:=1 to n do ke[i]:=nil;
    for i:=1 to n-1 do begin
        readln(f, u, v, c);
        u:=u+1;
        v:=v+1;
        new(t);
        t^.d:=u;
        t^.c:=c;
        t^.next:=ke[v];
        ke[v]:=t;
        new(t);
        t^.d:=v;
        t^.c:=c;
        t^.next:=ke[u];
        ke[u]:=t;
    end;
    close(f);
end;

procedure xl;
var i: int;
begin
    min:=300000;
    count:=0;
    for i:=1 to n do bfs(i);
    if count=0 then write(-1) else write(min);
end;

begin
nhap;
xl;
end.
