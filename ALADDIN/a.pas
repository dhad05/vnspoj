uses math;
type int=longint;
var n: int;
    a,b,r,c: array[1..200,1..200] of int;

function sum(i,j: int): int;
begin
	exit(b[i,j]+b[i+1,j+1]+b[i,j+1]+b[i+1,j]);
end;

function try(i,j: int): boolean;
var k: int;
	ok: boolean;
begin
	if i=1 then begin
    	for k:=0 to 1 do begin
        	b[1,j]:=k;
            ok:=true;
            for i:=2 to j-1 do begin
            	b[i,j]:=0;
            	b[i,j]:=a[i-1,j-1]-sum(i-1,j-1);
                if (b[i,j]<0)or(b[i,j]>1) then begin
                	ok:=false;
                    break;
                end;
            end;
            if ok then if try(j,1) then exit(true);
        end;
        exit(false);
    end;
    for k:=0 to 1 do begin
    	b[i,1]:=k;
        ok:=true;
        for j:=2 to i do begin
        	b[i,j]:=0;
            b[i,j]:=a[i-1,j-1]-sum(i-1,j-1);
            if (b[i,j]<0)or(b[i,j]>1) then begin
            	ok:=false;
                break;
            end;
        end;
        if ok then begin
        	if i=n then exit(true);
            if try(1,i+1) then exit(true);
        end;
    end;
    exit(false);
end;

procedure ran();
var i,j: int;
begin
    n:=200;
    for i:=1 to n do for j:=1 to n do b[i,j]:=random(2);
    for i:=1 to n-1 do for j:=1 to n-1 do a[i,j]:=sum(i,j);
    fillchar(b,sizeof(b),0);
end;

procedure main();
var i,j,k: int;
begin
    readln(n);
    for i:=1 to n-1 do for j:=1 to n-1 do read(a[i,j]); 
    for k:=0 to 1 do begin
        b[1,1]:=k;
        if try(1,2) then begin
            for i:=1 to n do begin
        		for j:=1 to n do write(b[i,j],' ');
        		writeln;
    		end;
            exit();
        end;
    end;
    write('No solution');
end;

begin
randomize();
main();
end.
