uses math;
type int=longint;
var a,h: array[0..1000,0..1000] of int;
	f,l,r: array[1..1000] of int;
    s: array[0..1000] of int;

function xl(n: int): int;
var i,top: int;
begin
	if n=0 then exit(0);
    top:=0;
    s[0]:=0;
    for i:=1 to n do begin
    	while (top>0)and(f[s[top]]>=f[i]) do dec(top);
        l[i]:=s[top]+1;
        inc(top);
        s[top]:=i;
    end;
    top:=0; 
    s[0]:=n+1;
    for i:=n downto 1 do begin
    	while (top>0)and(f[s[top]]>=f[i]) do dec(top);
        r[i]:=s[top]-1;
        inc(top);
        s[top]:=i;
    end;
    xl:=0;
    for i:=1 to n do xl:=max(xl,(r[i]-l[i]+1)*f[i]);
end;

function main(): int;
var m,n,i,j,r: int;
begin
	readln(m,n);
    for i:=1 to m do begin
    	for j:=1 to n do read(a[i,j]);
        readln;
    end;
    fillchar(h,sizeof(h),0);
    for i:=1 to m do for j:=1 to n do begin
    	if a[i,j]=0 then h[i,j]:=0
        else h[i,j]:=h[i-1,j]+1;
    end;
    main:=0;
    r:=0;
    for i:=1 to m do begin
    	main:=max(main,xl(r));
        r:=0;
    	for j:=1 to n do begin
        	if a[i,j]=0 then begin
        		main:=max(main,xl(r));
		        r:=0;
            end else begin
            	inc(r);
                f[r]:=h[i,j];
            end;
        end;
    end;
    main:=max(main,xl(r));
end;

begin
writeln(main());
end.
