#!/usr/bin/env python3
from random_word import RandomWords
from wordhoard import Definitions
r = RandomWords()
exit_conditions = (":q", "quit", "exit", "i'm done")
while True:
    word = r.get_random_word()
    definition = Definitions(search_string=word)
    definition_results = definition.find_definitions()
    print(f"📚{definition_results}📚")
    while True:
        query = input("What is the Word?📚 ")
        if query in exit_conditions:
            print ("You quitter👎 the Word was: " + word + "!!")
            quit()
        else:
            if query in word:
                print (f"You Did it👍 the Word was: {word}!!")
                break
            else:
                print (f"WRONG!!!!")
