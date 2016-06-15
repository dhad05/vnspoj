uses math;
type int=longint;
const inf=2100000000;
var ll,rr,fmax,fmin: array[1..300000] of int;


procedure travel(i,l,r: int);
begin
        if l>r then begin
                ll[i]:=0;
                exit();
        end;
        ll[i]:=l;rr[i]:=r;
        fmax[i]:=-1;
        fmin[i]:=inf;
        if l=r then exit();
        travel(i*2,l,(l+r)div 2);
        travel(i*2+1,(l+r)div 2 +1,r);
end;
function getmax(i,l,r: int): int;
begin
        if ll[i]=0 then exit(-1);
        if (rr[i]<l)or(ll[i]>r) then exit(-1);
        if (l<=ll[i])and(rr[i]<=r) then exit(fmax[i]);
        exit(max(getmax(i*2,l,r), getmax(i*2+1,l,r)));
end;
function getmin(i,l,r: int): int;
begin
        if ll[i]=0 then exit(inf);
        if (rr[i]<l)or(ll[i]>r) then exit(inf);
        if (l<=ll[i])and(rr[i]<=r) then exit(fmin[i]);
        exit(min(getmin(i*2,l,r), getmin(i*2+1,l,r)));
end;
procedure upmax(i,j,c: int);
begin
        if ll[i]=0 then exit();
        if (ll[i]<=j)and(j<=rr[i]) then begin
                fmax[i]:=max(fmax[i],c);
                upmax(i*2,j,c);
                upmax(i*2+1,j,c);
        end;
end;
procedure upmin(i,j,c: int);
begin
        if ll[i]=0 then exit();
        if (ll[i]<=j)and(j<=rr[i]) then begin
                fmin[i]:=min(fmin[i],c);
                upmin(i*2,j,c);
                upmin(i*2+1,j,c);
        end;
end;

procedure main();
var n,m,i,u,v: int;
    f: text;
begin
        assign(f,'');
        reset(f);
        readln(f,n,m);
        travel(1,1,n);
        for i:=1 to n do begin
                readln(f,u);
                upmax(1,i,u);
                upmin(1,i,u);
        end;

        for i:=1 to m do begin
                readln(f,u,v);
                writeln(getmax(1,u,v)-getmin(1,u,v));
        end;
        close(f);
end;

begin
main();
end.

