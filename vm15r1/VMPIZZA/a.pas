uses math;
type int=longint;
const inf=$FFFFFFFFFFFFFFF;
var n,i,j: int;
	m, c: int64;
    t: array[0..100000] of int;
    f, a, b: array[0..100000] of int64;

procedure qsort();
var x: int;

	procedure swap(var a,b: int);
    var t: int;
    begin
    	t:=a;a:=b;b:=t;
    end;
    procedure swap(var a,b: int64);
    var t: int64;
    begin
    	t:=a;a:=b;b:=t;
    end;
	
	procedure sort(l, r: int);
    var i,j: int;
    begin
    	x:=t[random(r-l+1)+l];
        i:=l;
        j:=r;
        while i<=j do begin
        	while t[i]<x do inc(i);
            while t[j]>x do dec(j);
            if i<=j then begin
            	swap(t[i],t[j]);
                swap(a[i],a[j]);
                swap(b[i],b[j]);
                i:=i+1;
                j:=j-1;
            end;
        end;
        if l<j then sort(l,j);
        if i<r then sort(i,r);
    end;
begin
	sort(1,n);
end;

begin
randomize;
readln(n, m);
for i:=1 to n do readln(t[i], a[i], b[i]);
qsort();
for i:=1 to n do f[i]:=-inf;
f[0]:=0;t[0]:=0;b[0]:=0;a[0]:=0;
for i:=1 to n do begin
	c:=a[i];
	for j:=i-1 downto 0 do begin
    	f[i]:=max(f[i], f[j]+c);
        c:=c+a[j]-b[j]*(t[i]-t[j]);
    end;
    f[i]:=f[i]-m;
    write(f[i],' ');
end;                writeln;
writeln(f[n]);
end.
