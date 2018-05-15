#
# ig�kb�l �s/�s f�n�vk�pz�s, stb. alakok legener�l�sa, l�sd igesgen
#
BEGIN { 
    while ((getline var < "ige_mely.1") > 0) { mely[var]=1; }
    while ((getline var < "ige_tat_kiv.1") > 0) { tat_kiv[var]=1; }
    while ((getline var < "ige_ikes_kiv.1") > 0) { ikes_kiv[var]=1; }
}
# m�ly hangrend� ig�k + i
(MELYRAG=="tat" || MELYRAG=="gat") && (tat_kiv[$0]==1 || ikes_kiv[$0]) { next }
! (MELYRAG=="�" || MELYRAG=="�s") && ikes_kiv[$0] { next }
#/�$/ {print $1 "v" MELYRAG }
#/�$/ {print substr($1,1,length($1)-1) "ov" MELYRAG}
#/�$/ {print substr($1,1,length($1)-1) "iv" MELYRAG}
/[u�o�a�][bcdfghjklmnpqrstvwxyz]*ik$/ { print substr($1,1,length($1)-2) MELYRAG }
/[u�o�a�][bcdfghjklmnpqrstvwxyz]*�t$/ { print $1 MELYRAG }
/[u�o�a�][bcdfghjklmnpqrstvwxyz]+$/ && ! /(ik|�t)$/ { print $1 MELYRAG }
# magas
mely[$0]==1 { RAG=MELYRAG }
mely[$0]!=1 { RAG=MAGASRAG }
/[i�e�����][bcdfghjklmnpqrstvwxyz]*ik$/ || /-zik$/ { print substr($1,1,length($1)-2) RAG; next }
/[i�e�����][bcdfghjklmnpqrstvwxyz]*�t$/ { print $1 RAG; next }
/[i�e�����][bcdfghjklmnpqrstvwxyz]+$/ && ! /(ik|�t)$/ { print $1 RAG }
