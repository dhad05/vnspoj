procedure main();
var i,j: int;
begin
	readln(n);
    for i:=2 to n-1 do begin
    	for j:=1 to i-1 do begin
        	read(a[i,j]);
            a[j,i]:=a[i,j];
        end;
        readln();
    end;

    while true do begin
    	 
    end;
end;

begin
main();
end.