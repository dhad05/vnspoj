var l,r,i,j: int64;
	prime: array[1..200000] of boolean;

begin
readln(l,r);
fillchar(prime,sizeof(prime),true);
prime[1]:=false;
i:=2;
while i<=r do begin
	if prime[i] then begin
		j:=i*i;
    	while j<=r do begin
    		prime[j]:=false;
        	j:=j+i;
    	end;
    end;
    inc(i);
end;
i:=l;
while i<=r do begin
	if prime[i] then writeln(i); 
	inc(i);
end;
end.