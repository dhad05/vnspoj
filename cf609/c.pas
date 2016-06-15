uses math;
type int=longint;
var n: int;
	a,b: array[1..100000] of int;

procedure qsort();
	procedure sort(l,r: int);
    var tmp,x,i,j: int;
    begin
    	i:=l; j:=r;
        x:=a[l+random(r-l+1)];
        while i<=j do begin
        	while a[i]<x do inc(i);
            while a[j]>x do dec(j);
            if i<=j then begin
            	tmp:=a[i]; a[i]:=a[j]; a[j]:=tmp;
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
var i,x,t,kq: int;
begin
	readln(n);
    for i:=1 to n do read(a[i]);
    qsort();
    t:=0;
    for i:=1 to n do t:=t+a[i];
    x:=t div n;
    for i:=1 to n do b[i]:=x;
    for i:=n downto n-(t mod n)+1 do inc(b[i]);
    kq:=0;
    for i:=1 to n do kq:=kq+abs(a[i]-b[i]);
    kq:=kq div 2;
    writeln(kq);
end;

begin
randomize(); 
main();
end.