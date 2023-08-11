#!/usr/bin/env python3
import psutil
import time
import numpy as np
import sounddevice as sd
import tkinter as tk
from tkinter import messagebox
import zc.lockfile
import sys

root = tk.Tk()
root.withdraw()

try:
    lock = zc.lockfile.LockFile('lock')
except zc.lockfile.LockError:
    messagebox.showwarning('Alert title', 'Lockfile exists')
    root.quit()
    sys.exit()

lock.close()

def make_noise():
    # Set the sample rate and duration
    sample_rate = 44100  # 44.1 kHz
    duration = 0.1  # 0.5 seconds

    # Generate the sine wave
    frequency = 440  # 440 Hz
    time = np.linspace(0, duration, int(sample_rate * duration))
    waveform = np.sin(2 * np.pi * frequency * time)

    # Play the sine wave
    sd.play(waveform, sample_rate)
    sd.wait()

def show_message(title, message):
    make_noise()
    messagebox.showwarning(title, message)
    root.update()

while True:
    battery = psutil.sensors_battery()
    percent = battery.percent
    plugged = battery.power_plugged

    if plugged and percent > 90:
        show_message('High Battery', 'Consider unplugging.')
        time.sleep(3000)

    elif not plugged and percent <= 30:
        show_message('Very low battery!', 'Plug in your computer!')
        time.sleep(300)

    else:
        time.sleep(1200)
