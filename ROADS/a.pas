type int=longint;
	 link = ^node;
     node = record
     	u,l,t: int;
        next: link;
     end;

const inf=2100000000;

var a,b: array[1..100, 1..100] of int;
	ke: array[1..100] of link;
    f, g: array[1..100] of int;
    free: array[1..100] of int;
    n,k: int;
    kq, cl, ck: int;

procedure dq(u: int);
var q: link;
begin
	if ck<0 then exit();
	if u=n then if cl<kq then begin
    	kq:=cl;
        exit();
    end;
    if ck<g[u] then exit();
    if cl+f[u]>=kq then exit();
    q:=ke[u];
    while q<>nil do begin
        if free[q^.u]=1 then begin
        	cl:=cl+q^.l;
        	ck:=ck-q^.t;
        	free[q^.u]:=0;
    		dq(q^.u);
        	free[q^.u]:=1;
        	cl:=cl-q^.l;
        	ck:=ck+q^.t;
        end;
    	q:=q^.next;
    end;
end;

procedure nhap();
var u,v,l,z, i: int;
	t, r: int;
    q: link;
    fmax: int;
begin
readln(t); 
while t>0 do begin
   	dec(t);
    readln(k);
    readln(n);
    readln(r);
    for u:=1 to n do for v:=1 to n do begin
    	a[u,v]:=inf;
        b[u,v]:=inf;
    end;
    for u:=1 to n do ke[u]:=nil;
    for i:=1 to r do begin
       	readln(u, v, l, z);
        if a[u,v]>l then a[u,v]:=l;
        if b[u,v]>z then b[u,v]:=z;
        new(q);
        q^.u:=v;
        q^.l:=l;
        q^.t:=z;
        q^.next:=ke[u];
        ke[u]:=q;
    end;

    for i:=1 to n do g[i]:=inf;
    for i:=1 to n do free[i]:=1;
    g[n]:=0;
    while true do begin
    	fmax:=inf;
    	for u:=1 to n do if free[u]=1 then begin
        	if g[u]<fmax then begin
            	fmax:=g[u];
                v:=u;
            end;
        end;
        if fmax=inf then break;
        free[v]:=0;
        for u:=1 to n do if free[u]=1 then begin
        	if g[u]>g[v]+b[u,v] then g[u]:=g[v]+b[u,v];
        end;
    end;

    for i:=1 to n do f[i]:=inf;
    for i:=1 to n do free[i]:=1;
    f[n]:=0;
    while true do begin
    	fmax:=inf;
    	for u:=1 to n do if free[u]=1 then begin
        	if f[u]<fmax then begin
            	fmax:=f[u];
                v:=u;
            end;
        end;
        if fmax=inf then break;
        free[v]:=0;
        for u:=1 to n do if free[u]=1 then begin
        	if f[u]>f[v]+a[u,v] then f[u]:=f[v]+a[u,v];
        end;
    end;

    cl:=0;
    ck:=k;
    kq:=inf;
    for i:=1 to n do free[i]:=1;
    free[1]:=0;
    dq(1);
    if kq=inf then writeln(-1)
    else writeln(kq);
end;
end;

begin
nhap();
end.
