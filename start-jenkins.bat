@echo off

rem Jenkins Automation Lab Startup Script for Windows

echo 🚀 Starting Jenkins Automation Lab...
echo ==================================

rem Create necessary directories
if not exist jenkins mkdir jenkins
if not exist certs mkdir certs

rem Start Jenkins and Docker services
docker-compose up -d

rem Wait for Jenkins to be ready
echo ⏳ Waiting for Jenkins to start up...
timeout /t 30 /nobreak >nul

rem Get initial admin password
echo.
echo 📋 Jenkins Setup Information:
echo ==================================
echo 🌐 Jenkins URL: http://localhost:8080
echo.
echo 🔐 Initial Admin Password:
docker exec jenkins-automation-lab cat /var/jenkins_home/secrets/initialAdminPassword
echo.
echo 📁 Jenkins workspace is mounted at: ./jenkins
echo.
echo ✨ To stop Jenkins, run: docker-compose down
echo 🔄 To restart Jenkins, run: docker-compose restart
echo.
echo Happy automating! 🎉

pause 