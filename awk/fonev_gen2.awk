#
# morfonetikus altern�ns f�nevek ragoz�si csoportba sorol�sa
#
# produkt�v toldal�kol�s
#
# k�ls� v�ltoz�: kulon_e (tulajdonnevek eset�n kikapcs. sz��sszet�tel,
# ha kulon_e==1)
#
BEGIN { 
    while ((getline var < "fonev_mely.1") > 0) { mely[var]=1; }
    while ((getline var < "fonev_kulon.1") > 0) { kulonszo[var]=1; }
    while ((getline var < "fonev_osszetett.1") > 0) { osszetett[var]=1; }
}

function kulon(st, nyi, nyi_rule119) {
    s=""
    if (osszetett[$1]==1) s="/y" nyi; else s = nyi_rule119;
    if (kulon_e==1) return s;
    if (kulonszo[st]!=1) {
	return s "/Y/c" melleknevrag
    } else {
	return "/c" melleknevrag
    }
}

# -talan/-telen �s -i k�pz�k (szerelemtelen, *h�ztalan, *szerelemi, h�zi)
function talan(s, s2, s3) {
    if (RAG != "") return s
    if (osszetett[$1]==1) return s2
    return s3
}

# -ka, -ke kicsiny�t�k�pz�:
# a sz� nem �sszetett, �s legal�bb k�t sz�tag�
function ka(s) {
    if (!osszetett[$1] && $1~/[a�e�i�o���u���A�E�I�O���U���].*[a�e�i�o���u���]/) return s
    return ""
}

# mag�nhangz�ra v�gz�d�
function magan(s,s2) {
	return ($1~"[u�o�a�i�e�����]$") ? s : s2
}

# m�ly hangrend� nevszok, morfonetikus altern�nsok 
/[u�o�a�][bcdfghjklmnpqrstvwxyz]*$/  { print $1 "/U" magan("��","m�") \
	(RAG!="J"?"�":"") kulon($1,"/i", "/�/i") talan("/�", "�", "�") ka("k") }
# magas, ajakr�ses
/[i�e�][bcdfghjklmnpqrstvwxyz]*$/  {
    if (mely[$1]==1) { print $1 "/U" (RAG!="J"?"�":"") magan("��","m�") \
		kulon($1,"/i","/�/i") talan("/�", "�", "�") ka("k")}
    else { print $1 "/V" (RAG!="J"?"�":"") magan("��","n�") \
		kulon($1,"/j", "/�/j") talan("/�", "�", "�") ka("l")}
}
# magas, ajakkerek�t�ses
/[����][bcdfghjklmnpqrstvwxyz]*$/ { print $0 "/W" magan("��","�") \
	(RAG!="J"?"�":"") kulon($1,"/j", "/�/j") talan("/�", "�", "�") ka("l")}
