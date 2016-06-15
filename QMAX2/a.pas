uses math;
type int=longint;
const inf=$FFFFFFFFFF;
var n: int;
	ll,rr: array[1..300000] of int;
    f,t: array[1..300000] of int64;

procedure travel(i: int);
begin
	if ll[i]>rr[i] then begin
    	ll[i]:=0;
        exit();
    end;
    if ll[i]=rr[i] then exit();
    
	ll[i*2]:=ll[i];
    rr[i*2]:=(ll[i]+rr[i]) div 2;
    ll[i*2+1]:=(ll[i]+rr[i]) div 2+1;
    rr[i*2+1]:=rr[i];
    travel(i*2);
    travel(i*2+1);
end;

procedure wtf(i: int);
begin
	if ll[i]=0 then exit();
    if t[i]=0 then exit();

	f[i]:=f[i]+t[i];
    if ll[i]<rr[i] then begin
    	t[i*2]:=t[i*2]+t[i];
    	t[i*2+1]:=t[i*2+1]+t[i];
    end;
    t[i]:=0;
end;

procedure update(i,u,v,c: int);
begin
	if ll[i]=0 then exit();

    wtf(i);
    if (v<ll[i])or(rr[i]<u) then exit();
    if (u<=ll[i])and(rr[i]<=v) then begin
    	t[i]:=t[i]+c;
        wtf(i);
    end else begin
    	update(i*2,u,v,c);
	    update(i*2+1,u,v,c);
        f[i]:=max(f[i*2], f[i*2+1]);
    end;
end;

function findmax(i,u,v: int): int64;
begin
	if ll[i]=0 then exit();

	wtf(i);
    if (v<ll[i])or(rr[i]<u) then exit(-inf);
    if (u<=ll[i])and(rr[i]<=v) then exit(f[i]);
    exit( max(findmax(i*2,u,v), findmax(i*2+1,u,v)) );
end;

procedure main();
var m,k,u,v,c: int;
begin
fillchar(ll, sizeof(ll), 0);
fillchar(rr, sizeof(rr), 0);
readln(n,m);
ll[1]:=1;
rr[1]:=n;
travel(1);
while m>0 do begin
	read(k,u,v);
    if k=0 then read(c);
    readln();
    if k=0 then update(1,u,v,c)
    else writeln(findmax(1,u,v));
    m:=m-1;
end;
end;

begin
main;
end.
