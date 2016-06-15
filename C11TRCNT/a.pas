type int=longint;
	 pack=record x,y: int;end;
var n: int;
	a: array[1..200] of pack;
    b: array[1..200] of int;

function triangel(i,j,k: int): int;
var x,y,u,v: int;
begin
	if (i=j)or(j=k)or(i=k) then exit(0);
    x:=a[i].x-a[j].x;
    y:=a[i].y-a[j].y;
    u:=a[i].x-a[k].x;
    v:=a[i].y-a[k].y;
    exit(int(x*v<>y*u));
end;

procedure main();
var i,j,k: int;
	kq: int;
begin
	readln(n);
    for i:=1 to n do readln(a[i].x,a[i].y);

    for i:=1 to n do begin
    	b[i]:=0;
    	for j:=1 to n do for k:=1 to n do begin
        	inc(b[i],triangel(i,j,k));
        end;
    end;
    j:=1;
    kq:=0;
    for i:=1 to n do begin
    	kq:=kq+b[i];
        if b[i]<b[j] then j:=i;
    end;
    kq:=kq div 6;
    writeln(kq,' ',j);
end;

begin
main();
end.