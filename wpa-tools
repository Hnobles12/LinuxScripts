#!/usr/bin/python3

import os, json, signal, sys


def loadPath():
    with open('wpa_tools_path.json', "r") as pf:
        WPA_PATH = "/etc/wpa_supplicant/wpa_supplicant.conf"
        path = json.load(pf)
        pf.close()
    return path

def addNetwork():
    conf_path = loadPath()
    try:
        f = open(conf_path, "a")
    except RuntimeError as err:
        print("Error encountered loading configuration file.\nCheck that path is correct.")
        print("More info: {}".format(err))

    ssid = input("Enter SSID: ")
    psk = input("Enter password (if none, leave blank): ")

    ssid_line = "   ssid=\"{}\"\n".format(ssid)

    if psk == '':
        pass_line = "   key_mgmt=NONE\n"
    else:
        pass_line = "   psk=\"{}\"\n".format(psk)

    f.write("network={\n")
    f.write(ssid_line)
    f.write(pass_line)
    f.write("}\n")
    mainMenu()

"""Still needs to be implemented
def checkNetwork():
    pass
"""

def setPath():
    print("Set New Path for wpa_supplicant.conf")
    path = input("Enter New Path: ")
    
    with open('wpa_tools_path.json', "w") as pf:
        json.dump(path, pf)
        pf.close()

    mainMenu()


def mainMenu():
    path = loadPath()

    print("=========WPA Supplicant Tools=========")
    print('')
    print("Config Path: {}".format(path))
    print('')
    print("1) Add Simple Network")
    print("2) Check for Network Existance")
    print("3) Change WPA Supplicant Path")
    print("4) Exit")
    print('')

    choice = input("Enter Number: ")

    
    try:
        choice = int(choice)
    except:
        print("Invalid Selection.")
        mainMenu()
    


    if choice == 1:
        addNetwork()
    elif choice == 2:
        #checkNetwork()
        pass
    elif choice == 3:
        setPath()
    elif choice == 4:
        os.kill(os.getpid(), signal.SIGINT)
    else:
        print("Invalid selection.")
        mainMenu()

def cleanup(sig, frame):
    os.remove("wpa_tools_path.json")
    print("Cleaning up...")
    sys.exit(0)


if __name__ == "__main__":

    if os.geteuid() != 0:
        print("You must root to run this script.")
        sys.exit(1)

    signal.signal(signal.SIGINT, cleanup)
    with open('wpa_tools_path.json', "w") as pf:
        WPA_PATH = "/etc/wpa_supplicant/wpa_supplicant.conf"
        json.dump(WPA_PATH, pf)
        pf.close()

    mainMenu()