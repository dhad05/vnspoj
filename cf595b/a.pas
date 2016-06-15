uses math;
type int=longint;
const z=1000000007;
var n,m: int;
	k: int64;
	a,b: array[1..100000] of int64;

function duong(a: int64): int64;
begin
	if a<0 then exit(0);
    exit(a);
end;

function calc(i: int): int64;
var kq: int64;
begin
	kq:=(1 +
    	  (10**k-1) div a[i] +
          duong(b[i]*(10**(k-1))-1) div a[i] -
          (b[i]*(10**(k-1))+(10**(k-1))-1) div a[i]
          )mod z;
    if b[i]=0 then exit(kq-1);
    exit(kq); 
end;

procedure main();
var i: int;
	kq: int64;
begin
	readln(n,k);
    m:=n div k;
    for i:=1 to m do read(a[i]);
    readln();
    for i:=1 to m do read(b[i]);
    kq:=1;
    for i:=1 to m do begin
    	kq:=(kq*calc(i)) mod z;
    end;
    writeln(kq);
end;

begin
main();
end.