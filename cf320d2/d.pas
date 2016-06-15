uses math;
type int=longint;
var n,k: int;
	x: int64;
    a: array[1..200000] of int64;
    f: array[0..10,0..200000] of int64;

procedure qsort();
var x,tmp: int64;
	procedure sort(l,r: int);
    var i,j: int;
    begin
    	x:=a[l+random(r-l+1)];
        i:=l;
        j:=r;
        while i<=j do begin
        	while a[i]<x do inc(i);
            while a[j]>x do dec(j);
            if i<=j then begin
            	tmp:=a[i];
                a[i]:=a[j];
                a[j]:=tmp;
                inc(i);
                dec(j);
            end;
        end;
        if l<j then sort(l,j);
        if i<r then sort(i,r);
    end;
begin
	randomize();
	sort(1,n);
end;

procedure main();
var i,j,z: int;
	this: int64;
begin
	readln(n,k,x);
    for i:=1 to n do read(a[i]);
    qsort();
    for i:=0 to k do begin
    	for j:=1 to n do begin
        	f[i,j]:=0; 
        	this:=a[j];
        	for z:=0 to i do begin
            	f[i,j]:=max(f[i,j],f[i-z,j-1] or this);
            	this:=this*x;
            end;
        end;
    end;
    writeln(f[k,n]);
end;

begin
main();
end.
