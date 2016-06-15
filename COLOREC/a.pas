uses math;
type int=longint;
var n,m: int;
	a: array[1..401,1..401] of int;
    f: array[1..15] of int64;

procedure main();
var i,j,k,u,v,c: int;
	kq: int64;
begin
	fillchar(a,sizeof(a),0);
	readln(n);
    m:=0;
    for i:=1 to n do begin
    	readln(u,v,c);
        u:=u+201;
        v:=v+201;
        a[u,v]:=1 shl (c-1);
        m:=max(m,max(u,v));
    end;
    kq:=0;
    for i:=1 to m do for j:=1 to i-1 do begin
    	fillchar(f,sizeof(f),0);
    	for k:=1 to m do if (a[i,k]or a[j,k]<>0)and(a[i,k]<>a[j,k])then begin
        	c:=a[i,k]+a[j,k];
            kq:=kq+f[15-c];
            inc(f[c]);
        end;
    end;
    writeln(kq);
end;

begin
main();
end.