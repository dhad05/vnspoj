uses math;
type int=longint;
	 pack=record a,b,last: int; end;
var top: int;
    s: array[1..1000] of pack;
    t: array[0..1000] of int;
    a,w,h: array[0..1000,0..1000] of int;
    l,r: int;

procedure push(a,b,j: int);
var z: pack;
begin
	z.a:=a;
    z.b:=b;
    z.last:=j;
    while (top>0)and(s[top].a>z.a) do dec(top);
    if top=0 then begin
    	top:=1;
        s[top]:=z;
        t[top]:=0;
        exit();
    end;
    if s[top].a=z.a then begin
    	s[top].last:=j;
    	exit();
    end;
    z.b:=-z.a*(s[top].last+1);
    while t[top]>=ceil((s[top].b-z.b)/(z.a-s[top].a)) do dec(top);
    s[top].last:=j-1;
    inc(top);
    s[top]:=z;
    t[top]:=ceil((s[top-1].b-z.b)/(z.a-s[top-1].a));
end;
function bs(k: int): int;
var i: int;
begin
	l:=1;
    r:=top;
    while l<=r do begin
    	i:=(l+r) div 2;
        if t[i]<=k then l:=i+1
        else r:=i-1;
    end;
    exit(k*s[r].a+s[r].b);
end;

function main(): int;
var m,n,i,j: int;
	kq: int;
begin
readln(m,n);
fillchar(a,sizeof(a),0);
fillchar(w,sizeof(w),0);
fillchar(h,sizeof(h),0);
for i:=1 to m do begin
	for j:=1 to n do read(a[i,j]);
    readln;
end;
for i:=1 to m do for j:=1 to n do begin
	w[i,j]:=w[i,j-1]+1;
    h[i,j]:=h[i-1,j]+1;
    if a[i,j]=0 then begin
    	w[i,j]:=0;
        h[i,j]:=0;
    end;
end;
kq:=0;
for i:=1 to m do begin
	top:=0;
	for j:=1 to n do begin
    	if a[i,j]=0 then begin
        	top:=0;
            continue;
        end;
        push(h[i,j],-h[i,j]*(j-w[i,j]+1),j);
        kq:=max(kq,bs(j+1));
	end;
end;
exit(kq);
end;

begin
writeln(main());
end.
