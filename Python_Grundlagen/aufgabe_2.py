import random
from collections import Counter


farbe = ["Kreuz", "Pik", "Herz", "Karo"]
wert = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Bube", "Dame", "König", "Ass"]



kartenblatt = []
zugstapel = []
ablagestapel = []
hand = []



def karten_austeilen():
    global kartenblatt
    global zugstapel
    global hand

    karten = [(sfarbe, swert) for swert in wert for sfarbe in farbe]
    kartenblatt=karten *2
    random.shuffle(kartenblatt)
    hand = kartenblatt[0:13]
    zugstapel = kartenblatt[13:]


karten_austeilen()


print("Aufgabe 2")




def ist_satz(hand, auswahl):
  left=[]
  right=[]

  for a, b in hand:
    right.append(a[:])

  var=[]
  for y in right:
    if y not in var:
      var.append(y)



  for a,b in hand:
    left.append(b[:])

  x=all(element==left[0] for element in left)



  if(x) and len(var)==len(right) and len(auswahl)>=3:
    return True
  return False

def ist_sequenz(hand, auswahl):
  left=[]
  right=[]

  for a, b in hand:
    right.append(b[:])

  var1=[]
  for j in right:
      if j not in var1:
          var1.append(j)

  for n, i in enumerate(right):


    if i == "2":
        right[n]=2
    elif i =="3":
        right[n]=3
    elif i == "4":
        right[n]=4
    elif i =="5":
        right[n]=5
    elif i == "6":
        right[n] = 6
    elif i =="7":
        right[n]=7
    elif i == "8":
        right[n] = 8
    elif i =="9":
        right[n]=9
    elif i == "10":
        right[n] = 10
    elif i =="Bube":
        right[n]=11
    elif i == "Dame":
        right[n] = 12
    elif i =="König":
        right[n]=13
    elif i == "Ass":
        right[n]=14

  if min(right)==2 and max(right)==14 and len(right)!=13:
      right.remove(max(right))
      right.append(1)

  for a,b in hand:
    left.append(a[:])

  x=all(element==left[0] for element in left)


  if(x) and max(right)-min(right)==len(right)-1 and len(var1)==len(right) and len(auswahl)>=3:

    return True
  return False



ausgewaeltekarten=[]
auslegen=[]
ausgelegt=[]
bereitsausgelegt=[]


def zaehle_punkte(liste):
    mycount=0
    acecount=0
    for i in liste:
        if (i[1]=="Bube" or i[1]=="Dame" or i[1]=="König" or i[1]=="10"):
            mycount +=10
        elif (i[1]!= "Ass"):
            mycount +=int(i[1])
        else:
            acecount +=11
    if (acecount ==11 and "König" in str(liste)):
        mycount +=11
    if (acecount ==11 and "König" not in str(liste)):
        mycount +=1
    elif (acecount==33):
        mycount +=33
    return mycount



while len(hand)>0:

    print("Bereits ausgelegt:",bereitsausgelegt)

    gezogenekarten=[]
    gezogenekarten.append(zugstapel.pop())
    for i in gezogenekarten:
        print("Es wurde gezogen:",i)
    hand.append(gezogenekarten.pop())
    print("Hand:")
    for i, karte in enumerate(hand):
        print("Karte %d : %s" % (i + 1, karte))
    while True:
            try:
                eingabe2=input("Soll ausgelegt werden (j/n)?")

            except:
                 break
            if eingabe2 == "j":

                nummer1=None

                auswahl1=len(hand)
                while True:
                    try:
                        nummer1=input("Welche Karte auslegen (1-%d, Ende zum Beenden der Auswahl)?" % auswahl1)
                        karte1 =hand[int(nummer1)-1]
                        auslegen.append(int(nummer1))
                        ausgewaeltekarten.append(karte1)
                        ausgelegt.append(karte1)

                    except:
                        if nummer1 =="Ende":

                            print("Ausgewählt:",auslegen)

                            if ist_satz(ausgewaeltekarten,auslegen)== True:
                                hand = list((Counter(hand) - Counter(ausgelegt)).elements())
                                print("Die Karten bilden einen Satz")
                                print("Die Karten bilden keine Sequenz")
                                print("Ausgelegt würden mit",(zaehle_punkte(ausgewaeltekarten)),"Punkten:" )
                                bereitsausgelegt.append(ausgewaeltekarten)

                            elif ist_sequenz(ausgewaeltekarten,auslegen)== True:
                                hand = list((Counter(hand) - Counter(ausgelegt)).elements())
                                print("Die Karten bilden keinen Satz")
                                print("Die Karten bilden eine Sequenz")
                                print("Ausgelegt würden mit",(zaehle_punkte(ausgewaeltekarten)),"Punkten:" )
                                bereitsausgelegt.append(ausgewaeltekarten)
                            else:
                                print("Die Karten bilden keinen Satz")
                                print("Die Karten bilden keinen Sequenz")
                                print("Ausgelegt würden mit",0,"Punkten:" )
                            print(ausgewaeltekarten)

                            ausgewaeltekarten=[]
                            auslegen=[]

                            print("Hand:")
                            for i, karte1 in enumerate(hand):
                                print("Karte %d : %s" % (i + 1, karte1))

                            break

            elif eingabe2=="n":
                auswahl1=len(hand)
                while True:
                    try:
                        nummer = int(input('welche Karte ablegen (1 - %d)?' % auswahl1))
                        karte = hand[nummer - 1]
                        break
                    except (ValueError, IndexError): \
                            print('Bitte nur eine Nummer von 1 bis 14!')
                ablagestapel.append(karte)
                hand.remove(karte)

                break

