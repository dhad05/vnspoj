uses math;
type int=longint;
	 rec=record a,b: int; end;
const xxx=1000000007;
var n: int;
	a,b: array[1..100000] of int;
    f,g: array[1..100000] of rec;

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

function get(i: int): rec;
begin
	get.a:=-1;
    get.b:=0;
    while i>0 do begin
    	if get.a<f[i].a then begin
        	get:=f[i];
        end else if get.a=f[i].a then begin
        	if get.a>0 then get.b:=(get.b+f[i].b) mod xxx;
        end;
        i:=i-(i and(-i));
    end;
end;

procedure up(i: int; x: rec);
begin
	while i<=n do begin
    	if x.a>f[i].a then begin
        	f[i]:=x;
        end else if x.a=f[i].a then begin
        	f[i].b:=(f[i].b+x.b) mod xxx;
        end;
        i:=i+(i and (-i));
    end;
end;

procedure main();
var i, l, kq, kq1: int;
begin
	readln(n);
    for i:=1 to n do read(a[i]);

    for i:=1 to n do b[i]:=i;
    qsort();

    for i:=1 to n do begin
    	f[i].a:=0;
        f[i].b:=1;
    end;
    kq:=0;
    for i:=1 to n do begin
    	if i=1 then l:=i
        else if a[i]<>a[i-1] then begin
        	for l:=l to i-1 do up(b[l], g[l]);
            l:=i;
        end;
        g[i]:=get(b[i]);
        g[i].a:=g[i].a+1;
        kq:=max(kq, g[i].a);
    end;
    kq1:=0;
	for i:=1 to n do if g[i].a=kq then kq1:=(kq1+g[i].b) mod xxx;
    writeln(kq1);
end;

begin
main();
end.
