#!/bin/bash
PUT(){ echo -en "\033[${1};${2}H";}
DRAW(){ echo -en "\033%";echo -en "\033(0";}
WRITE(){ echo -en "\033(B";}

tput civis
clear
tput setaf 2
DRAW
echo "lqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqk"
echo "x                                                           x"
echo "x                                                           x"
echo "x                                                           x"
echo "x                                                           x"
echo "x                                                           x"
echo "x                                                           x"
echo "x                                                           x"
echo "x                                                           x"
mqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqj"
WRITE

# Tampilkan Tulisan t3rmux (pastiin pkg figlet & lolcat terinstall)
PUT 4 5
if command -v figlet &> /dev/null && command -v lolcat &> /dev/null; then
    figlet -f shadow " t3rmux" | lolcat
else
    PUT 4 20
    echo -e "\e[1;32mt3rmux\e[0m"
fi

# Info Versi
PUT 9 40
echo -e "\e[35mBoot Script \e[33m2.0\e[0m"

# Balikin kursor ke bawah kotak
PUT 11 0
tput cnorm
