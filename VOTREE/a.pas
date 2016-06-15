uses math;
type int=longint;
     link=^node;
     node=record
        d: int;
        next: link;
     end;
const inf=2100000000;
var n,top: int;
    l,r,bac,ll,rr: array[1..70000] of int;
    s,f: array[1..300000] of int;
    ke: array[1..70000] of link;

procedure dfs(i,b: int);
var t: link;
    j: int;
begin
    bac[i]:=b;
    inc(top);
    l[i]:=top;
    s[top]:=i;
    t:=ke[i];
    while t<>nil do begin
        j:=t^.d; t:=t^.next;
        if bac[j]<>0 then continue;
        dfs(j,b+1);
        inc(top);
        s[top]:=i;
        r[i]:=top;
    end;
    if top=l[i] then begin
        inc(top);
        r[i]:=top;
        s[top]:=i;
    end;
end;

procedure make(i,a: int);
begin
    while i<=top do begin
        if (f[i]=0)or(bac[f[i]]>bac[a]) then f[i]:=a;
        i:=i+(i and(-i));
    end;
end;
function find(u,v: int): int;
begin
    find:=s[v];
    while u<=v do begin
        if v-(v and(-v))>=u then begin
            if bac[f[v]]<bac[find] then find:=f[v];
            v:=v-(v and(-v));
        end else begin
            if bac[s[v]]<bac[find] then find:=s[v];
            v:=v-1;
        end;
    end;
end;

procedure upl(i,k: int);
begin
    while i<=n do begin
        ll[i]:=min(ll[i],k);
        i:=i+(i and(-i));
    end;
end;
procedure upr(i,k: int);
begin
    while i<=n do begin
        rr[i]:=max(rr[i],k);
        i:=i+(i and(-i));
    end;
end;
function getl(u,v: int): int;
begin
    getl:=inf;
    while u<=v do begin
        if v-(v and(-v))>=u then begin
            getl:=min(getl,ll[v]);
            v:=v-(v and(-v));
        end else begin
            getl:=min(getl,l[v]);
            v:=v-1;
        end;
    end;
end;
function getr(u,v: int): int;
begin
    getr:=0;
    while u<=v do begin
        if v-(v and(-v))>=u then begin
            getr:=max(getr,rr[v]);
            v:=v-(v and(-v));
        end else begin
            getr:=max(getr,r[v]);
            v:=v-1;
        end;
    end;
end;

procedure main();
var fi: text;
    i,u,v,q: int;
    t: link;
begin
    assign(fi,''); reset(fi);
    readln(fi,n,q);
    for i:=1 to n do ke[i]:=nil;
    for i:=1 to n-1 do begin
        readln(fi,u,v);
        new(t);
        t^.d:=u;
        t^.next:=ke[v];
        ke[v]:=t;
        new(t);
        t^.d:=v;
        t^.next:=ke[u];
        ke[u]:=t;
    end;
    top:=0;
    fillchar(bac,sizeof(bac),0);
    dfs(1,1);
    for i:=1 to n do ll[i]:=inf;
    for i:=1 to n do rr[i]:=0;
    fillchar(f,sizeof(f),0);
    for i:=1 to top do make(i,s[i]);
    for i:=1 to n do begin
        upl(i,l[i]);
        upr(i,r[i]);
    end;
    for i:=1 to q do begin
        readln(fi,u,v);
        writeln(find(getl(u,v), getr(u,v)));
    end;
    close(fi);
end;

begin
main();
end.
