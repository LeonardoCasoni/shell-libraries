#!/bin/bash
# Functions for interactive menu made with dialog
# Author: Leonardo Casoni
# Made:________15/11/2019

DialogMenuLogin () {
# Visualizza il menu di accesso con massimo 8 scelte visto che la 9 sara sempre Exit
# Variabili attese 1=numeroscelte 2=Scelta1 3=Scelta2 etc...
# Output atteso 1=Crea la variabile SCELTA
TMPFILE=tmpfile.txt
COUNT=1;
VAR1="Exit"; VAR2="Exit"; VAR3="Exit"; VAR4="Exit"; VAR5="Exit"; VAR6="Exit"; VAR7="Exit"; VAR8="Exit"; VAR9="Exit";
TESTFILE=test.txt
rm -f "$TESTFILE"
while [ "$COUNT" -lt "$1" ]
do
VAR="VAR$COUNT"
COUNT=$[ $COUNT + 1 ]
echo "$VAR=\$$COUNT" >> "$TESTFILE"
done
. "$TESTFILE"
dialog --nocancel --title "[ M E N U ]" --menu "Usa le frecce SU/GIU per selezionare o digita il numero e premi Enter" 15 45 $1 1 "$VAR1" 2 "$VAR2" 3 "$VAR3" 4 "$VAR4" 5 "$VAR5" 6 "$VAR6" 7 "$VAR7" 8 "$VAR8" 9 "$VAR9" 2>$TMPFILE
SCELTA=$(cat $TMPFILE); rm -f $TMPFILE
rm -f "$TESTFILE"
}

DialogInsertName () {
# Chiede nome.cognome per accesso
# Output atteso 1=Crea la variabile NOME
TMPFILE=/usr/tmp/tmpfile.txt
dialog --nocancel --title "Inserire nome.cognome" --inputbox "Digita nome.cognome tutto in minuscolo" "15" "45" 2>"$TMPFILE"
NOME=$(cat $TMPFILE)
rm -f "$TMPFILE"
}

DialogInsertPassword () {
# Inserimento password
# Output atteso 1=Crea la variabile PASSNOTA
TMPFILE=tmpfile.txt
dialog --nocancel --title "Digita la password di accesso" --passwordbox "Digita la password di accesso" "15" "45" 2>"$TMPFILE"
PASSNOTA=$(cat "$TMPFILE")
PASSNOTA=$(echo "$PASSNOTA" | openssl enc -base64)
rm -f "$TMPFILE"
}

DialogInfoBox () {
# Invio informazioni a video
# Variabili attese 1="messaggio da visualizzare"
dialog --title "MESSAGGIO" --infobox "$1" "15" "45"
sleep 1
}
