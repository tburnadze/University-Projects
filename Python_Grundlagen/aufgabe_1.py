import random
from collections import Counter
import itertools

farbe = ["Kreuz", "Pik", "Herz", "Karo"]
wert = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Bube", "Dame", "König", "Ass"]



kartenblatt = []
zugstapel = []
ablagestapel = []
hand1 = []
hand2 = []
hand3 = []


def karten_austeilen():
    global kartenblatt
    global zugstapel
    global hand1
    global hand2
    global hand3
    karten = [(sfarbe, swert) for swert in wert for sfarbe in farbe]
    kartenblatt=karten *2
    random.shuffle(kartenblatt)
    spielerkarten=kartenblatt[0:40]
    hand1 = spielerkarten[0::3]
    hand2 = spielerkarten[1::3]
    hand3 = spielerkarten[2::3]
    zugstapel = kartenblatt[40:]


karten_austeilen()


print("Aufgabe 1, Teil 1:""\n" "Ablagestapel =", ablagestapel, "\n" "Hand 1 =",
      hand1, "\n" "Hand 2 =", hand2, "\n" "Hand 3 =", hand3, "\n" "Zugstapel =", zugstapel)



print("Aufgabe 1, Teil 2:")
print("Hand 1:")


def karte_ablegen(hand, auswahl):

    karte = hand[auswahl - 1]
    ablagestapel.append(karte)
    hand.remove(karte)



for i, karte in enumerate(hand1):
    print("Karte %d : %s" % (i + 1, karte))
while True:
    try:
        nummer =(len(hand1))
        auswahl = int(input('welche Karte ablegen (1 - %d)?' % nummer))


        break
    except (ValueError, IndexError):
        print("Bitte nur eine Nummer von 1 bis 14!")
karte_ablegen(hand1,auswahl)
print('Ablagestapel:', ablagestapel)
print("Hand 1:", hand1)


print("Aufgabe 1, Teil 3:")

def karte_ziehen(hand, quelle):
    hand.append(quelle.pop())




print('Ablagestapel:', ablagestapel)
print("Hand 2:", hand2)

while True:
    try:
        eingabe = input("Karte vom Ablege- oder Zugstapel nehmen (A/Z)?")
    except:
        continue
    if eingabe == "Z":
        print("Hand 2:")
        karte_ziehen(hand2, zugstapel)
        for i, karte in enumerate(hand2):
            print("Karte %d : %s" % (i + 1, karte))
        while True:
            try:
                nummer =(len(hand2))
                auswahl = int(input('welche Karte ablegen (1 - %d)?' % nummer))
                break
            except (ValueError, IndexError):
                print("Bitte nur eine Nummer von 1 bis 14!")
        karte_ablegen(hand2,auswahl)
        print('Ablagestapel:', ablagestapel)
        print("Hand 2:", hand2)

    elif eingabe == "A":
        print("Hand 2:")
        karte_ziehen(hand2, ablagestapel)
        for i, karte in enumerate(hand2):
            print("Karte %d : %s" % (i + 1, karte))
        while True:
            try:
                nummer =(len(hand2))
                auswahl = int(input('welche Karte ablegen (1 - %d)?' % nummer))
                break
            except (ValueError, IndexError):
                print("Bitte nur eine Nummer von 1 bis 14!")
        karte_ablegen(hand2,auswahl)
        print('Ablagestapel:', ablagestapel)
        print("Hand 2:", hand2)


    else:print("Bitte nur A oder Z eingeben!")
    break

print("Aufgabe 1, Teil 4:")

print("Oben auf dem Ablagestapel:", ablagestapel[-1])
print("Hand 3:",hand3)

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



