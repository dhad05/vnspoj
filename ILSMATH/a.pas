uses math;
var this,i,ln10: real;
	n,m,j: longint;
    a: array[1..100] of real;

begin
readln(n);
if n=1 then begin
	m:=1;
    a[1]:=1;
end else m:=0;
this:=0;
i:=2;
ln10:=ln(10);
while this<n+1 do begin
	this:=this+ln(i)/ln10;
    if ceil(this)=n then begin
    	inc(m);
        a[m]:=i;
    end;
    i:=i+1;
end;

if m=0 then writeln('NO')
else begin
	writeln(m);
	for j:=1 to m do writeln(a[j]:0:0);
end;
end.