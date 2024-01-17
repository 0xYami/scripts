@echo off

start /min cmd.exe /c cloudflared access tcp --url localhost:1120 --hostname ssh.hylia.dev

ssh -y Administrator@localhost -p 1120
