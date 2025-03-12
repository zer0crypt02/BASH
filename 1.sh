#!/bin/bash

# 1.0: Merhaba! Yazdırma:
TEST="Selam!"
echo "Mesajınız: $TEST" # => "Mesaj: Hello!"

# 2.0: Değişkenler
NAME="Fatih"
echo ${NAME}    # => Fatih, Değişken
echo $NAME      # => Fatih, Değişken
echo '$NAME'    # => Fatih, String

NAME = "Fatih"   # => Hatalı(Değişken tanımlarken boşluk bırakma)

# 3.0: Bash Yorum Satırları:
: '
Bu bir yorum
satırı
dostuum!
'

# 4.0: Argümanlar:
$0 "Bu argüman, çalıştırılan betiğin adını döndürür."
# echo "Beiğin Adı: $0"
$1 "Birinci, ilk yazılan değişkeni temsil eder."
$2 "Ikinci yazılan değişkeni temsil eder."
$3 "Üçüncü yazılan değişkeni temsil eder."
$4 "Dördüncü yazılan değişkeni temsil eder."
$5 "Beşinci yazılan değişkeni temsil eder."
$6 "Altıncı yazılan değişkeni temsil eder."
$7 "Yedinci yazılan değişkeni temsil eder."
$8 "Sekizinci yazılan değişkeni temsil eder."
$9 "Dokuzuncu yazılan değişkeni temsil eder."
# NOT: $1'den $9'a kadar bu şekilde yazılabilir.
# -----------------------------------------------
# 10 ve 10'dan fazla tanımlanmış değişkenler için:
echo "Onuncu: ${10}" # Onuncu değişken için.
echo "Onbirinci: ${11}" # Onbirinci değişken için.
$# "Kodda kaç argüman verildiğini gösterir."
$$ "Çalışan betiğin işlem kimliğini (PID[Process ID]) döndürür."
$- "Shell’in hangi modlarda çalıştığını gösterir."
$_ "Önceki komuttaki son argümanı döndürür."


# 5.0: Fonksiyonlar:
func() {
    echo "BASH"
}

echo "Öğrendiğim Dil: $(func)"

# 6.0: Koşul Ifadeleri: 
# 6.1: Sayılar ile Koşul:
# [[ NUM -eq NUM ]] => Eşit
# [[ NUM -ne NUM ]] => Eşit Değil
# [[ NUM -ls NUM ]] => Daha Az
# [[ NUM -gt NUM ]] => Daha Büyük
# [[ NUM -ge NUM ]] => Büyük veya Eşit
# (( NUM < NUM )) => Daha az
# (( NUM <= NUM )) => Daha az veya Eşit
# (( NUM > NUM )) => Daha Büyük
# (( NUM >= NUM )) => Büyük veya Eşit

# 6.2: Stringler ile Koşul
# [[ -z STR ]] => Boş Dize Kontrolü.
# [[ -n STR ]] => Boş Olmayan Dize Kontrolü.
# [[ STR == STR ]] => Aynı, Eşit.
# [[ STR < STR ]] => Alfabetik Küçüklük Kontrolü (ASCII).
# [[ STR > STR ]] => Alfabetik Büyüklük Kontrolü (ASCII).
# [[ STR != STR ]] => Eşit Olmama Kontrolü.
# [[ STR =~ REGEXP ]] => Düzenli İfade (Regex) Kontrolü.
# NOT: =~ operatörü, bir string’in düzenli ifadeyle eşleşip eşleşmediğini kontrol eder.

# 6.3: Dosya Koşulları:
# [[ -e FILE ]] => Dosya veya dizin var mı?
# [[ -d FILE ]] => Bu bir Dizin mi?
# [[ -f FILE ]] => Normal bir dosya mı?(Eğer FILE normal bir dosyaysa true döner (dizin veya symlink değilse))
# [[ -h FILE ]] => Sembolik link (symlink) mi?
# [[ -s FILE ]] => Dosyanın boyutu > 0 byte mı?
# [[ -r FILE ]] => Dosya Okunabilir mi?
# [[ -w FILE ]] => Dosya Yazılabilir mi?
# [[ -x FILE ]] => Çalıştırılabilir mi?
# [[ f1 -nt f2 ]] => f1, f2'den daha yeni mi?(f1 = File1, f2 = File2)
# [[ f1 -ot f2 ]] => f1, f2'den daha eski mi?(f1 = File1, f2 = File2)
# [[ f1 -ef f2 ]] => f1 ve f2 aynı dosya mı?(f1 = File1, f2 = File2)

# Örn: 
# a=1
# b=3

# if [ "$a" -gt "$b" ]; then
#     echo  "$a daha büyük"
# elif [ "$a" -lt "$b" ]; then
#     echo "$b daha büyük"
# else
#     echo "$a ve $b eşittir"
# fi

# 7.0: Komut Çalıştırma:

# betiğin çalıştığı dosya yolunu yazdırma:
# echo "Ben burdayım: $(PWD)" 
# Betiğin çalıştığı dizindeki kalsör, dosyaları listeleme:
# echo "Listelenenler: $(LS)"
# Bir dosyanın içini okuma: 
# echo "Mesaj: $(CAT mesaj.txt)"
# Ping atma:
# ping -c 4 google.com => Google'a 4 tane ping atılacak.ölç

# 8.0: Bazı String işlemler1:

# name="Fatih"
# echo ${name}           # => Fatih
# echo ${name:0:2}       # => Fa
# echo ${name::2}        # => Fa
# echo ${name:(-1)}      # => h
# echo ${name:(-2)}      # => ih
# echo ${name:(-2):2}    # => ih

# length=2
# echo ${name:0:length}  # => Fa

# 9.0: Listeler: 

# meyveler=("Elma" "Karpuz" "Çilek")

# Tek Tek:
# echo "${meyveler[0]}" # => Ilk eleman alınır(Elma)
# echo "${meyveler[1]}" # => Ikinci eleman alınır(Karpuz)
# echo "${meyveler[2]}" # => Üçüncü eleman alınır(Çilek)
# echo "${meyveler[3]}" # => Boş

# Hepsi:
# echo "${meyveler[@]}" # => Ilk eleman alınır(Elma)
# echo "${meyveler[1]}" # => Ikinci eleman alınır(Karpuz)

# 10.0: For döngüzü: 

# for ((f = 0 ; f < 10 ; f++)); do
#     echo $f
# done 
# C++ dilindeki gibi.

# While döngüzü:

# Örn1: 1'den 5'e kadar sayma:
# num=1

# while [ $num -le 5 ]; do
#     echo "Sayı: $counter"
#     ((counter++))  # counter = counter + 1
# done

# Örn2: Sayı 5 olduğunda "Bitti" yazdırma:

# num=1

# while [ $num -le 5 ]; do
#     echo "Sayı: $num"
    
#     if [ $num -eq 5 ]; then
#         echo "Bitti!"
#     fi

#     ((num++))  # counter = counter + 1
# done

# 12.0: Input girişi: 

# Kullanıcıdan isim al
# read -p "Adınızı girin: " isim

# Girilen ismi ekrana yazdır
# echo "Merhaba, $isim!"

