uses math;
type int=longint;
const inf=5000001;
var n: int;
	a,b: array[1..500,1..500] of int;
    x,y,d,p: array[1..500] of int;

function dijs(w: int): int;
var i,j,dmin: int;
begin
	for i:=1 to n do begin
    	d[i]:=inf;
        p[i]:=1;
        y[i]:=-1;
    end;
    d[1]:=0;
    y[1]:=w;
    j:=0;
    while true do begin
    	dmin:=inf;
        for i:=1 to n do if (p[i]=1)and(dmin>d[i]) then begin	
        	dmin:=d[i];
            j:=i;
        end;
        if (dmin=inf)or(j=n) then break;
        p[j]:=0;
        for i:=1 to n do if (a[j,i]<>inf)and(y[j]-b[j,i]>=0) then begin
        	if d[i]<d[j]+a[j,i] then continue;
        	if d[i]>d[j]+a[j,i] then begin
            	d[i]:=d[j]+a[j,i];
                y[i]:=y[j]-b[j,i];
            end else y[i]:=max(y[i],y[j]-b[j,i]);
            if x[i]=1 then y[i]:=w;
        end;
    end;
	exit(d[n]);
end;

procedure main();
var m,i,j,u,v,c,t,l,r,dmin: int;
begin
	readln(n);
    for i:=1 to n do read(x[i]);
    readln();
    readln(m);
    for i:=1 to n do for j:=1 to n do begin
    	a[i,j]:=inf;
        b[i,j]:=inf;
    end;
    for i:=1 to m do begin
    	readln(u,v,t,c);
        a[u,v]:=t;
        a[v,u]:=t;
        b[u,v]:=c;
        b[v,u]:=c;
    end;
    dmin:=dijs(inf);
    l:=0;
    r:=inf;
    while l<=r do begin
    	i:=(l+r) div 2;
        if dijs(i)=dmin then r:=i-1
        else l:=i+1;
    end;
    writeln(l);
end;

begin
main();
end.
