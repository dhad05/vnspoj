uses math;
type int=longint;
	 mang=array[0..9] of int64;
var u,v: int64;
	a,b: mang;

function mu(a: int64;n: int): int64;
begin
	mu:=1;
	for n:=n downto 1 do mu:=mu*a;
end;

function length(n: int64): int;
begin
	length:=0;
    while n>0 do begin
    	inc(length);
        n:=n div 10;
    end;
end;

function get(n: int64;l,r: int): int64;
begin
	if l<r then exit(0);
    get:=0;
    for r:=r downto 2 do begin
    	dec(l);
        n:=n div 10;
    end;
    for r:=1 to l do begin
    	get:=get+(n mod 10)*mu(10,r-1);
        n:=n div 10;
    end;
end;

procedure calc(var a: mang; n: int64);
var i,j: int;
	l,r,this,mu: int64;
begin
	fillchar(a,sizeof(a),0);
    if n<0 then exit();
    mu:=1;
	for i:=1 to length(n) do begin
        this:=get(n,i,i);
        l:=get(n,length(n),i+1);
        r:=get(n,i-1,1);
        for j:=1 to this-1 do a[j]:=a[j]+(l+1)*mu;
        for j:=this+1 to 9 do a[j]:=a[j]+l*mu;
        if this>0 then a[this]:=a[this]+r+1+l*mu;
        if this=0 then a[0]:=a[0]+r+1+(l-1)*mu
        else a[0]:=a[0]+l*mu;
        mu:=mu*10;
    end;
end;

procedure xl(u,v: int64);
var i: int;
begin
	calc(a,u-1);
    calc(b,v);
    for i:=0 to 9 do write(b[i]-a[i],' ');
    writeln;
end;

begin
while not eof() do begin
	readln(u,v);
    if (u<>0)or(v<>0) then xl(min(u,v),max(u,v))
    else break;
end;
end.
