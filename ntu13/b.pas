procedure dq(a: int);
begin
	if a=1 then begin
    	if n<nkq then begin
        	for i:=1 to n do kq[i]:=cur[i];
            nkq:=n; 
        end;
    end;
end;

procedure main();
var a,i,j: int;
	b,kq: array[1..70] of int;
begin
	readln(a);
    if a=0 then begin
    	writeln(10);
        exit;
    end;
    if a=1 then begin
    	writeln(1);
        exit;
    end;

    nn:=0;
    while a mod 5=0 do begin
    	a:=a div 5;
        inc(nn);
        z[nn]:=5;
    end;
    while a mod 7=0 do begin
    	a:=a div 7;
        inc(nn);
        z[nn]:=7;
    end;
    if not check(a) then begin
    	writeln(-1);
        exit;
    end;
    n:=0;
    nkq:=0;
    if a<>1 then dq(a);

    for i:=1 to nkq do write(kq[i]);
    for i:=1 to nn do write(z[i]);
    writeln;
end;

begin
main();
end.