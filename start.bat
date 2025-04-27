@echo off
echo Запуск сервера мини-игр...
start cmd /k python server.py

timeout /t 3

echo Запуск ngrok...
start cmd /k ngrok http 5000 --request-header-add "ngrok-skip-browser-warning: true"

timeout /t 5

echo Получение ngrok ссылки через API...

REM Получаем ссылку через localhost API ngrok
for /f "delims=" %%i in ('curl -s http://127.0.0.1:4040/api/tunnels ^| findstr /i /r /c:"https://.*ngrok-free.app"') do set "NGROK_URL=%%i"

REM Обрабатываем строку чтобы оставить только сам url
set NGROK_URL=%NGROK_URL:*\"public_url\":\"=%
set NGROK_URL=%NGROK_URL:~0,-2%

echo Найденный URL: %NGROK_URL%

echo Обновление bot.py...

powershell -Command \"(Get-Content bot.py) -replace 'https://ТВОЙ_АДРЕС/index.html', '%NGROK_URL%/index.html' | Set-Content bot.py\"

timeout /t 2

echo Запуск бота...
start cmd /k python bot.py


pause
