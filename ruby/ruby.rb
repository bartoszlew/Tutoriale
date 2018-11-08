https://pl.wikibooks.org/wiki/Ruby
https://launchschool.com/books/ruby/read/introduction

irb
ir


========================= Object Types =========================
http://www.apohllo.pl/dydaktyka/ruby/intro/typy-danych

Variables
  zmienna - lokalna
  @zmienna
  @@zmienna
  $zmienna - globalna

  #{} - zmienna wpakowana w ciag znakow

Integers
  Fixnum 1
  Bignum 312313131832719387198371

Floats
  10.0

Strings

Arrays
---
https://docs.ruby-lang.org/en/2.0.0/Array.html

  jakas_tablica = ["a","b","c","d"] - przypisuje wartosci do pierwszych czterech indeksow tablicy
  ary = Array.new    #=> [] - tworzy pusta tablice
  Array.new(3)       #=> [nil, nil, nil]
  jakas_tablica = [1, "2", 3.0, ["a", "b"], "pieseł""] - tablica moze zawierac rozne typy (tablice, ciag znakow, cyfry itd.)
  Array.new(3)
  jakas_tablica[0] = "cos" - przypisuje "cos" do pierwszego indeksu tablicy
  jakas_tablica << "cos" - dodaje cos na koniec tablicy
  jakas_tablica.clear - czysci tablice
  jakas_tablica[1] = nil - przypisuje pusta wartosc do drugiego indexu tablicy

Array methods - manipulowanie tablicami
   jakas_tablica.inspect - pokazuje cala tablices
                .sort
                .uniq
                .reverse
                .join(', ')
                .split(',')
                .uniq! - z wykrzynikiem na koncu zamienia tablice na zmienione wartosci
                .delete_at(2) - usuwa wartosc trzeciego indeksu
                .delete(4) - usuwa numery 4 z tablicy
                .push(4) - dodaje 4 na koniec tablicy (to samo co << 4)
                .pop - usuwa ostatnia pozycje  z tablicy
                .shift - wywala pierwszy index z tablicy
                .unshift(9) - dodaje 9 na poczatek tablicy

Hashes (Tablice asocjacyjne) - taki key-value (albo inaczej nieuporzadkowana tablica, gdzie do indexu odwolujemy sie jakims obiektem)
  jakis_hash = { 'imie' => 'zdzislaw', 'nazwisko' => 'lewinski', 'kolor_oczu' => 'piwne'}
  jakis_hash.keys - zwraca wszystkie klucze
            .values - zwraca zawartosci
            .size
            .to_a (metoda to array- zamienia przedzial na tablice)
            .lenght
            .clear - czysci hash ( tak samo jak jakis_hash = {} )

Symbols //doczytac
  :nazwa_symbolu
  To co charakteryzuje obiekty typu symbolicznego to jednoznaczność ich tożsamości – nie mogą występować dwa symbole, które wyglądałyby identycznie,
  a posiadały inną wartość.
  W kontekście Ruby oznacza to, że niezależnie od tego co w określonym kontekście oznacza jakaś nazwa (stałą, zmienną czy nazwę metody),
  symbol wygenerowany na jej podstawie jest zawsze ten sam (o ile nazwa jest identyczna).
  A symbol is a label used to identify a piece of data.

  mozna to sprawdzic:
  :jakis_symbok.object_id - pokazuje ID objektu, dla symbolu bedzie zawsze takie same

Booleans
  True,False

Ranges
  Inclusive range -> 1..10 daje zakres włącznie, czli 1,2,3...10
  Exclusive range -? 1...10 daje zakres wyłączając ostsatnią wartosc, czyli 1,2,3..9

Constants (stałe klasowe)
  A Ruby constant is like a variable, except that its value is supposed to remain constant for the duration of the program.
  The Ruby interpreter does not actually enforce the constancy of constants, but it does issue a warning if a program changes the value of a constant
  Nazwa stałej zaczyna się od dużej litery. Stałej nie powinno przypisywać się wartości więcej niż jeden raz. W bieżącej implementacji Rubiego
  ponowne przypisanie wartości do stałej generuje ostrzeżenie, ale nie błąd.
  Stałe mogą być definiowane wewnątrz klas, ale w przeciwieństwie do zmiennych instancji lub zmiennych klasowych, są one dostępne na zewnątrz klasy.


Comparison & Logic Operators
---
== rowny
<, >, <=, >= - standardowo
! Not
!=  Not equal
&&  and
||  or


========================= Control structures =========================

Conditionals
----------------

if, else,  elsif
---
if warunek
  ...
elsif warunek
  ...
else
  ...
end


unless
---
# to samo co -> if !warunek
unless warunek
  ...
end


case
---
when warunek
  ...
when warunek
  ...
else
  ...
end


ternary operators (skróty dla if, else. uzywane do bardzo prostych instrukcji warunkowych)
---
warunek ? kod1 : kod2 - jesli warunek jest True, wykonaj kod1, jesli jest False, wykonaj kod2
  np. puts x == 1 ? "one" : "not one" - jesli x rowna sie 1 to wypisz "one", jesli nie jest rowne 1 to wypisz "not one"

or/or-equals
---
x = y||z - jesli y ma wartosc to przypisz y, jesli nie to przypisz z
x||=y - jesli x ma przypisana wartosc, to nic nie rob, jesl nie ma to przypisz x = y



Loops
--------
loop  do
  ...
end

kontrola pętli:
break - terminate the whole Loops
next - jump to next loop
redo - redo this loop
retry - start the whole loop over

---

while warunek
  ...
end

until condition
  ...
end

proste wyrazenia while,until mozemy wstawiac w uproszczony sposob w jednej lini,np.
x = 0
puts x += 2 while x < 100

y = 3245
puts y /= 2 until y <= 1


Iterators
------------
https://pl.wikibooks.org/wiki/Ruby/Iteratory

Iterators are methods that naturally loop over a given set of data and allow you to operate on each element in the collection. Theys work a lot like loops.
Uzywane dla znanego zestawu danych.
Kontrola pętli działa troche inaczej niż w 'Loops'. Retry go back to begining of the set. Redo

Integers/floats: times, upto, downto, steps
Range: each, step
String: each, each_line, each_byte
Array: each, each_index, each_with_index
Jest tego sporo wiecej.

użycie, np.:

imie = ['Bob', 'Joe', 'Steve', 'Janice', 'Susan', 'Helen']
imie.each do |imie|
  puts "#{imie}"
end
---

5.times do
  puts "hello"
end
---

1.upto(5) { puts "Hello" }




========================= Code Blocks =========================
#standardowo:
5.times do
  puts "Hello"
end

#szybka wersja:
5.times { puts "Hello" }

#wersja z iteratorem
1.upto(5) do |i|
  puts "Hello" + i.to_s  #to_s = to string -> zamienia liczby na string
end

#szybka wersja:
1.upto(5) {|i| puts "Hello" + i.to_s }

czyli blok kodu: puts "Hello" ; { puts "Hello" } ; puts "Hello" + i.to_s ; {|i| puts "Hello" + i.to_s }


find
------------
https://docs.ruby-lang.org/en/2.5.0/Enumerable.html

find/detect - znajduje tylko pierwsza pasujaca wartosc albo nil, => zwraca objekt albo nil
find_all/select - znajduje wszystkie pasujace wartosci, => zwraca tabele
any? - zwraca true kiedy przynamniej jest jedna wartosc, => zwraca true/false
all? - zwraca true kiedy wszystkie wartosci pasuja do wzorca, => zwraca true/false
delete_if - znajduje wszytkie pasujace wartosci i je usuwa, => zwraca tabele
np.
(1..10).find { |i| i == 5}
(1..10).detect { |i| (1..10).include?(i * 3)}


merge (metoda tylko dla hashy)
------------------------------
h1.merge(h2) - scala tablice h1 i h2, jesli w obu jest ten sam klucz to brana jest wartosc z drugiej tablicy.
h1.merge(h2) { |k,o,n| puts k ; puts o; puts n } - zmienne k,o,n biora wartosc konfliktowych kluczy  //dlczego?
  k - klucze
  o - wartosc z pierwszego hasha
  n - wartosc z drugiego hasha


collect/map
-------------
(najlepiej dziala z hashami, tablicami, zakresami)
collect - iteruje kazda wartosc, cos z nia robi i zwraca tabele z nowymi wartosciami
          collect zawsze zwraca taka sama ilosc zmiennych jaka dostal na wejsciu i zawsze zwraca tablice.
          collect! - z wykrzyknikiem nadpisuje tabele nowymi wartosciami
  np. ["jablko", "grudzka", "banan"].collect { |i| i.capitalize }
        daje => ["Jablko", "Grudzka", "Banan"]
      (1..20).collect { |num| num * 20 }
        daje => [20, 40, 60, 80, 100, 120, 140, 160, 180, 200, 220, 240, 260, 280, 300, 320, 340, 360, 380, 400]

sort
-----
https://stackoverflow.com/questions/827649/what-is-the-ruby-spaceship-operator
<=> porownanie - porownujemy 2 wartosci w1 <=> w2; zwraca -1 kiedy jesli jedna wartosc jest mniejsza od drugiej, 0 jesli sa równe,
    1 jesli wartosc1 jest wieksza od drugiej. Przydatne do sortoania tablicy.
    Z wykrzyknikiem ! nadpisuje tablice nowymi wartosciami.

inject
---------
Przekazuje do bloku każdy element kolekcji. Posiada dodatkowo pamięć, która początkowo jest równa pierwszemu elementowi (lub wartości podanej jako parametr).
Po zakończeniu każdej iteracji pamięć jest aktualizowana do wartości zwracanej przez blok.



========================= Methods, Funkcje  =========================
Metody to po prostu funkcje.

def nazwa_metody(zmienna1="domyslny_argument_zmiennej1", zmienna2="domyslny_argument_zmiennej2")
  puts "hello #{zmienna1} #{zmienna2}"
end


return value - zwracana wartoscia metody jest ostatnia wartosc z metody
  return - podaje co ma zwracac metoda i jednoczesnie konczy funkcje