while True:
    try:
        eingabe = input("Karte vom Ablege- oder Zugstapel nehmen (A/Z)?")
    except:
        continue
    if eingabe == "Z":
        print("Hand 3:")
        karte_ziehen(hand3, zugstapel)
        for i, karte in enumerate(hand3):
            print("Karte %d : %s" % (i + 1, karte))


        while True:
            try:
                eingabe2=input("Soll ausgelegt werden (j/n)?")

            except:
                 break
            if eingabe2 == "j":
                ausgewaeltekarten=[]
                auslegen=[]
                ausgelegt=[]
                nummer1=None

                auswahl1=len(hand3)
                while True:
                    try:

                        nummer1=input("Welche Karte auslegen (1-%d, Ende zum Beenden der Auswahl)?" % auswahl1)
                        karte1 =hand3[int(nummer1)-1]
                        auslegen.append(int(nummer1))
                        ausgewaeltekarten.append(karte1)
                        ausgelegt.append(karte1)
                    except:
                        if nummer1 =="Ende":

                            print("Ausgewählt:",auslegen)

                            if ist_satz(ausgewaeltekarten,auslegen)== True:
                                hand3 = list((Counter(hand3) - Counter(ausgelegt)).elements())
                                print("Die Karten bilden einen Satz")
                                print("Die Karten bilden keine Sequenz")

                            elif ist_sequenz(ausgewaeltekarten,auslegen)== True:
                                hand3 = list((Counter(hand3) - Counter(ausgelegt)).elements())
                                print("Die Karten bilden keinen Satz")
                                print("Die Karten bilden eine Sequenz")
                            else:
                                print("Die Karten bilden keinen Satz")
                                print("Die Karten bilden keinen Sequenz")
                            print("Ausgelegt wurden:",ausgewaeltekarten)
                            print("Hand 3:")
                            for i, karte1 in enumerate(hand3):
                                print("Karte %d : %s" % (i + 1, karte1))
                                ausgewaeltekarten.clear()
                                auslegen.clear()
                            break

            elif eingabe2=="n":
                auswahl1=len(hand3)
                while True:
                    try:
                        nummer = int(input('welche Karte ablegen (1 - %d)?' % auswahl1))
                        karte = hand3[nummer - 1]
                        break
                    except (ValueError, IndexError): \
                            print('Bitte nur eine Nummer von 1 bis 14!')
                ablagestapel.append(karte)
                hand3.remove(karte)
                print('Ablagestapel:', ablagestapel)
                print("Hand 3:", hand3)
                break

    elif eingabe == "A":
        print("Hand 3:")
        karte_ziehen(hand3, ablagestapel)
        for i, karte in enumerate(hand3):
            print("Karte %d : %s" % (i + 1, karte))

        while True:
            try:
                eingabe2=input("Soll ausgelegt werden (j/n)?")

            except:
                 break
            if eingabe2 == "j":
                ausgewaeltekarten=[]
                auslegen=[]
                ausgelegt=[]
                nummer1=None

                auswahl1=len(hand3)
                while True:
                    try:

                        nummer1=input("Welche Karte auslegen (1-%d, Ende zum Beenden der Auswahl)?" % auswahl1)
                        karte1 =hand3[int(nummer1)-1]
                        auslegen.append(int(nummer1))
                        ausgewaeltekarten.append(karte1)
                        ausgelegt.append(karte1)
                    except:
                        if nummer1 =="Ende":

                            print("Ausgewählt:",auslegen)


                            if ist_satz(ausgewaeltekarten,auslegen)== True:
                                hand3 = list((Counter(hand3) - Counter(ausgelegt)).elements())
                                print("Die Karten bilden einen Satz")
                                print("Die Karten bilden keine Sequenz")


                            elif ist_sequenz(ausgewaeltekarten,auslegen)== True:
                                hand3 = list((Counter(hand3) - Counter(ausgelegt)).elements())
                                print("Die Karten bilden keinen Satz")
                                print("Die Karten bilden eine Sequenz")
                            else:
                                print("Die Karten bilden keinen Satz")
                                print("Die Karten bilden keinen Sequenz")
                            print("Ausgelegt wurden:",ausgewaeltekarten)
                            print("Hand 3:")
                            for i, karte1 in enumerate(hand3):
                                print("Karte %d : %s" % (i + 1, karte1))
                                ausgewaeltekarten.clear()
                                auslegen.clear()
                            break


            elif eingabe2=="n":
                auswahl1=len(hand3)
                while True:
                    try:
                        nummer = int(input('welche Karte ablegen (1 - %d)?' % auswahl1))
                        karte = hand3[nummer - 1]
                        break
                    except (ValueError, IndexError): \
                            print('Bitte nur eine Nummer von 1 bis 14!')
                ablagestapel.append(karte)
                hand3.remove(karte)
                print('Ablagestapel:', ablagestapel)
                print("Hand 3:", hand3)
                break

    else:print("Bitte nur A oder Z eingeben!")
    break
























