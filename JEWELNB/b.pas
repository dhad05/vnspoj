uses math;
type int=longint;
	 pack=record a,b: int64; l,r: int;end;
var m,n: int;
	ll,rr: array[1..1600000] of int;
    it: array[1..1600000] of pack;
    count: longint;

operator *(z: pack; i: int) y: int64;
begin
	y:=z.a*int64(i)+z.b;
end;

procedure travel(i,l,r: int);
begin
	if l>r then ll[i]:=0;
    ll[i]:=l;
    rr[i]:=r;
    it[i].a:=0;
    it[i].b:=0;
    if l=r then exit();
    travel(i*2,l,(l+r)div 2);
    travel(i*2+1,(l+r)div 2+1, r);
end;

function get(i,x: int):int64;
begin
	if ll[i]=0 then exit(0);
    if (ll[i]>x)or(x>rr[i]) then exit(0);
    exit(max(it[i]*x, max(get(i*2,x), get(i*2+1,x)) ));
end;

procedure push(i: int; var z: pack);
var l,r,mid: int;
begin
    l:=z.l;r:=z.r;
	if ll[i]=0 then exit();
    if (ll[i]>r)or(rr[i]<l) then exit();
    if not((l<=ll[i])and(rr[i]<=r)) then begin
    	push(i*2,z);
        push(i*2+1,z);
        exit();
    end;

    if (z*ll[i]>=it[i]*ll[i])and(z*rr[i]>=it[i]*rr[i]) then begin
        it[i]:=z;
        exit();
    end;

    if (z*ll[i]<=it[i]*ll[i])and(z*rr[i]<=it[i]*rr[i]) then begin
    	exit();
    end;
    mid:=(ll[i]+rr[i])div 2+1;
    if (z*rr[i]>=it[i]*rr[i])
       and(z*mid>=it[i]*mid) then begin
       push(i*2,it[i]);
       it[i]:=z;
       exit();
    end;

    if (z*rr[i]<=it[i]*rr[i])
       and(z*mid<=it[i]*mid) then begin
       push(i*2,z);
       exit();
    end;
    mid:=mid-1;
    if (z*ll[i]>=it[i]*ll[i])
       and(z*mid>=it[i]*mid) then begin
       push(i*2+1,it[i]);
       it[i]:=z;
       exit();
    end;

    if (z*ll[i]<=it[i]*ll[i])
       and(z*mid<=it[i]*mid) then begin
       push(i*2+1,z);
       exit();
    end;
end;

procedure main();
var v: int64;
	i: int;
    z: pack;
begin
	readln(n,m);
    travel(1,1,n);
    for i:=1 to m do begin
    	readln(z.l,z.r,v,z.a);
        z.b:=v-z.a*int64(z.l);
        count:=0;
        push(1,z);
    end;

//    for i:=1 to n do writeln(get(1,i));
end;

begin
main();
end.
