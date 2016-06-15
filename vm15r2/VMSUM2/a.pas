type int=longint;
var n: int;

function gcd(a,b: int): int;
var r: int; 
begin
	while b<>0 do begin
    	r:=a mod b;
        a:=b;
        b:=r;
    end;
    exit(a);
end;

function R(m: int): real;
var p,q: int;
begin
	R:=0;
	for p:=1 to m-1 do for q:=p+1 to m do begin
    	if(p+q>=m)and(gcd(p,q)=1) then R:=R+1/(p*q);
    end;
end;

function S(n: int): real;
var i: int;
begin
	S:=0;
	for i:=2 to n do S:=S+R(i);
end;

begin
while not seekeof() do begin
	readln(n);
    writeln(S(n));
end;
end.
