 #! /bin/bash
stax=.08

echo "Part cost"

read oldpart

echo "Labor"

read oldlabor
echo
echo "The old part mark up is"
	opt=$( bc <<< "scale=2;$oldpart*.20" )

		echo "$opt"

echo "the old part total is"
	opt1=$( bc <<< "scale=2;$opt+$oldpart" )

		echo "$opt1"

echo "the old labor is"
	ol=$( bc <<< "scale=2;$oldlabor*115" )

		echo "$ol"

echo "original sales tax is"
	ost=$( bc <<< "scale=2;$opt1*$stax" )

		echo "$ost"

echo
echo "total ticket price is"
	tt=$( bc <<< "scale=2;$opt1+$ol+$ost" )
		echo "$tt"
echo "profit is "
	op=$( bc <<< "scale=2;$opt+$ol" )
		echo  "$op"
echo
echo "Time for the new way"

echo

echo "the new part mark up is"
	npt=$( bc <<< "scale=2;$oldpart*.10" )
		echo "$npt"

echo "the new part total is"
	nptt=$( bc <<< "scale=2;$npt+$oldpart" )
		echo "$nptt"

echo "the new labor without sales tax diiferance is"
	dif1=$( bc <<< "scale=2;$opt-$npt" )
	lc=$( bc <<< "scale=2;$dif1/115" )
	tlc=$( bc <<< "scale=2;$lc+$oldlabor" )
	tlc1=$( bc <<< "scale=2;$tlc*115" )
		echo "$tlc1"

echo "the new labor hours is"
echo "$tlc"

echo "the new sales tax is"
	nst=$( bc <<< "scale=2;$nptt*$stax" )
		echo "$nst"
echo
echo "the new total ticket price is"
	mm=$( bc <<< "scale=2;$ost-$nst" )
	ntot=$( bc <<< "scale=2;$mm+$tlc1+$nptt+$nst" )
		echo "$ntot"

echo "the new profit is "
	newprof=$( bc <<< "scale=2;$mm+$npt+$tlc1" )
		echo "$newprof"
	






