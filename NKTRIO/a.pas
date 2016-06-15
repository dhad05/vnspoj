type int=longint;
var n: int;
	a: array[1..1000,1..1000] of int;
    q,p: array[1..1000] of int;

procedure xl(u: int);
var v,i,m,k: int;
begin
	m:=0;
    k:=0;      	
	for v:=1 to n do if a[u,v]=1 then begin
    	inc(m);
        q[m]:=v;
    end else if a[v,u]=1 then begin
    	inc(k);
        p[k]:=v;
    end;
    for m:=m downto 1 do begin
    	i:=q[m];
        for v:=1 to k do if a[i,p[v]]=1 then begin
        	write(u,' ',i,' ',p[v]);
    		halt;
        end;
        a[u,i]:=-1; 
    end;
end;

procedure main();
var i,j: int;
begin
	readln(n);
    for i:=1 to n do for j:=1 to n do read(a[i,j]);
    for i:=1 to n do xl(i);
    write('-1 -1 -1');
end;

begin
main();
end.