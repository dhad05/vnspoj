//*** CAPITAL spoj 2015-02-11.pas
type int=longint;
     link=^node;
     node=record d: int;c: int64;next: link; end;

const inf=20000000000000;

var n: int;
    ke: array[1..10000] of link;

var trc, q, maxd: array[1..10000] of int;
    k, l, max: array[1..10000] of int64;
    first, last: int;

procedure qsort;
var i, tmp: int;
    x, tmp1: int64;
    procedure sort(l, r: int);
    var i, j: int;
    begin
        i:=l;j:=r;
        x:=max[(l+r)div 2];
        while i<=j do begin
            while max[i]>x do inc(i);
            while max[j]<x do dec(j);
            if i<=j then begin
                tmp1:=max[i];
                max[i]:=max[j];
                max[j]:=tmp1;
                tmp:=maxd[i];
                maxd[i]:=maxd[j];
                maxd[j]:=tmp;
                inc(i);
                dec(j);
            end;
        end;
        if l<j then sort(l, j);
        if i<r then sort(i, r);
    end;

begin
    for i:=1 to n do begin
        max[i]:=k[i];
        maxd[i]:=i;
    end;
    sort(1, n);
end;

procedure findk(p: int);
var u, v, first, last: int;
    t: link;
begin
    for u:=1 to n do trc[u]:=0;
    first:=1;
    last:=1;
    q[last]:=p;
    trc[p]:=p;
    k[p]:=0;
    while first<=last do begin
        u:=q[first];
        inc(first);
        t:=ke[u];
        while t<>nil do begin
            v:=t^.d;
            if trc[v]=0 then begin
                k[v]:=k[u]+t^.c;
                trc[v]:=u;
                inc(last);
                q[last]:=v;
            end;
            t:=t^.next;
        end;
    end;
end;

procedure bfs(p: int;var min: int64);
var u, v, kmax: int;
    t: link;
    this: int64;
begin
    first:=1;
    last:=1;
    q[last]:=p;
    l[p]:=0;
    kmax:=1;
    this:=-1;
    while first<=last do begin
        u:=q[first];
        inc(first);
        t:=ke[u];
        if this<l[u] then this:=l[u];
        while l[maxd[kmax]]<max[kmax] do inc(kmax);
        while t<>nil do begin
            v:=t^.d;
            if trc[v]=0 then begin
                l[v]:=l[u]+t^.c;
                if l[v]<k[v] then begin
                    inc(last);
                    q[last]:=v;
                    trc[v]:=u;
                end else l[v]:=inf;
            end;
            t:=t^.next;
        end;
    end;
    for u:=1 to last do begin
        trc[q[u]]:=0;
        l[q[u]]:=inf;
    end;
    if this<max[kmax] then this:=max[kmax];
    if min>this then min:=this;
end;

procedure nhap;
var t: link;
    u, v, i, p: int;
    c: int64;
    f: text;
    kq, min: int64;
begin
    assign(f, 'capital.inp');reset(f);
    readln(f, n, p);
    for i:=1 to n do ke[i]:=nil;
    for i:=1 to n-1 do begin
        readln(f, u, v, c);
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
    findk(p);
    qsort;
    kq:=max[1];
    min:=max[1];
    for u:=1 to n do begin
        trc[u]:=0;
        l[u]:=inf;
    end;
    for u:=1 to n do if u<>p then bfs(u, min);
    writeln(kq-min);
end;

begin
nhap;
end.
