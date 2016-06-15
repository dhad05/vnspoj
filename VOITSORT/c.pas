uses math;
type int=longint;
var n: longint;
	a: array[1..1000] of int;
var z: int;
	b,c,f: array[1..1000] of int;

procedure swap(var a,b: int); var t: int; begin t:=a;a:=b;b:=t; end;

procedure up(i,k: int);
var z: int;
begin
	if c[i]=k then exit();
    z:=k-c[i];
    c[i]:=k;
	while i<=n do begin
    	f[i]:=f[i]+z;
        i:=i+(i and (-i));
    end;
end;

function get(i: int): int;
var this: int;
begin
	this:=0;
	while i>0 do begin
		this:=this+f[i];
        i:=i-(i and (-i));	
    end;
    exit(this);
end;

function cc(k: int): int;
var i,l,r: int;
begin
	z:=z+1;
    r:=n+1;
    for i:=k+1 to n do begin
    	b[a[i]]:=z;
        if a[i]<a[k] then r:=min(r, a[i]);
    end;
    l:=0;
    for i:=a[k]-1 downto 1 do if b[i]<>z then begin
    	l:=i;
        break;
    end;
    if l>r then exit(0);
    exit(1);
end;

function check(k: int): int;
begin
	for k:=k to n do up(k,cc(k));
    exit(int(get(n)=n));
end;

procedure main();
var m,k,i,l: int;
	kq: int;
begin
	readln(n,m);
    for i:=1 to n do read(a[i]);
	fillchar(f, sizeof(f),0);
    fillchar(b, sizeof(b),0);
    fillchar(c, sizeof(c),0);
    k:=1;
    kq:=0;
    z:=0;	
    while m>0 do begin
    	m:=m-1;
        kq:=kq+check(k);
        k:=0;
        for i:=n-1 downto 1 do if a[i]<a[i+1] then begin
        	k:=i;
            break;
        end;
        if k=0 then break;
        for i:=n downto k+1 do if a[i]>a[k] then begin
        	l:=i;
            break;
        end;
        swap(a[k], a[l]);
        for i:=k+1 to (n+k+1) div 2 do swap(a[i], a[n-(i-k-1)]);
    end;
    writeln(kq);
end;

begin
main();
end.