uses math;
type int=longint;
const inf=2100000000;
var n: int;
	a,b: array[1..100000] of int;

procedure qsort();
var x,tmp: int;
	procedure sort(l,r: int);
    var i,j: int;
    begin
    	i:=l;j:=r;
        x:=a[l+random(r-l+1)];
        while i<=j do begin
        	while a[i]<x do inc(i);
            while a[j]>x do dec(j);
            if i<=j then begin
            	tmp:=a[i];a[i]:=a[j];a[j]:=tmp;
            	inc(i);dec(j);
            end;
        end;
        if l<j then sort(l,j);
        if i<r then sort(i,r);
    end;
begin
	sort(1,n);
end;

function find(k: int): int;
var l,r,i: int;
begin
	l:=1;
    r:=n;
    while l<=r do begin
    	i:=(l+r) div 2;
        if a[i]<=k then l:=i+1
        else r:=i-1;
    end;
    exit(r);
end;

procedure main();
var i,j,kq: int;
begin
	readln(n);
    for i:=1 to n do read(a[i]);
    readln();
    for i:=1 to n do read(b[i]);
    qsort();
    kq:=inf;
    for i:=1 to n do begin
    	j:=find(-b[i]); 
        if j>0 then kq:=min(kq,abs(b[i]+a[j]));
        if j<n then kq:=min(kq,abs(b[i]+a[j+1]));
        if kq=0 then break;
    end;
    writeln(kq);
end;

begin
randomize();
main();
end.