@echo off
echo ������ ������� ����-���...
start cmd /k python server.py

timeout /t 3

echo ������ ngrok...
start cmd /k ngrok http 5000 --request-header-add "ngrok-skip-browser-warning: true"

timeout /t 5

echo ��������� ngrok ������ ����� API...

REM �������� ������ ����� localhost API ngrok
for /f "delims=" %%i in ('curl -s http://127.0.0.1:4040/api/tunnels ^| findstr /i /r /c:"https://.*ngrok-free.app"') do set "NGROK_URL=%%i"

REM ������������ ������ ����� �������� ������ ��� url
set NGROK_URL=%NGROK_URL:*\"public_url\":\"=%
set NGROK_URL=%NGROK_URL:~0,-2%

echo ��������� URL: %NGROK_URL%

echo ���������� bot.py...

powershell -Command \"(Get-Content bot.py) -replace 'https://����_�����/index.html', '%NGROK_URL%/index.html' | Set-Content bot.py\"

timeout /t 2

echo ������ ����...
start cmd /k python bot.py


pause
