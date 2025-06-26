#!/bin/bash

# Jenkins Automation Lab Startup Script

echo "🚀 Starting Jenkins Automation Lab..."
echo "=================================="

# Create necessary directories
mkdir -p jenkins certs

# Start Jenkins and Docker services
docker-compose up -d

# Wait for Jenkins to be ready
echo "⏳ Waiting for Jenkins to start up..."
sleep 30

# Get initial admin password
echo ""
echo "📋 Jenkins Setup Information:"
echo "=================================="
echo "🌐 Jenkins URL: http://localhost:8080"
echo ""
echo "🔐 Initial Admin Password:"
docker exec jenkins-automation-lab cat /var/jenkins_home/secrets/initialAdminPassword
echo ""
echo "📁 Jenkins workspace is mounted at: ./jenkins"
echo ""
echo "✨ To stop Jenkins, run: docker-compose down"
echo "🔄 To restart Jenkins, run: docker-compose restart"
echo ""
echo "Happy automating! 🎉" 