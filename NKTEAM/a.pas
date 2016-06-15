uses math;
type int=longint;
const inf=2100000000;
var n: int;
	A,B,C,rankA,rankB,rankC: array[1..100000] of int;
    f: array[1..100000] of int;

procedure up(i,k: int);
begin
	while i<=n do begin
    	f[i]:=min(f[i],k);
        i:=i+(i and (-i));
    end;
end;
function get(i: int):  int;
var kq: int;
begin
	kq:=inf;
	while i>0 do begin
    	kq:=min(kq,f[i]);
        i:=i-(i and (-i));
    end;
    exit(kq);
end;

procedure main();
var i, kq,j: int;
begin
	readln(n);
    for i:=1 to n do read(A[i]);readln();
    for i:=1 to n do read(B[i]);readln();
    for i:=1 to n do read(C[i]);readln();
    for i:=1 to n do f[i]:=inf;
    for i:=1 to n do begin
    	rankA[A[i]]:=i;
        rankB[B[i]]:=i;
        rankC[C[i]]:=i;
    end;
    kq:=0;
    for j:=1 to n do begin
    	i:=A[j]; 
    	kq:=kq+int(get(rankB[i])>rankC[i]);
        up(rankB[i], rankC[i]);
    end;
    writeln(kq);
end;

begin
main();
end.