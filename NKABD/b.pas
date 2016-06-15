type int=longint;
var l,r,i,kq: int;

function check(a: int): boolean;
var i,this: int;
begin
	this:=1;
    for i:=2 to a-1 do begin
    	if a div i<i then break;
        if a mod i=0 then begin
        	this:=this+i+a div i;
            if i*i=a then this:=this-i;
        end;
    end;    
    exit(this>a);
end;

begin
readln(l,r);
kq:=0;
for i:=l to r do kq:=kq+int(check(i));
writeln(kq);
end.