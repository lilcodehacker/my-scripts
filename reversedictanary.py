#!/usr/bin/env python3
from wonderwords import RandomWord
from dictionary.britannica import *
r = RandomWord()
points = 0
exit_conditions = (":q", "quit", "exit", "i'm done", "i quit")
while True:
    word = r.word()
    list = get_definitions(word)
    string = str(list)
    string = string.replace(word, "")
    print(f"{string}")
    for i in range(5):
        query = input("What is the Word?📚 ")
        if query in exit_conditions:
            print ("You quitter👎 the Word was: " + word + "!!")
            if points > 10:
                print (f"Your score was {points}!!👍")
            else:
                print (f"Your score was {points}👎")
            quit()
        if query == "hint" or query == "?":
            hint = get_entries(word)
            print(hint)
        else:
            if query == word:
                print (f"You Did it👍 the Word was: {word}!!")
                break
            else:
                if i == 4:
                    print (f"You LOSE!!!!👎")
                    if points > 10:
                        print (f"Your score was {points}!!👍")
                    else:
                        print (f"Your score was {points}👎")
                    quit()
                else:
                    print (f"WRONG!!!!👎")
    points = points+1
