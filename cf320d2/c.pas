var a,b,n: longint;
	x: real;

begin
readln(a,b);
n:=(a+b)div(2*b);
if n=0 then x:=-1
else x:=(a+b)/(2*n);
writeln(x:0:12);
end.