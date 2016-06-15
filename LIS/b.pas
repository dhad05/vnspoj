uses math;
type int=longint;
var n: int;
	a,b,f,g: array[1..50000] of int;

procedure qsort();
var t,x: int;
	procedure sort(l,r: int);
    var i,j: int;
    begin
    	x:=a[random(r-l+1)+l];
        i:=l;
        j:=r;
        while i<=j do begin
        	while a[i]<x do inc(i);
            while a[j]>x do dec(j);
            if i<=j then begin
            	t:=a[i];a[i]:=a[j];a[j]:=t;
                t:=b[i];b[i]:=b[j];b[j]:=t;
                i:=i+1;
                j:=j-1;	
            end;
        end;
        if l<j then sort(l,j);
        if i<r then sort(i,r);
    end;
begin
	randomize();
	sort(1,n);
end;

function get(i: int): int;
var this: int;
begin
	this:=0;
    while i>0 do begin
    	this:=max(this, f[i]);
        i:=i-(i and(-i));
    end;
    exit(this);
end;

procedure up(i: int; x: int);
begin
	while i<=n do begin
    	f[i]:=max(f[i], x);
        i:=i+(i and (-i));
    end;
end;

procedure main();
var i, kq, this: int;
	j,l: int;
begin
	readln(n);
    for i:=1 to n do read(a[i]);

    for i:=1 to n do b[i]:=i;
    qsort();

    for i:=1 to n do f[i]:=0;
    kq:=0;
    for i:=1 to n do begin
    	if i=1 then l:=i
        else if a[i]<>a[i-1] then begin
        	for l:=l to i-1 do up(b[l], g[l]);
            l:=i;
        end;            
        g[i]:=get(b[i])+1;
        kq:=max(kq, g[i]);
    end;
    writeln(kq);
//    for i:=1 to n do write(a[i],' ');writeln;
//    for i:=1 to n do write(b[i],' ');writeln;
//    for i:=1 to n do write(g[i],' ');writeln;
end;

begin
main();
end.
