#
# t�vek felv�tele a k�l�n kezelt ig�k k�pzett alakjaihoz (egy 0-ban k�l�nb�z�k a tovek2.awk-t�l)
#
/	/ {
    if ($2 != "") {
	print $2 "\t" $1
	next
    }
}
