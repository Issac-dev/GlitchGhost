@echo off
setlocal
pip install sounddevice scipy

start /min python record.py
