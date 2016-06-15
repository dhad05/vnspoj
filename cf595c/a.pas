uses math;
type int=longint;
const inf=2100000000;
var n: int;
	a: array[0..200000] of int;

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
            	inc(i); dec(j);
            end;
        end;
        if l<j then sort(l,j);
        if i<r then sort(i,r);
    end;
begin
	sort(1,n);
end;

procedure main();
var i,kq: int;
begin
	a[0]:=0;
	readln(n);
    for i:=1 to n do read(a[i]);
    qsort();
    for i:=1 to n-1 do a[i]:=a[i+1]-a[i];
    for i:=2 to n-1 do a[i]:=a[i-1]+a[i];
    kq:=inf;
    for i:=n-n div 2 to n-1 do begin
    	kq:=min(kq,a[i]-a[i-(n-n div 2)]);
    end;
    writeln(kq);
end;

begin
randomize();
main();
end.