


note ****************************************************************
note Befehle zur Generierung der Friesach-Datenbasis
note mit folgender Struktur:
note
note
note DOK(ument)$Id(entifikation)/
note |          Datum1(kleio-frueh)/
note |          Datum2(kleio-spaet)/
note |          Datum3(Edition.)/
note |          Datum4(quell.)/
note |          Ort1 (der Handlung oder Ausstellung, Kennung)/
note |          Ort2 (der Handlung oder Ausstellung, Klartext)/
note |          freigehalten/
note |          Region(der Handlung oder Ausstellung)
note |
note |---S(schreiber)$Schr(eiber)n(ennung)/
note |          Inst(itution)/
note |          Schr(eiber)f(eststellung)
note |
note |---V(erfasser)$Verf(asser)n(ennung)/
note |          Inst(itution)/
note |          Verf(asser)f(eststellung)
note |
note |---K(opfregest)$Kopfregest
note |
note |-------REG(Rechtsgeschaeft)$Subregest
note     |
note     |---F(undort)$Edition/Nummer/Dok(ument)seiten/Zit(at)seiten
note     |
note     |---G(eber)$Name/Titel/Ort1/Ort2/frei/Region
note     |
note     |---E(mpfÑnger)$Name/Titel/Ort1/Ort2/frei/Region
note     |
note     |---H(andlung)$Typ/G(e)g(en)st(an)d/Ort1/Ort2/frei/Region
note     |
note     |---W(aehrung)$Waehrung/
note     |           moneta/
note     |
note     |---O(bere Rechnungseinheit)$Anzahl/
note     |           OEinheit/
note     |           OBestimm(ung) (numerata o.dgl.)
note     |
note     |---Z(wischen-Rechnungseinheit)$Anzahl/
note     |           ZEinheit/
note     |           ZBestimm(ung) (longus o.dgl.)
note     |
note     |---M(Ånz-Einheit)$Anzahl/
note     |           MEinheit/
note     |           MBestimm(ung) (ev. "Minusbetrag")
note     |           Zeit
note     |
note     |---A(equivalent)$Betrag/Aequiv(alent)
note     |
note     |---Q(uellenstelle)$Zitat
note     |
note     |---B(emerkungen)$Bemerk(ungen)
note
note ****************************************************************

options lines=0

note *** Anlage des logischen Objekts "Datum" ***
item name=datum1;usage=date
type name=numbers;first=year;second=month
exit name=datum1

note *** Anlage des logischen Objekts "Datum" ***
item name=datum2;usage=date
type name=numbers;first=year;second=month
exit name=datum2

note *** Anlage des logischen Objekts "Funktion" ***
item name=funktion;usage=category
text signs=no
signs signs=A;write="Ausst."
signs signs=B;write="Beteil."
signs signs=E;write="Empf."
signs signs=U;write="Urbar"
exit name=funktion

note *** Anlage des logischen Objekts "Waehrung" ***
item name=waehrung;usage=category
text signs=no
signs signs=A;write="Aquileia"
signs signs=B;write="Bayern"
signs signs=F;write="Friesach"
signs signs=L;write="Laufen"
signs signs=R;write="Regensburg"
signs signs=S;write="St. Veit"
signs signs=V;write="Venedig"
signs signs=X;write="Fries.?"
exit name=waehrung

note *** Anlage des logischen Objekts "Zeit" ***
item name=zeit;usage=category
text signs=no
signs signs=A;write="Abgeschl."
signs signs=X;write="Unklar"
signs signs=Z;write="ZukÅnftig"
exit name=zeit

note *** Angabe der legalen Zeitgrenzen ***
date minimum="1.1.1000" maximum="31.12.1300"

note *** Eigentliche Definition des Datenmodells ***
database name=denar3;
        first=dok;
        overwrite=yes
part name=dok;
        part=s,v,k,reg;
        position=id,datum1,datum2,datum3,datum4,ort1,ort2,frei,region;
        guaranteed=id,datum1,datum2,datum3,ort1,ort2
part name=s;
        position=schrn,inst,schrf;
        guaranteed=schrn,inst,schrf
part name=v;
        position=verfn,inst,verff;
        guaranteed=verfn,inst,verff
part name=k;
        position=kopfregest;
        guaranteed=kopfregest
part name=reg;
        part=f,g,e,h,w,,o,z,m,a,q,b;
        position=subregest;
        guaranteed=subregest
part name=f;
        position=edition,nummer,dokseiten,zitseiten;
        guaranteed=edition,nummer,dokseiten,zitseiten
part name=g;
        position=name,titel,ort1,ort2,frei,region;
        guaranteed=titel,ort1,ort2
part name=e;
        position=name,titel,ort1,ort2,frei,region;
        guaranteed=titel,ort1,ort2
part name=h;
        position=typ,ggstd,ort1,ort2,frei,region;
        guaranteed=typ,ggstd,ort1,ort2
part name=w;
        position=waehrung,moneta;
        guaranteed=waehrung,moneta
part name=o;
        position=anzahl,oeinheit,obestimm;
        guaranteed=anzahl,oeinheit,obestimm
part name=z;
        position=anzahl,zeinheit,zbestimm;
        guaranteed=anzahl,zeinheit,zbestimm
part name=m;
        position=anzahl,meinheit,mbestimm,zeit;
        guaranteed=anzahl,meinheit,mbestimm,zeit
part name=a;
        position=betrag,aequiv
part name=q;
        position=zitat;
        guaranteed=zitat
part name=b;
        position=bemerk
element name=id;
element name=datum1;
        type=date;
        date=datum1
element name=datum2;
        type=date;
        date=datum2
element name=datum3,datum4,ort,region;
element name=schrn,inst,schrf;
element name=verfn,inst,verff;
element name=kopfregest;
element name=subregest;
element name=edition,nummer,dokseiten,zitseiten;
element name=name,titel,ort,region;
element name=typ,ggstd,ort,region;
element name=waehrung;
element name=moneta;
element name=anzahl,oeinheit,obestimm
element name=anzahl,zeinheit,zbestimm
element name=anzahl,meinheit,mbestimm
element name=zeit;
        type=category;
        category=zeit
element name=betrag,aequiv;
element name=zitat,bemerk;
exit name=denar3
stop



