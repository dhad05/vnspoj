uses math;
type int=longint;
	 pack=record a,b: int64; l,r: int;end;
var m,n: int;
	ll,rr: array[1..1600000] of int;
    a: array[1..200000] of int64;
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

procedure get(i: int);
var j: int;
begin
	if ll[i]=0 then exit();
	for j:=ll[i] to rr[i] do a[j]:=max(a[j],it[i]*j);
    get(i*2);
    get(i*2+1);
end;

procedure push(i: int; var z: pack);
var l,r,mid: int;
	zll,zrr,itll,itrr,zmid,itmid: int64;
begin
	l:=z.l;r:=z.r;
	if ll[i]=0 then exit();
    if (ll[i]>r)or(rr[i]<l) then exit();
    if not((l<=ll[i])and(rr[i]<=r)) then begin
    	push(i*2,z);
        push(i*2+1,z);
        exit();
    end;
    zll:=z*ll[i]; itll:=it[i]*ll[i];
    zrr:=z*rr[i]; itrr:=it[i]*rr[i];
    if (zll>=itll)and(zrr>=itrr) then begin
        it[i]:=z;
        exit();
    end;

    if (zll<=itll)and(zrr<=itrr) then begin
    	exit();
    end;
    mid:=(ll[i]+rr[i])div 2+1;
    zmid:=z*mid; itmid:=it[i]*mid;
    if (zrr>=itrr)
       and(zmid>=itmid) then begin
       push(i*2,it[i]);
       it[i]:=z;
       exit();
    end;

    if (zrr<=itrr)
       and(zmid<=itmid) then begin
       push(i*2,z);
       exit();
    end;
    mid:=mid-1;
    zmid:=z*mid; itmid:=it[i]*mid;
    if (zll>=itll)
       and(zmid>=itmid) then begin
       push(i*2+1,it[i]);
       it[i]:=z;
       exit();
    end;

    if (zll<=itll)
       and(zmid<=itmid) then begin
       push(i*2+1,z);
       exit();
    end;
end;

procedure main();
var s,e,i: int;
	v,d: int64;
    z: pack;
begin
	readln(n,m);
    travel(1,1,n);
    for i:=1 to m do begin
    	readln(s,e,v,d);
        z.a:=d;
        z.b:=v-d*int64(s);
        z.l:=s;
        z.r:=e;
        count:=0;
        push(1,z);
    end;
    fillchar(a,sizeof(a),0);
    get(1);
    for i:=1 to n do writeln(a[i]);
end;

begin
main();
end.