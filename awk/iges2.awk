#
# ig�kb�l �s/�s f�n�vk�pz�s, stb. alakok legener�l�sa, l�sd igesgen
#
# mag�nhangz�k sz�ma
function M(s) {
	m=0
	n=split(s, a, "")
	for (i=1; i<=n; i++) {
		if (a[i]~/[a�e�i�o���u���]/) m++
	}
	return m
}
BEGIN {
    while ((getline var < "ige_mely.1") > 0) { mely[var]=1; }
    while ((getline var < "ige_tat_kiv.1") > 0) { tat_kiv[var]=1; }
    while ((getline var < "ige_ikes_kiv.1") > 0) { ikes_kiv[var]=1; }
}
# m�ly hangrend� ig�k + i
(MELYRAG=="�") && (tat_kiv[$0]==1 || ikes_kiv[$0]) { next }
(MELYRAG=="�") && (ikes_kiv[$0]) { next }
(MELYRAG=="�") && ((tat_kiv[$0]) && ($0!~/szt$/) && ($0!~/nt$/)) { next }
(MELYRAG=="�" && M($0)==1) { next }
(MELYRAG=="�" && ($0~/ik$/) && M($0)==2) { next }
! (MELYRAG=="�") && ikes_kiv[$0] { next }
/[u�o�a�][bcdfghjklmnpqrstvwxyz]*ik$/ { print "[vrb]" $1 "/" MELYRAG }
/[u�o�a�][bcdfghjklmnpqrstvwxyz]*�t$/ { print "[vrb]" $1 "/" MELYRAG }
/[u�o�a�][bcdfghjklmnpqrstvwxyz]+$/ && ! /(ik|�t)$/ { print "[vrb]" $1 "/" MELYRAG }
# magas
mely[$0]==1 { RAG=MELYRAG }
mely[$0]!=1 { RAG=MAGASRAG }
/[i�e�����][bcdfghjklmnpqrstvwxyz]*ik$/ || /-zik$/ { print "[vrb]" $1 "/" RAG; next }
/[i�e�����][bcdfghjklmnpqrstvwxyz]*�t$/ || /^sz�t$/ { print "[vrb]" $1 "/" RAG; next }
/[i�e�����][bcdfghjklmnpqrstvwxyz]+$/ && ! /(ik|�t)$/ { print "[vrb]" $1 "/" RAG }
