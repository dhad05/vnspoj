uses math;
type int=longint;
var t: int;
	m,n,k: int;
	a,tmp: array[1..400,1..400] of int;
	boo: array[1..400] of boolean;
    x: array[1..400] of int;
    this,curr: int;

function try(i: int): boolean;
var them: boolean;
	j: int;
begin
	if curr=m-1 then exit(true);
	if i>k then exit(false);
    if this>=n then exit(false);
    if not boo[i] then exit(false);
    them:=false;
    for j:=1 to m do if a[i,j]=1 then begin
    	x[j]:=x[j]+a[i,j];
        if x[j]=1 then begin
        	them:=true;
        	inc(curr);
        end;
    end;
    if them then begin	
    	inc(this);
    	if try(i+1) then exit(true);
        dec(this);
    end;
    for j:=1 to m do if a[i,j]=1 then begin
    	x[j]:=x[j]-a[i,j];
        if x[j]=0 then begin
        	dec(curr);
        end;
    end;
    if try(i+1) then exit(true);
    exit(false);
end;

procedure main();
var i,j,u: int;
	giong: boolean;
begin
	readln(n,m,k);
    for i:=1 to m do for j:=1 to k do read(tmp[i,j]);
    fillchar(a,sizeof(a),0);
    for i:=1 to k do begin
    	for j:=2 to m do if tmp[j,i]<tmp[1,i] then a[i,j]:=1;
    end;
    fillchar(boo,sizeof(boo),true);
    curr:=0;
    for i:=1 to k do if boo[i] then inc(curr);
    n:=min(n,curr);
    curr:=0;
    this:=0;
    fillchar(x,sizeof(x),0);
    if try(1) then writeln('TAK')
    else writeln('NIE');
end;

begin
readln(t);
for t:=t downto 1 do main();
end.