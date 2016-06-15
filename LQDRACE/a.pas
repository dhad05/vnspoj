uses math;
type int=longint;
     link=^node;
     node=record
        next: link;
        d, c: int;
     end;
const maxk=1000000;
      maxn=200000;
      inf=2100000000;

var n, k, kq: int;
    ke: array[1..maxn] of link;
    removed: array[1..maxn] of boolean;
    f, g, trc, dfsing: array[0..maxn] of int;
    zz, sign_a, sign_zz: array[1..maxk] of int;
    a: array[1..maxk] of boolean;
    cur: int;

procedure nhap;
var f: text;
    t: link;
    i, u, v, c: int;
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
        t^.next:=ke[v];
        t^.c:=c;
        ke[v]:=t;
        new(t);
        t^.d:=v;
        t^.next:=ke[u];
        t^.c:=c;
        ke[u]:=t;
    end;
    close(f);
end;

function central(u: int): int;
var i, _min: int;

    procedure dfs(u: int);
    var t: link;
        c: int;
    begin
        if removed[u] then exit;
        g[u]:=1;
        t:=ke[u];
        c:=0;
        while t<>nil do begin
            if t^.d<>trc[u] then begin
                c:=c+1;
                trc[t^.d]:=u;
                dfs(t^.d);
                g[u]:=g[u]+g[t^.d];
            end;
            t:=t^.next;
        end;
        if c=1 then f[u]:=g[u];
    end;

    procedure find(i: int);
    var t: link;
    begin
        if removed[i] then exit;
        if _min>abs(g[u] div 2-g[i]) then begin
            _min:=abs(g[u] div 2-g[i]);
            central:=i;
        end;
        t:=ke[i];
        while t<>nil do begin
            if t^.d<>trc[i] then find(t^.d);
            t:=t^.next;
        end;
    end;
begin
    g[0]:=0;
    trc[u]:=0;
    dfs(u);
    _min:=inf;
    find(u);
end;

procedure dfs(u: int); //*** dfs and update kq; f[]=~k
var t: link;
begin
    if removed[u] then exit;
    if f[u]>k then exit;
    a[f[u]]:=true;
    sign_a[f[u]]:=cur;
    if sign_zz[f[u]]<>cur then begin
        sign_zz[f[u]]:=cur;
        zz[f[u]]:=u;
    end else if zz[f[u]]=0 then begin
        zz[f[u]]:=u;
    end else if g[u]<g[zz[f[u]]] then begin
        zz[f[u]]:=u;
    end;

    if f[u]=k then begin
        if kq>g[u] then kq:=g[u];
    end else if (sign_a[k-f[u]]=cur) and (a[k-f[u]]) and (dfsing[zz[k-f[u]]]<>dfsing[u]) and (kq>g[u]+g[zz[k-f[u]]]) then begin
        kq:=g[u]+g[zz[k-f[u]]];
    end;

    t:=ke[u];
    while t<>nil do begin
        if t^.d<>trc[u] then begin
            trc[t^.d]:=u;
            g[t^.d]:=g[u]+1;
            f[t^.d]:=f[u]+t^.c;
            dfsing[t^.d]:=dfsing[u];
            dfs(t^.d);
        end;
        t:=t^.next;
    end;
end;

procedure startdfs(u: int);
var t: link;
    c: int;
begin
    trc[u]:=u;
    f[u]:=0;
    g[u]:=0;
    t:=ke[u];
    c:=0;
    while t<>nil do begin
        if not removed[t^.d] then begin
        c:=c+1;
        dfsing[t^.d]:=c;
        g[t^.d]:=1;
        f[t^.d]:=t^.c;
        trc[t^.d]:=u;
        dfs(t^.d);
        end;
        t:=t^.next;
    end;
end;

procedure xl(u: int);
var t: link;
begin
    if removed[u] then exit;
    cur:=cur+1;
    u:=central(u);
    startdfs(u);
    removed[u]:=true;
    t:=ke[u];
    while t<>nil do begin
        xl(t^.d);
        t:=t^.next;
    end;
end;

begin
nhap;
fillchar(removed, sizeof(removed), false);
fillchar(sign_a, sizeof(sign_a), 0);
fillchar(sign_zz, sizeof(sign_zz), 0);
cur:=0;
kq:=200001;
xl(1);
if kq=200001 then writeln(-1) else writeln(kq);
end.
