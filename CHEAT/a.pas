var n,i,j,top,x: longint;
	a,s: array[0..100000] of longint;

begin
readln(n);
for i:=1 to n do readln(a[i]);
a[0]:=0;
top:=0;
x:=0;
for i:=1 to n do begin
	if a[i]>a[i-1] then begin
    	for j:=x+1 to a[i]-1 do begin
        	top:=top+1;
            s[top]:=j;
        end;
    end else begin
    	if a[i]=s[top] then top:=top-1
        else begin
        	writeln('YES');
            halt();
        end;	
    end;
    if a[i]>x then x:=a[i];
end;
writeln('NO');
end.