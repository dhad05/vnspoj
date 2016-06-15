$_=<>;
@a=split(/\s/);
$s='';
for$b(@a){
	$b='khong' if $b eq 'k';
	$b='khong' if $b eq 'ko';
	$b='nguoi' if $b eq 'ng';
	$b='nhieu' if $b eq 'n';
	$b='duoc' if $b eq 'dc';
	$b='khong' if $b eq 'hok';
	$b='nhu the nao' if $b eq 'ntn';
	$b='ket qua' if $b eq 'kq';
	$s.=$b.' ';
}
$s=~s/j/gi/g;
$s=~s/w/qu/g;
$s=~s/f/ph/g;
$s=~s/dz/d/g;
$s=~s/z/d/g;
$s=~s/^\s*//;
$s=~s/\s*$//;
print $s;
