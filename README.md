# Analiza izobraževanja  v Sloveniji po regijah

Repozitorij z gradivi pri predmetu APPR v študijskem letu 2018/19

* [![Shiny](http://mybinder.org/badge.svg)](http://beta.mybinder.org/v2/gh/Dzankomelli/APPR-2018-19/master?urlpath=shiny/APPR-2018-19/projekt.Rmd) Shiny
* [![RStudio](http://mybinder.org/badge.svg)](http://beta.mybinder.org/v2/gh/Dzankomelli/APPR-2018-19/master?urlpath=rstudio) Rstudio


## Tematika in analiza

V svojem projektu bom analiziral vključenost ljudi v posamezni izobraževalni program v Sloveniji, od vrtcev pa vse do doktorskega študija. Podatke o številu ljudi, ki obiskujejo posamezni izobraževalni program sem dobil na spletni strani SURS-a. 

V dobljenih tabelah imam podatke o številu ljudi, ki so vključeni v določeno vrsto izobraževanja, ki jih ločim po spolu, letu šolanja in regiji v kateri se šolajo. Prav tako sem pridobil podatke o diplomantih na 1000 ljudi v posameznih regijah. Podatke imam od leta 2007 naprej.

Analiziral bom kako BDP vpliva na vključenost otrok v predšolske programe in kako sta povezana Število diplomantov ter terciarno šolanje.

## Podatki

1. racka: (Osnovne šole)
- 1. stoplec: Leto
- 2. stoplec: Regija
- 3. stoplec: Spol
- 4. stoplec: Število

2. racka: (Brezposelni)
- 1. stoplec: Leto
- 1. stoplec: Regija
- 1. stoplec: Aktivnost
- 1. stoplec: Število

3. racka: (Diplomanti)
- 1. stoplec: Leto
- 2. stoplec: Regija
- 3. stoplec: Meritev
- 4. stoplec: Število

4. racka: (Predšolska vzgoja)
- 1. stoplec: Leto
- 2. stoplec: Regija
- 3. stoplec: Spol
- 4. stoplec: Število

5. TABELA: (Dijaki)
- 1. stoplec: Leto
- 2. stoplec: Regija
- 3. stoplec: Število


6. TABELA: (Terciarno izobraževanje)
- 1. stoplec: Leto
- 2. stoplec: Regija
- 3. stoplec: Vrsta izobraževanja
- 4. stolpec: Spol
- 5. stoplec: Število

7. TABELA: (Bruto proizvod na prebivalca)
- 1. stoplec: Leto
- 2. stoplec: Regija
- 3. stoplec: BDP



## Spletne povezave do tabel

Do tabel dostopam preko statističnega urada Republike Slovenije. Tabele lahko prenesem iz interneta na mnogo načino, med drugim CSV, HTML, XML, XLS itd. Tabelo o BDP per capita sem našel na eurostat-u vendar zaradi težav spletno stranjo ne nisem uspel prenesti.

https://pxweb.stat.si/pxweb/Dialog/varval.asp?ma=0309250S&ti=&path=../Database/Ekonomsko/03_nacionalni_racuni/30_03092_regionalni_rac/&lang=2

https://pxweb.stat.si/pxweb/Dialog/varval.asp?ma=0955072S&ti=&path=../Database/Dem_soc/09_izobrazevanje/08_terciarno_izobraz/01_09550_vpisani_splosno/&lang=2

https://pxweb.stat.si/pxweb/Dialog/varval.asp?ma=0953237S&ti=&path=../Database/Dem_soc/09_izobrazevanje/07_srednjesol_izobraz/01_09532_zac_sol_leta/&lang=2

https://pxweb.stat.si/pxweb/Dialog/varval.asp?ma=0952751S&ti=&path=../Database/Dem_soc/09_izobrazevanje/04_osnovnosol_izobraz/01_09527_zac_sol_leta/&lang=2

https://pxweb.stat.si/pxweb/Dialog/varval.asp?ma=0952532S&ti=&path=../Database/Dem_soc/09_izobrazevanje/03_predsol_vzgoja/01_09525_otroci_vrtci/&lang=2

https://pxweb.stat.si/pxweb/Dialog/varval.asp?ma=0955481S&ti=&path=../Database/Dem_soc/09_izobrazevanje/08_terciarno_izobraz/02_09554_diplomanti_splosno/&lang=2

https://pxweb.stat.si/pxweb/Dialog/varval.asp?ma=0775370S&ti=&path=../Database/Dem_soc/07_trg_dela/90_arhivski_podatki/03_akt_preb_let_arhiv/&lang=2

## Program

Glavni program in poročilo se nahajata v datoteki `projekt.Rmd`.
Ko ga prevedemo, se izvedejo programi, ki ustrezajo drugi, tretji in četrti fazi projekta:

* obdelava, uvoz in čiščenje podatkov: `uvoz/uvoz.r`
* analiza in vizualizacija podatkov: `vizualizacija/vizualizacija.r`
* napredna analiza podatkov: `analiza/analiza.r`

Vnaprej pripravljene funkcije se nahajajo v datotekah v mapi `lib/`.
Podatkovni viri so v mapi `podatki/`.
Zemljevidi v obliki SHP, ki jih program pobere,
se shranijo v mapo `../zemljevidi/` (torej izven mape projekta).

## Potrebni paketi za R

Za zagon tega vzorca je potrebno namestiti sledeče pakete za R:

* `knitr` - za izdelovanje poročila
* `rmarkdown` - za prevajanje poročila v obliki RMarkdown
* `shiny` - za prikaz spletnega vmesnika
* `DT` - za prikaz interaktivne tabele
* `rgdal` - za uvoz zemljevidov
* `rgeos` - za podporo zemljevidom
* `digest` - za zgoščevalne funkcije (uporabljajo se za shranjevanje zemljevidov)
* `readr` - za branje podatkov
* `rvest` - za pobiranje spletnih strani
* `reshape2` - za preoblikovanje podatkov v obliko *tidy data*
* `dplyr` - za delo s podatki
* `gsubfn` - za delo z nizi (čiščenje podatkov)
* `ggplot2` - za izrisovanje grafov
* `mosaic` - za pretvorbo zemljevidov v obliko za risanje z `ggplot2`
* `maptools` - za delo z zemljevidi
* `extrafont` - za pravilen prikaz šumnikov (neobvezno)

## Binder

Zgornje [povezave](#analiza-podatkov-s-programom-r-201819)
omogočajo poganjanje projekta na spletu z orodjem [Binder](https://mybinder.org/).
V ta namen je bila pripravljena slika za [Docker](https://www.docker.com/),
ki vsebuje večino paketov, ki jih boste potrebovali za svoj projekt.

Če se izkaže, da katerega od paketov, ki ji potrebujete, ni v sliki,
lahko za sprotno namestitev poskrbite tako,
da jih v datoteki [`install.R`](install.R) namestite z ukazom `install.packages`.
Te datoteke (ali ukaza `install.packages`) **ne vključujte** v svoj program -
gre samo za navodilo za Binder, katere pakete naj namesti pred poganjanjem vašega projekta.

Tako nameščanje paketov se bo izvedlo pred vsakim poganjanjem v Binderju.
Če se izkaže, da je to preveč zamudno,
lahko pripravite [lastno sliko](https://github.com/jaanos/APPR-docker) z želenimi paketi.

Če želite v Binderju delati z git,
v datoteki `gitconfig` nastavite svoje ime in priimek ter e-poštni naslov
(odkomentirajte vzorec in zamenjajte s svojimi podatki) -
ob naslednjem.zagonu bo mogoče delati commite.
Te podatke lahko nastavite tudi z `git config --global` v konzoli
(vendar bodo veljale le v trenutni seji).
