uses math;
type int=longint;
const inf=2100000000;
var n: int;
	a,b,f: array[0..100000] of int;

procedure sort(l,r: int);
var i,j,x,tmp: int;
begin
	i:=l; j:=r;
    x:=a[l+random(r-l+1)];
    while i<=j do begin
    	while a[i]<x do inc(i);
        while a[j]>x do dec(j);
        if i<=j then begin
        	tmp:=a[i]; a[i]:=a[j]; a[j]:=tmp;
            tmp:=b[i]; b[i]:=b[j]; b[j]:=tmp;
        	inc(i); dec(j);
        end;
    end;
    if l<j then sort(l,j);
    if i<r then sort(i,r);
end;

function find(k: int): int;
var l,r,i: int;
begin
	l:=1; r:=n;
    while l<=r do begin
    	i:=(l+r) div 2;
        if a[i]<k then l:=i+1
        else r:=i-1;
    end;
    exit(r);
end;

procedure main();
var i,j,kq: int;
begin
	readln(n);
    for i:=1 to n do readln(a[i],b[i]);
    sort(1,n);
    f[0]:=0;
    kq:=inf;
    for i:=1 to n do begin
    	j:=find(a[i]-b[i]);
        f[i]:=f[j]+i-j-1;
        kq:=min(kq,f[i]+n-i);	
    end;
    writeln(kq);
end;

begin
randomize(); 
main();
end.