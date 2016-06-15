uses math;
type int=longint;
var n,m: int;
	time: array[0..1000] of int;

procedure main();
var i,kq,u,v: int;
begin
	fillchar(time,sizeof(time),0); 
	readln(n,m);
    for i:=1 to n do begin
    	readln(u,v);
    	time[u]:=max(time[u],v);
    end;
    kq:=0;
    for i:=m downto 1 do begin
    	kq:=max(kq,time[i]);
    	kq:=kq+1;
    end;
    writeln(kq);
end;

begin
main();
end.