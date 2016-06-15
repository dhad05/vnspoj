uses math;
type int=longint;
var n: int;
	x,y: array[1..4] of int;

function calc(i,j: int): int;
var xmax,xmin,ymax,ymin: int;
begin
	xmax:=max(x[i],x[j]);
    xmin:=min(x[i],x[j]);
    ymax:=max(y[i],y[j]);
    ymin:=min(y[i],y[j]);
    exit((xmax-xmin)*(ymax-ymin));
end;

function main(): int;
var i,j: int;
begin
	readln(n);
    if n=1 then exit(-1);
    for i:=1 to n do begin
    	readln(x[i],y[i]);
    end;
    if n=2 then begin
    	if (x[1]=x[2])or(y[1]=y[2]) then exit(-1);
        exit(calc(1,2));
    end;
    for i:=1 to n do for j:=i+1 to n do begin
    	if (x[i]<>x[j])and(y[i]<>y[j]) then exit(calc(i,j));
    end;
end;

begin
writeln(main());
end.