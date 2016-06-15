uses math;
type int=longint;
	 pair=record a,b: int64; end;
const inf=$FFFFFFFFFFFFFFF;
var ll, rr: array[1..400000] of int64;
	p: array[1..400000] of pair;
    f, S, Sb, t, a, b: array[0..100000] of int64;
    n: int;

function newpair(x,y: int64): pair;
begin
	with newpair do begin
    	a:=x;
        b:=y;
    end;
end;

function get(p: pair; t: int64): int64;
begin
	exit(p.a*t+p.b);
end;

procedure travel(i,l,r: int);
begin
	if l>r then exit();
	ll[i]:=l;rr[i]:=r;
    if l=r then exit();
    travel(i*2, l, (l+r) div 2);
    travel(i*2+1, (l+r) div 2+1, r);
end;

function findmax(i: int; t: int64): int64;
var ret: int64;
begin
	if ll[i]=0 then exit(-inf);
    if (ll[i]>t)or(rr[i]<t) then exit(-inf);
	if ll[i]=rr[i] then exit(get(p[i],t));
    ret:=get(p[i],t);
    ret:=max(ret, findmax(i*2, t));
    ret:=max(ret, findmax(i*2+1, t));
    exit(ret);	
end;

procedure push(i: int; z: pair);
var j: int;
begin
	if ll[i]=0 then exit();
    if (get(p[i],ll[i]) <= get(z,ll[i]))
    and(get(p[i],rr[i]) <= get(z,rr[i])) then begin
        p[i]:=z;
		exit();	    	
    end;
    if (get(p[i],ll[i]) >= get(z,ll[i]))
    and(get(p[i],rr[i]) >= get(z,rr[i])) then begin
		exit();	    	
    end;
    if ll[i]=rr[i] then exit();
    j:=i*2;
    if (get(p[i],ll[j]) >= get(z,ll[j]))
    and(get(p[i],rr[j]) >= get(z,rr[j])) then begin
        push(j+1, z);
        exit();	    	
    end;
    if (get(p[i],ll[j]) <= get(z,ll[j]))
    and(get(p[i],rr[j]) <= get(z,rr[j])) then begin
        push(j+1, p[i]);
        p[i]:=z;
        exit();	    	
    end;

    if (get(p[i],ll[j+1]) >= get(z,ll[j+1]))
    and(get(p[i],rr[j+1]) >= get(z,rr[j+1])) then begin
        push(j, z);
        exit();	    	
    end;
    if (get(p[i],ll[j+1]) <= get(z,ll[j+1]))
    and(get(p[i],rr[j+1]) <= get(z,rr[j+1])) then begin
    	push(j, p[i]);
        p[i]:=z;
        exit();	    	
    end;
end;

procedure qsort();
var x: int64;
	
    procedure swap(var a,b: int64);
    var t: int64;
    begin
    	t:=a;a:=b;b:=t;
    end;

	procedure sort(l,r: int);
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
var i, j, m: int;
begin
fillchar(ll, sizeof(ll), 0);
for i:=1 to 400000 do begin
	p[i].a:=0;
    p[i].b:=0;
end;
readln(n, m);
for i:=1 to n do readln(t[i],a[i],b[i]);
qsort();
travel(1,1,t[n]);
S[0]:=0;
Sb[0]:=0;
for i:=1 to n do begin
	S[i]:=S[i-1]+a[i]+b[i]*t[i];
    Sb[i]:=Sb[i-1]+b[i];
end;
f[0]:=0;

if 1=1 then begin
	push(1, newpair(Sb[0], f[0]-S[0]));
	for i:=1 to n do begin
		f[i]:=findmax(1, t[i]) + a[i]+S[i-1]-Sb[i-1]*t[i]-m;
    	if i<>n then push(1, newpair(Sb[i], f[i]-S[i]));
	end;
end else begin
	for i:=1 to n do begin
		f[i]:=-inf;
		for j:=i-1 downto 0 do begin
    		f[i]:=max(f[i], Sb[j]*t[i]+f[j]-S[j]);
    	end;
		f[i]:=f[i]+a[i]+S[i-1]-Sb[i-1]*t[i]-m;
	end;
end;
writeln(f[n]);
end;

begin
main();
end.
