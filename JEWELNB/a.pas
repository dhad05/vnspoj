uses math;
type int=longint;
var m,n: int;
	s,e: array[1..200000] of int;
    v,d,kq: array[1..200000] of int64;	

procedure main();
var i,j: int;
begin
	readln(n,m);
    for i:=1 to m do begin
    	readln(s[i],e[i],v[i],d[i]);
    end;
    for i:=1 to n do begin
    	kq[i]:=0;
        for j:=1 to m do begin
        	if (s[j]<=i)and(i<=e[j]) then begin
            	kq[i]:=max(kq[i],d[j]*int64(i)+v[j]-d[j]*int64(s[j]));
            end;
        end;
    end;
    for i:=1 to n do writeln(kq[i]);
end;

begin
main();
end.
