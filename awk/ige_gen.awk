#
# ig�k ragoz�si csoportba sorol�sa
#
BEGIN { 
    while ((getline var < "ige_mely.1") > 0) { mely[var]=1; }
    while ((getline var < "ige_morfo.1") > 0) { morfo[var]=1; }
    while ((getline var < "ige_koto.1") > 0) { koto[var]=1; }
    while ((getline var < "ige_osszetett.1") > 0) { ossz[var]=1; }
}

# m�ly hangrend� ig�k + i
/[u�o�a�][bcdfghjklmnpqrstvwxyz]*ik$/ || /[u�o�a�][bcdfghjklmnpqrstvwxyz]*�t$/ { 
    print "[vrb]" $0 "/O" o (koto[$1]?"":"X") (ossz[$1]?"y":""); next }
/[u�o�a�][bcdfghjklmnpqrstvwxyz]*$/ { 
    if (morfo[$0]==1) { print "[vrb]" $0 "/O" o "/d" m (koto[$1]?"":"X") (ossz[$1]?"y":"")} 
    else { print "[vrb]" $0 "/O" o (koto[$1]?"":"X") (ossz[$1]?"y":"")}
    next
}
# magas, ajakr�ses
/-zik$/ || /[i�e��][-bcdfghjklmnpqrstvwxyz]*ik$/ || /[i�e�][bcdfghjklmnpqrstvwxyz]*�t$/ { 
    if (mely[$0]==1) { print "[vrb]" $0 "/O" o (koto[$1]?"":"X") (ossz[$1]?"y":"")} 
    else { print "[vrb]" $0 "/E" e (koto[$1]?"":"X") (ossz[$1]?"y":"")};
    next
}
/[i�e�][bcdfghjklmnpqrstvwxyz]*$/ && ! /ik$/ {
    if (mely[$0]==1) { print "[vrb]" $0 "/O" o (koto[$1]?"":"X") (ossz[$1]?"y":"")} 
    else { 
		if (morfo[$0]==1) { print "[vrb]" $0 "/E" e "/d" m (koto[$1]?"":"X") (ossz[$1]?"y":"")} 
		else { print "[vrb]" $0 "/E" e (koto[$1]?"":"X") (ossz[$1]?"y":"")};
    }
    next
}
# magas, ajakkerek�t�ses
/[����][-bcdfghjklmnpqrstvwxyz]*ik$/ { 
    if (mely[$0]==1) { print "[vrb]" $0 "/O" o (koto[$1]?"":"X") (ossz[$1]?"y":"")} 
    else { print "[vrb]" $0 "/P" p (koto[$1]?"":"X") (ossz[$1]?"y":"")};
    next 
}
/[����][bcdfghjklmnpqrstvwxyz]*$/ { 
    if (mely[$0]==1) { print "[vrb]" $0 "/O" o (koto[$1]?"":"X") (ossz[$1]?"y":"")}
    else {     
    	if (morfo[$0]==1) { print "[vrb]" $0 "/P" p "/d" m (koto[$1]?"":"X") (ossz[$1]?"y":"")}
    	else { print "[vrb]" $0 "/P" p (koto[$1]?"":"X") (ossz[$1]?"y":"")};
	}
    next 
}
