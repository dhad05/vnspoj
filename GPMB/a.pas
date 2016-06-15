uses math;
type int=longint;
	 pack= record x,y: int;end;
var p,v: array[1..1500] of pack;
	a,id: array[1..1500] of int;

operator < (a,b: pack) x: boolean;
begin
	x:=(a.x<b.x)or((a.x=b.x)and(a.y<b.y));
end;
operator > (a,b: pack) x: boolean;
begin
	x:=(a.x>b.x)or((a.x=b.x)and(a.y>b.y));
end;
operator <> (a,b: pack) x: boolean;
begin
	x:=(a.x<>b.x)or(a.y<>b.y);
end;

function gcd(a,b: int): int;
var r: int;
begin
	a:=abs(a);
    b:=abs(b);
	while b<>0 do begin
    	r:=a mod b;
        a:=b;
        b:=r;
    end;
    exit(a);
end;
function vector(a,b: pack): pack;
begin
	with vector do begin
    	x:=a.x-b.x;
        y:=a.y-b.y;
        if x<0 then begin
        	x:=-x;
            y:=-y;
        end;
        if (x=0)and(y=0) then exit();
        a.x:=gcd(x,y);
        x:=x div a.x;
        y:=y div a.x;
        if (x=0)and(y<>0) then y:=1;
        if (y=0)and(x<>0) then x:=1;
    end;
end;

procedure qsort(n: int);
var x: pack;
	i: int;
	procedure swap(var a,b: int);
    var t: int;
    begin
    	t:=a;a:=b;b:=t;
    end;
    procedure swap(var a,b: pack);
    var t: pack;
    begin
    	t:=a;a:=b;b:=t;
    end;
    procedure sort(l,r: int);
    var i,j: int;
    begin
    	i:=l;j:=r;
        x:=v[l+random(r-l+1)];
        while i<=j do begin
        	while v[i]<x do inc(i);
            while v[j]>x do dec(j);
            if i<=j then begin	
            	swap(v[i],v[j]);
                swap(id[i],id[j]);
                inc(i);
                dec(j);
            end;
        end;
        if l<j then sort(l,j);
        if i<r then sort(i,r);
    end;
begin
	for i:=1 to n do id[i]:=i;
    sort(1,n);
end;

function xl(n: int): int;
var i: int;
	g, this: int;
begin
	for i:=1 to n do v[i]:=vector(p[i],p[n]);
    qsort(n);
    g:=0;
    for i:=1 to n do if (v[i].x=0)and(v[i].y=0) then begin
    	g:=g+a[id[i]];
    end;
    this:=0;
    xl:=0;
    for i:=1 to n do if (v[i].x<>0)or(v[i].y<>0) then begin
        if (i=1)or(v[i]<>v[i-1]) then begin
        	xl:=max(xl,this+g);
        	this:=a[id[i]];
        end else this:=this+a[id[i]];
    end;
    xl:=max(xl,this+g);
end;

function main(): int;
var n,i: int;
	kq: int;
begin
	readln(n);
    for i:=1 to n do begin
    	readln(p[i].x,p[i].y,a[i]);
        a[i]:=a[i]*a[i]+5;
    end;
    kq:=0;
    for i:=1 to n do kq:=max(kq,xl(i));
	exit(kq);
end;

begin
randomize();
writeln(main);
end.