#!/usr/bin/env python3

import os
import subprocess
import sys
from pathlib import Path

import pyfiglet

# Directory where this Python script is located
BASE_DIR = Path(__file__).resolve().parent

AUTOSTART_SCRIPT = BASE_DIR / "autostart.sh"
KEYBINDS_SCRIPT = BASE_DIR / "show_keybinds.sh"


def clear_screen():
    os.system("clear")


def print_banner():
    banner = pyfiglet.figlet_format("Mera Arch", font="slant")
    print(banner)


def pause():
    input("\nPress Enter to continue...")


def run_script(script):
    """Run a shell script located next to this Python program."""

    subprocess.run(
            ["bash", str(script)],
            check=False,
        )


def wallpaper_menu():
    while True:
        clear_screen()
        print_banner()

        print("Wallpaper")
        print("────────────")
        print("1. Choose wallpaper")
        print("2. Back")

        choice = input("\nSelect an option: ").strip()

        if choice == "1":
            run_script(AUTOSTART_SCRIPT)
            pause()

        elif choice == "2":
            return

        else:
            print("\nInvalid option.")
            pause()


def keybindings_menu():
    clear_screen()
    print_banner()

    print("Keybindings")
    print("────────────")

    run_script(KEYBINDS_SCRIPT)

    pause()


def main_menu():
    while True:
        clear_screen()
        print_banner()

        print("Main Menu")
        print("────────────")
        print("1. Change Wallpaper")
        print("2. Keybindings")
        print("3. Exit")

        choice = input("\nSelect an option: ").strip()

        if choice == "1":
            wallpaper_menu()

        elif choice == "2":
            keybindings_menu()

        elif choice == "3":
            clear_screen()
            print("Exiting")
            sys
