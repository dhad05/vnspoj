uses math;
type int=longint;
const inf=2100000000;
var minhor,maxhor,minver,maxver: array[-1000..1000] of int;
	a: array[-1000..1000,-1000..1000] of int;
    freehor,freever: array[-1000..1000,-1000..1000] of boolean;

procedure hor(y,l,r: int); forward;
procedure ver(x,l,r: int); forward;

procedure hor(y,l,r: int);
var x: int;
begin
	if minhor[y]=inf then exit();
	maxhor[y]:=max(maxhor[y],r);
    minhor[y]:=min(minhor[y],l);
	if (minhor[y]=maxhor[y]) then exit();
    for x:=l to r do begin
    	if freever[x,y] then begin
        	a[x,y]:=1;
            if minver[x]=inf then begin
            	minver[x]:=y;
                maxver[x]:=y;
                continue;
            end;
            freever[x,y]:=false;
            if minver[x]>y then ver(x,y,minver[x])
            else if maxver[x]<y then ver(x,maxver[x],y)
            else freever[x,y]:=true;
        end;
    end;
end;
procedure ver(x,l,r: int);
var y: int;
begin
	if minver[x]=inf then exit();
	maxver[x]:=max(maxver[x],r);
    minver[x]:=min(minver[x],l);
	if (minver[x]=maxver[x]) then exit();
    for y:=l to r do begin
    	if freehor[x,y] then begin
            a[x,y]:=1;
            if minhor[y]=inf then begin
            	minhor[y]:=x;
                maxhor[y]:=x;
                continue;
            end;
            freehor[x,y]:=false;
            if minhor[y]>x then hor(y,x,minhor[y])
            else if maxhor[y]<x then hor(y,maxhor[y],x)
            else freehor[x,y]:=true;
        end;
    end;
end;

procedure main();
var i,x,y,n,kq: int;
begin
	fillchar(a,sizeof(a),0);
	readln(n);
    for x:=-1000 to 1000 do begin
    	minver[x]:=inf;
        minhor[x]:=inf;
        maxver[x]:=-inf;
        maxhor[x]:=-inf;
    end;
    for i:=1 to n do begin
    	readln(x,y);
        a[x,y]:=1;
        minhor[y]:=min(minhor[y],x);
        maxhor[y]:=max(maxhor[y],x);
        minver[x]:=min(minver[x],y);
        maxver[x]:=max(maxver[x],y);
    end;
    fillchar(freehor,sizeof(freehor),true);
    fillchar(freever,sizeof(freever),true);
    for i:=-1000 to 1000 do begin
    	hor(i,minhor[i],maxhor[i]);
        ver(i,minver[i],maxver[i]);
    end;
    kq:=0;
    for x:=-1000 to 1000 do for y:=-1000 to 1000 do begin
    	kq:=kq+a[x,y];
    end;
    writeln(kq);
end;

begin
main();
end.