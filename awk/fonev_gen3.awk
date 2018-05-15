#
# morfonetikus altern�ns f�nevek ragoz�si csoportba sorol�sa
#
# improdukt�v toldal�kol�s
#
# k�ls� v�ltoz�: kulon_e (tulajdonnevek eset�n kikapcs. sz��sszet�tel,
# ha kulon_e==1)
#
BEGIN { 
    while ((getline var < "fonev_kulon.1") > 0) { kulonszo[var]=1; }
    while ((getline var < "fonev_osszetett.1") > 0) { osszetett[var]=1; }
}

function kulon() {
    s=""
    if (kulon_e==1) return ""
    if (osszetett[$1]==1) s="/y��"; else s = "/��/�"
    if (RAG == "J") {
        if (osszetett[$1]==1) s = s "/�/��"
        else s = s "/�"
    }
    if (kulonszo[$1]!=1) {
	return s "/x"
#	return "/Y" # MYSPELL
    } else {
	return ""    
    }
}

{ print "[nounmorfo]" $1 "/I/�/�/�" RAG kulon(); }
