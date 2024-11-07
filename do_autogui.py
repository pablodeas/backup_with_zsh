#!/usr/bin/env python3

import pyautogui
import time
import webbrowser
import sys

url = 'https://drive.google.com/drive/u/0/folders/1p8mUT8iH6yaCZnxD_lmaSGymBHSK51h1'

if webbrowser.open(url):
    time.sleep(5)

pyautogui.press('win')
time.sleep(1)

img = pyautogui.locateCenterOnScreen('src/imgs/menu.png', confidence=0.9)
pyautogui.doubleClick(img.x, img.y)
time.sleep(1)
pyautogui.write('files')
time.sleep(1)

try:
    img = pyautogui.locateCenterOnScreen('src/imgs/files.png', confidence=0.9)
except:
    img = pyautogui.locateCenterOnScreen('src/imgs/files2.png', confidence=0.9)
pyautogui.click(img.x, img.y)
time.sleep(2)

pyautogui.hotkey('win', 'ctrl', 'right') # Move Files Window to the Right
time.sleep(2)
try:
    img = pyautogui.locateCenterOnScreen('src/imgs/desktop.png', confidence=0.9)
except:
    img = pyautogui.locateCenterOnScreen('src/imgs/desktop2.png', confidence=0.9)

time.sleep(2)
pyautogui.click(img.x, img.y)

time.sleep(2)
try:
    bkp_fl = pyautogui.locateCenterOnScreen('src/imgs/backup.png', confidence=0.8)
except Exception as e:
    print(f'> Não Encontrado: backup.png - {e}')
    sys.exit()

try:
    bkp_fd = pyautogui.locateCenterOnScreen('src/imgs/backup_folder.png', confidence=0.8)
except Exception as e:
    print(f'> Não Encontrado: backup_folder.png - {e}')
    sys.exit()

pyautogui.dragTo(bkp_fl.x, bkp_fl.y, 2)
pyautogui.dragTo(bkp_fd.x, bkp_fd.y, 2, button='left')

