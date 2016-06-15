type int=longint;
var a,u,v: array[1..100000] of int;


procedure main();
var m,n,i: int;
begin
	readln(n);
    if n mod 2=1 then begin
    	writeln('NO');
        exit; 
    end;
    for i:=1 to n do read(a[i]);
    m:=0;
    for i:=1 to n do if a[i]<>0 then begin
    	if a[a[i]]<>i then begin
        	writeln('NO');
            exit();
        end;
        m:=m+1;
        u[m]:=i;
        v[m]:=a[i];
        a[a[i]]:=0;
        a[i]:=0;
    end;

    writeln('YES');
    writeln(u[1],' ',v[1]);
    for i:=2 to m do begin
    	writeln(u[i-1],' ',u[i]);
        writeln(v[i-1],' ',v[i]);
    end;
end;

begin
main();
end.