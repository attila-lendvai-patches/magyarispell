#
# t�vek felv�tele a tulajdonnevek mell�kn�vk�pz�s alakjaihoz
#
/.	./ {
    l1 = length($1);
    l2 = length($2);
    # ha a tulajdonn�v �s a mell�kn�v megegyezik (els� bet�t �s a k�pz�t nem n�zz�k)
    if (substr($1, 2, l1-1) == substr($2, 2, l1-1)) {
	if (l1 != l2) {
	    print $2 "\t" $1
	} else {
	    # a m�ret�k megegyezik (pl. Hawaii/hawaii)
	    print $2 "\t" $1
	}
    } else {
	# egy�bk�nt ha nem -y (vagyis i vagy j v�g�)
	if (match($1,"[^ij]$")) {
	    print $2 "\t" $1	    
	}
    }
}
