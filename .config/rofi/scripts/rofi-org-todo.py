#!/bin/python3
import sys
import os
from datetime import date
from rofi import Rofi

# path to where you want your TODOs to be inserted to
inbox_file = "/home/paul/Documents/braindump/inbox.org"
r = Rofi()

def todo_to_inbox():
    todo = r.text_entry("TODO",
    message="Type full text of your TODO, add tags and it will be added to your inbox")
    if todo is not None:
        f = open(inbox_file, "a")
        f.write("\n* TODO ")
        f.write(todo + "\n")
        f.write(":PROPERTIES:\n")
        f.write(":CREATED: " + "[" + date.today().strftime("%Y-%m-%d %a").rstrip() + "]\n")
        f.write(":END:\n\n")
        f.close()

todo_to_inbox()
