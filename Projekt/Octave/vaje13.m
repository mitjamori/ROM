## 1. naloga %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

##uvozimo tabelo podatkov
podatki = dlmread('kolokviji.csv', ',')

##izraèunamo vrstiène vsote
vsota = sum(podatki, 2)
##izraèunamo vrstièna povpreèja
povprecje = round(mean(podatki, 2))

##iz povpreèij izraèunamo ocene (definiramo funkcijo)
ocene = izracunaj_oceno(povprecje)

##stolpec s številkami od 1 do doline tabele ocen
zaporedje = (1: length(ocene))'
##sestavimo ustrezno matriko iz prvotnih in izraèunanih tabel
rezultat = [zaporedje, podatki, vsota, povprecje, ocene]

##matriko rezultat zapišemo v dadtoteko rezultat.csv, v kateri so podatki loèeni z ,  
dlmwrite("rezultat.csv", rezultat, ',')


##preverimo podatkovne tipe
disp('Tip rezultata')
class(rezultat)

disp('Tipi stolpcev')
class(podatki)
class(vsota)
class(povprecje)
class(zaporedje)
class(ocene)


## 2. naloga %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

##narišemo histogram ocen
hist(ocene); %pove nam razporeditev ocen


## namestimo dodatne pakete:
pkg install -forge io
pkg install -forge statistics
pkg load statistics

## alternativa 1
frekvence = tabulate(ocene)

## alternativa 2
izracunaj = @(n) length(ocene(ocene==n))
arrayfun(izracunaj, 6:10) % kot map

##tip rezultata frekvence
class(frekvence)


## stolpièni diagram - podoben histogramu
bar(6:10, frekvence(6:10, 3))


##narišemo grafikon
slika = figure()
bar(6:10, frekvence(6:10, 3), 'facecolor', 'r', 'edgecolor', 'b')
title('Porazdelitev ocen kolokvija')
xlabel ("Ocene");
ylabel ("Stevilo studentov");
text (10, 10, "Bravo!");
print(slika, 'slika.pdf')


## 3. naloga %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N = narascajoca(4)


## 4. naloga %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

M = rand(4)
cas1_zacetek = tic; stevilo_sedel(A); cas1_konec = toc;
cas2_zacetek = tic; stevilo_sedel2(A); cas2_konec = cas2 = toc;

razloka_casov = (cas1_konec - cas1_zacetek) - (cas2_konec - cas2_zacetek)
## èe je razlika > 0, je hitrejša stevilo_sedel,
## èe je < 0, je hitrejša stevilo_sedel2,
## sicer sta enako hitri


## 5. naloga %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A = rand(2)
B = rotacija(A)
