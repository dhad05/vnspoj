uses math;
type int=longint;
var t,m,n: int;
	f: array[0..30,0..63] of int;

function get(x,i: int): int;
begin
	exit(x and(1 shl i) shr i);
end;
function check(j,k,n: int): boolean;
var i, this: int;
begin
	for i:=1 to n-1 do begin
    	this:=get(j,i)+get(j,i-1)+get(k,i)+get(k,i-1);
		if (this=4)or(this=0) then exit(false);
    end;
    exit(true);
end;

function calc(m,n: int): int;
var x,i,j,k: int;
	kq: int;
begin
	fillchar(f,sizeof(f),0);
	x:=(1<<n)-1;                         
    for i:=0 to x do f[1,i]:=1;
    for i:=2 to m do begin
    	for j:=0 to x do begin
        	for k:=0 to x do if check(j,k,n) then begin
            	f[i,j]:=f[i,j]+f[i-1,k];
            end;
        end;
    end;

    kq:=0;
    for i:=0 to x do kq:=kq+f[m,i];
    exit(kq);
end;

begin
readln(t);
while t>0 do begin
	dec(t);
    readln(m,n);
    writeln(calc(max(m,n), min(m,n)));
end;
end.