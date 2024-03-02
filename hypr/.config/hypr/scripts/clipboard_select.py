#!/usr/bin/python3
import sys
from subprocess import Popen, PIPE


def cliphist_get_text():
    p = Popen(["cliphist", "list"], stdout=PIPE, text=True)
    return p.communicate()[0][:-1]


def cliphist_list(text):
    entries = {}
    inputs = ""
    for line in text.split("\n"):
        t = line.split("\t")
        if len(t) < 2:
            quit(2)
        id, text = t
        entries[text] = id
        inputs = inputs + "\n" + text

    return entries, inputs


def main():
    cliphist_text = cliphist_get_text()
    entries, inputs = cliphist_list(cliphist_text)

    p = Popen(["bemenu", "-i", "-l", "10", "-c", "-W", "0.8", "-p", ""], stdout=PIPE, stdin=PIPE, stderr=PIPE, text=True)
    selected_text = p.communicate(input=inputs)[0][:-1]
    
    if not selected_text in entries.keys():
        quit(1)
    print(entries[selected_text] + "\t" + selected_text, end='')
    quit(0)


if __name__ == "__main__":
    main()
