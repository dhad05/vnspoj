uses math;
type int=longint;
var n: int;
	x,w,e,f: array[0..10000] of int64;

procedure main();
var i,j: int;
	kq: int64;  	
    task3: boolean;
begin
	readln(n);
    x[0]:=0; w[0]:=0; e[0]:=0; f[0]:=0;
    task3:=true;
    for i:=1 to n do begin
    	readln(x[i],w[i],e[i]);
        if (i>1)and(w[i]<>w[i-1]) then task3:=false;
    end;
    kq:=0;
    for i:=1 to n do begin
    	f[i]:=-1;
    	for j:=i-1 downto 0 do if f[j]-w[j]*abs(x[i]-x[j])>=0 then begin
        	f[i]:=max(f[i],e[i]+f[j]-w[j]*abs(x[i]-x[j]));
        end;
        kq:=max(kq,f[i]);
    end;
    writeln(kq);
end;

begin
main();
end.