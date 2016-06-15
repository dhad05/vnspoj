type int=longint;
var m,n: int;
	a: array[1..200,1..200] of char;
    num: array[0..200] of int;

procedure main();
var i,j,this: int;
begin
	readln(m,n);
    for i:=1 to m do begin
    	for j:=1 to n do read(a[i,j]);
        readln;
    end;

    fillchar(num,sizeof(num),0);
    for j:=1 to n do begin
    	this:=0;
    	for i:=1 to m do begin
        	if a[i,j]='0' then inc(this)
            else begin
            	inc(num[this]);
                this:=0;
            end;
        end;
        inc(num[this]);
    end;
    for i:=1 to m do if num[i]>0 then writeln(i,' ',num[i]);
end;

begin
main();
end.