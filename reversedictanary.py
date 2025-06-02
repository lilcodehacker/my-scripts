#!/usr/bin/env python3
from wonderwords import RandomWord
from dictionary.britannica import get_definitions
r = RandomWord()
points = 0
exit_conditions = (":q", "quit", "exit", "i'm done", "i quit")
while True:
    word = r.word()
    list = get_definitions(word)
    string = str(list)
    string = string.replace(word, "")
    print(f"{string}")
    while True:
        query = input("What is the Word?📚 ")
        if query in exit_conditions:
            print ("You quitter👎 the Word was: " + word + "!!")
            if points > 10:
                print (f"Your score was {points}!!👍")
            else:
                print (f"Your score was {points}👎")
            quit()
        else:
            if query == word:
                print (f"You Did it👍 the Word was: {word}!!")
                break
            else:
                print (f"WRONG!!!!")
    points = points+1
