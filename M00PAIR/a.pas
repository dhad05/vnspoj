uses math;
type int=longint;
	 big=record
     	l: int;
        n: array[1..500] of int;
     end;
var n: int;
	a,b: array[0..1000] of big;

procedure print(a: big);
var i: int;
begin
	if a.l=0 then write(0)
    else with a do for i:=l downto 1 do write(n[i]);
    writeln;
end;

function z(n: int): big;
begin
	z.l:=0;
    while n>0 do begin
    	inc(z.l);
        z.n[z.l]:=n mod 10;
        n:=n div 10;
    end;
end;

operator +(a,b: big) c: big;
var i,n: int;
begin
	c:=z(0);
	if max(a.l,b.l)=0 then exit();
    n:=0;
	for i:=1 to max(a.l,b.l) do begin
    	n:=n+int(i<=a.l)*a.n[i]+int(i<=b.l)*b.n[i];
        c.n[i]:=n mod 10;
        n:=n div 10;
    end;
    if n>0 then begin
    	inc(i);
        c.n[i]:=n;
    end;
	c.l:=i;
end;

procedure init();
var i: int;
begin
	a[0]:=z(1);b[0]:=z(0);
    a[1]:=z(1);b[1]:=z(0);
    for i:=2 to 1000 do begin
    	b[i]:=a[i-2]+b[i-2];
        a[i]:=a[i-1]+a[i-1];
    end;
end;

begin       
init();
while not seekeof() do begin
	readln(n);
    print(b[n]);
end;
end.