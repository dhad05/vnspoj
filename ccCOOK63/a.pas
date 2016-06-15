uses math;
type int=longint;
const zzz=1000000007;
var n,m: int;
	a,b,f,g,x,y: array[1..100000] of int;

procedure qsort();
var i,tmp,x: int;
	procedure sort(l,r: int);
    var i,j: int;
    begin
    	i:=l;j:=r;
        x:=b[l+random(r-l+1)];
        while i<=j do begin
        	while b[i]<x do inc(i);
            while b[j]>x do dec(j);
            if i<=j then begin
            	tmp:=b[i];b[i]:=b[j];b[j]:=tmp;
            	inc(i);dec(j);
            end;
        end;
        if l<j then sort(l,j);
        if i<r then sort(i,r);
    end;
begin
	for i:=1 to n do b[i]:=a[i];
    sort(1,n);
    m:=1;
    for i:=2 to n do if b[i]<>b[i-1] then begin
    	inc(m);
        b[m]:=b[i];
    end;
end;

function find(k: int): int;
var l,r,i: int;
begin
	l:=1;r:=m;
    while l<=r do begin
    	i:=(l+r) div 2;
        if b[i]=k then exit(i);
        if b[i]<k then l:=i+1
        else r:=i-1;
    end;
    exit(-1);
end;

procedure push(i,f,g: int);
begin
	while i<=m do begin
    	if x[i]=f then y[i]:=y[i]+g
        else if x[i]<f then begin
        	x[i]:=f;
            y[i]:=g;
        end;
        i:=i+(i and (-i));
    end;
end;

procedure get(i: int; var f,g: int);
begin
	f:=0;
    g:=0;
    while i>0 do begin
        if f<x[i] then begin
        	f:=x[i];
            g:=y[i];
        end else if f=x[i] then g:=g+y[i];
        i:=i-(i and (-i));
    end;
    if f=0 then g:=1;
end;

function calc(): int;
var i,j,maxf: int;
	kq,this,this1: int;
    k: int;
begin
	qsort();
    for i:=1 to m do begin
        x[i]:=0;
        y[i]:=0;
    end;
    maxf:=0;
    for i:=1 to n do begin
    	j:=find(a[i]);
        get(j-1,this,this1);
        f[i]:=this+1;
        g[i]:=this1;
        maxf:=max(maxf,f[i]);
        push(j,f[i],g[i]);
    end;
    for i:=1 to n do write(f[i],' ');writeln();
    for i:=1 to n do write(g[i],' ');writeln; 
    kq:=0;
    for i:=1 to n do begin
    	if f[i]=maxf then kq:=(kq+(2*g[i] mod zzz)) mod zzz
        else if f[i]=maxf-1 then kq:=(kq+g[i]) mod zzz;
    end;
    exit(kq);
end;

procedure main();
var t,i: int;
begin
	readln(t);
    while t>0 do begin
    	readln(n);
        for i:=1 to n do read(a[i]);
        writeln(calc());
        dec(t);
    end;
end;

begin
randomize();
main();
end.
