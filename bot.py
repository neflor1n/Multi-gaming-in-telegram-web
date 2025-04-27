from telegram import Update, WebAppInfo, KeyboardButton, ReplyKeyboardMarkup
from telegram.ext import ApplicationBuilder, CommandHandler, ContextTypes

def main():
    app = ApplicationBuilder().token("7813099030:AAG-_9Dxfx_lgytMyQ0TMSJ1rKDvW8m_RbM").build()

    app.add_handler(CommandHandler('start', start))

    print("Бот запущен...")
    app.run_polling()

async def start(update: Update, context: ContextTypes.DEFAULT_TYPE):
    keyboard = [
        [KeyboardButton(
            text="🎮 Играть",
            #web_app=WebAppInfo(url="https://ТВОЙ_АДРЕС/index.html")
            web_app=WebAppInfo(url="https://bogdansergachev23.thkit.ee/index.html")
        )]
    ]

    await update.message.reply_text(
        "Добро пожаловать в мини-игры! Нажми кнопку, чтобы начать:",
        reply_markup=ReplyKeyboardMarkup(keyboard, resize_keyboard=True)
    )

if __name__ == '__main__':
    main()
