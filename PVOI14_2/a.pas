uses math;
type int=longint;
	 edge=record u,v,d: int; end;
const di: array[1..2] of int=(0,1);
	  dj: array[1..2] of int=(1,0);
      inf=1000000;
var m,n: int;
	a,pack: array[1..1000,1..1000] of int;
    c: array[1..2000000] of edge;
var cha,con,rac: array[1..1000000] of int;
	maxcon,z: int;
var d: array[1..2000000] of edge;
	first,num: array[-1..inf] of int;

procedure init();
var i: int;
begin
	for i:=1 to n do begin
    	cha[i]:=i;
        con[i]:=1;
    end;
    z:=0;
    maxcon:=0;
end;
procedure reinit();
var i: int;
begin
	for i:=1 to z do begin
    	cha[rac[i]]:=rac[i];
        con[rac[i]]:=1;
    end;
    maxcon:=0;
    z:=0;
end;
function find(u: int): int;
begin
	if cha[u]<>u then cha[u]:=find(cha[u]);
    exit(cha[u]);
end;
procedure themrac(u: int);
begin
	if cha[u]=u then begin
    	inc(z);
        rac[z]:=u;
    end;
end;
procedure union(u,v: int);
begin
	u:=find(u);
    v:=find(v);
    if u=v then exit();
    themrac(u);
    themrac(v);
    maxcon:=max(maxcon,con[u]+con[v]);
    if con[u]>=con[v] then begin
    	cha[v]:=u;
        con[u]:=con[u]+con[v];
    end else begin
    	cha[u]:=v;
        con[v]:=con[v]+con[u];
    end;
end;

procedure initgraph();
var i,j,k,i1,j1: int;
begin
	k:=0;
    for i:=1 to n do for j:=1 to n do begin
    	inc(k);
        pack[i,j]:=k;
    end;
	m:=0;
	for i:=1 to n do for j:=1 to n do begin
    	for k:=1 to 2 do begin
        	i1:=i+di[k];
            j1:=j+dj[k];
            if not((1<=i1)and(i1<=n)and(1<=j1)and(j1<=n)) then continue;
            inc(m);
            c[m].u:=pack[i,j];
            c[m].v:=pack[i1,j1];
            c[m].d:=abs(a[i1,j1]-a[i,j]);
        end;
    end;
    n:=n*n;
end;

procedure sort();
var i: int;
begin
	fillchar(num,sizeof(num),0);
	for i:=1 to m do inc(num[c[i].d]);
    for i:=0 to inf do begin
    	first[i]:=num[i-1]+1;
        num[i]:=num[i-1]+num[i];
    end;
    for i:=1 to m do begin
    	d[first[c[i].d]]:=c[i];
        inc(first[c[i].d]);
    end;
    for i:=1 to m do c[i]:=d[i];
end;

procedure main();
var i,j,kq: int;
begin
	readln(n);
    for i:=1 to n do begin
    	for j:=1 to n do read(a[i,j]);
        readln;
    end;
    initgraph();
    sort();
    init();
    kq:=0;
    for i:=1 to m do begin
    	if (i<>1)and(c[i].d<>c[i-1].d) then begin
        	kq:=max(kq,maxcon);
        	reinit();
        end;
        union(c[i].u,c[i].v);
    end;
	kq:=max(kq,maxcon);
    writeln(kq);
end;

begin
randomize();
main();
end.