#
# t�vek felv�tele kiv�telekhez a fonev_morfo �llom�nyokb�l
#
/	/ {
    if ($2 != "") {
	print "[nounmorfo]" $2 "\t" $1 "[noun]{+[PLUR]+[NOM]}"
	next
    }
}
