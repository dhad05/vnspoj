type int=longint;
	 big=record
		m: int;
        a:array[1..10000] of int;
	 end;

var f0,f1,f2: big;

procedure sum(var c,a,b: big);
var i: int;
	n: int;
begin
	i:=1;
    n:=0;
    while (i<=a.m)or(i<=b.m) do begin
    	n:=n + a.a[i]*int(i<=a.m) + b.a[i]*int(i<=b.m);
        c.a[i]:=n mod 10;
        n:=n div 10;
    	inc(i);
    end;
    if n>0 then c.a[i]:=n
    else dec(i);
    c.m:=i;
end;

procedure mul(var a: big;k: int);
var i,n: int;
begin
	n:=0;
	for i:=1 to a.m do begin
    	n:=n+k*a.a[i];
        a.a[i]:=n mod 10;
        n:=n div 10;
    end;
    while n>0 do begin
    	inc(a.m);
        a.a[a.m]:=n mod 10;
        n:=n div 10;
    end;
end;

procedure print(var a: big);
var i: int;
begin
	for i:=a.m downto 1 do write(a.a[i]);
    writeln;
end;

procedure gan(var a: big; b: int);
begin
	a.m:=0;
    while b>0 do begin
    	inc(a.m);
    	a.a[a.m]:=b mod 10;
        b:=b div 10;
    end;
end;

procedure gan(var a,b: big);
var i: int;
begin
	for i:=1 to b.m do a.a[i]:=b.a[i];
    a.m:=b.m;
end;

procedure main();
var n,k: int;
	i: int;
begin
	readln(n,k);
    dec(k);
    gan(f0,1);
    gan(f1,k);
    for i:=2 to n do begin
    	sum(f2,f0,f1);
        mul(f2,k);
        gan(f0,f1);
        gan(f1,f2);
    end;
    print(f1);
end;

begin
main();
end.