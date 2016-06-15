type int=longint;
var a,b: array[1..1000] of int;

procedure main();
var n,i,j,current,kq: int;
begin
	readln(n);
    for i:=1 to n do read(a[i]);
    for i:=1 to n do b[i]:=1;
    kq:=0;
    current:=0;
    for i:=1 to 2*n do begin
    	for j:=1 to n do if a[j]<=current then begin
			current:=current+b[j];
            b[j]:=0;
        end;
        if current=n then break;
        kq:=kq+1;
        for j:=n downto 1 do if a[j]<=current then begin	
        	current:=current+b[j];
            b[j]:=0;
        end;
        if current=n then break;
        kq:=kq+1;
    end;
    writeln(kq);
end;

begin
main();
end.