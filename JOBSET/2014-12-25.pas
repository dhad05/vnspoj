//*** jobset voi 2014 (2014-12-25)
type int=longint;

const inf=1000000000;

var a: array[1..502, 1..502] of int;
    n: int;

var p, s, t: int;
    f: array[1..502, 1..502] of int;
    q, trc, cc: array[1..502] of int;
    th: array[1..502] of boolean;
    first, last: int;

procedure nhap;
var f: text;
    m, i, u, v: int;
    cc, x: int;
begin
    assign(f, 'jobset.inp');
    reset(f);
    readln(f, n);
    p:=n+2;
    s:=n+1;
    t:=p;
    fillchar(a, sizeof(a), 0);
    cc:=1;

    for i:=1 to n do begin
        read(f, x);
        if x>0 then begin
            a[s, i]:=x;
            cc:=cc+x;
        end else begin
            a[i, t]:=-x;
        end;
    end;
    readln(f, m);
    for i:=1 to m do begin
        readln(f, u, v);
        a[u, v]:=cc;
    end;
    close(f);
end;

function find: boolean;
var u, v: int;
begin
    for u:=1 to p do begin
        trc[u]:=-1;
    end;
    first:=1;
    last:=1;
    q[last]:=s;
    trc[s]:=s;
    cc[s]:=inf;
    while first<=last do begin
        u:=q[first];
        first:=first+1;
        for v:=1 to p do if trc[v]=-1 then begin
            if a[u, v]>f[u, v] then begin
                th[v]:=true;
                cc[v]:=a[u, v]-f[u, v];
            end else if f[v, u]>0 then begin
                th[v]:=false;
                cc[v]:=f[v, u];
            end else continue;

            trc[v]:=u;
            if cc[v]>cc[u] then cc[v]:=cc[u];
            if v=t then exit(true);
            last:=last+1;
            q[last]:=v;
        end;
    end;
    exit(false);
end;

procedure fix;
var u, v: int;
begin
    u:=t;
    while u<>s do begin
        v:=trc[u];
        if th[u] then f[v, u]:=f[v, u]+cc[t]
        else f[u, v]:=f[u, v]-cc[t];
        u:=v;
    end;
end;

procedure main;
var u: int;
    kq: int;
begin
    fillchar(f, sizeof(f), 0);
    while find do fix;
    kq:=0;
    for u:=1 to n do begin
        if trc[u]<>-1 then begin
            kq:=kq+a[s, u]-a[u, t];
        end;
    end;
    write(kq);
end;

begin
nhap;
main;
end.
