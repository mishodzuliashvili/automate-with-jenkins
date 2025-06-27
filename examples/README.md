# 🚀 Jenkins Pipeline Examples

This directory contains various Jenkinsfile examples demonstrating different automation scenarios with Jenkins.

## 📋 Available Pipelines

### 1. Main Jenkinsfile (`../Jenkinsfile`)

**Purpose**: Comprehensive CI/CD pipeline for any application type

**Features**:

- ✅ Multi-language support (Node.js, Python, Java)
- ✅ Parallel execution (Build, Test, Quality checks)
- ✅ Docker integration
- ✅ Branch-based deployment strategy
- ✅ Security scanning
- ✅ Health checks
- ✅ Manual approval for production
- ✅ Comprehensive cleanup and notifications

**Best for**: Full-featured web applications requiring complete CI/CD workflow

---

### 2. Simple Pipeline (`Jenkinsfile.simple`)

**Purpose**: Basic system automation and scheduled tasks

**Features**:

- ✅ System health monitoring
- ✅ Scheduled cleanup tasks
- ✅ Automated backups
- ✅ Daily reporting
- ✅ Cron-based triggers

**Best for**: System administration, maintenance tasks, daily operations

---

### 3. Node.js Pipeline (`Jenkinsfile.nodejs`)

**Purpose**: Specialized CI/CD for Node.js applications

**Features**:

- ✅ Node.js environment setup
- ✅ NPM dependency management
- ✅ Jest testing integration
- ✅ ESLint code quality
- ✅ Security audit (npm audit)
- ✅ Express.js sample app
- ✅ Docker containerization
- ✅ Staging/Production deployment

**Best for**: Node.js web applications, APIs, microservices

---

### 4. Infrastructure Pipeline (`Jenkinsfile.infrastructure`)

**Purpose**: Infrastructure as Code (IaC) automation

**Features**:

- ✅ Terraform integration
- ✅ Ansible configuration management
- ✅ Docker Swarm orchestration
- ✅ Monitoring setup (Prometheus, Grafana)
- ✅ Infrastructure health checks
- ✅ State backup and recovery
- ✅ Manual approval for destructive actions

**Best for**: Infrastructure deployment, DevOps automation, cloud provisioning

---

## 🎯 How to Use

### Setting Up in Jenkins

1. **Create a New Pipeline Job**:

   - Go to Jenkins → New Item → Pipeline
   - Choose "Pipeline script from SCM"
   - Set Git repository URL
   - Specify the Jenkinsfile path

2. **For Specific Examples**:
   ```
   Main Pipeline: Jenkinsfile
   Simple Tasks: examples/Jenkinsfile.simple
   Node.js App: examples/Jenkinsfile.nodejs
   Infrastructure: examples/Jenkinsfile.infrastructure
   ```

### Testing Locally

1. **Start Jenkins** (using our Docker setup):

   ```bash
   ./start-jenkins.bat  # Windows
   ./start-jenkins.sh   # Linux/Mac
   ```

2. **Access Jenkins**: http://localhost:8080

3. **Import Pipeline**: Copy any Jenkinsfile content into a new Pipeline job

---

## 🛠️ Pipeline Features Explained

### 🔄 Parallel Execution

```groovy
parallel {
    stage('Build') { /* ... */ }
    stage('Test') { /* ... */ }
    stage('Quality') { /* ... */ }
}
```

### 🐳 Docker Integration

```groovy
sh """
    docker build -t myapp:${BUILD_NUMBER} .
    docker run -d --name myapp -p 8080:80 myapp:${BUILD_NUMBER}
"""
```

### 🌿 Branch-based Deployment

```groovy
stage('Deploy to Production') {
    when { branch 'main' }
    steps {
        input message: 'Deploy to production?', ok: 'Deploy'
        // deployment steps
    }
}
```

### 📊 Environment Variables

```groovy
environment {
    APP_NAME = 'my-app'
    VERSION = "${env.BUILD_NUMBER}"
    DOCKER_IMAGE = "${APP_NAME}:${VERSION}"
}
```

### 🎛️ Build Parameters

```groovy
parameters {
    choice(name: 'ENVIRONMENT', choices: ['dev', 'staging', 'prod'])
    string(name: 'VERSION', defaultValue: '1.0.0')
}
```

---

## 📋 Prerequisites

### For All Pipelines:

- Jenkins with Docker support
- Git access
- Basic shell tools

### For Node.js Pipeline:

- Node.js plugin for Jenkins
- npm/yarn

### For Infrastructure Pipeline:

- Terraform (optional - simulated if not present)
- Ansible (optional - simulated if not present)
- Docker Swarm capabilities

---

## 🚀 Quick Start Guide

### 1. Choose Your Pipeline Type

| Use Case           | Recommended Pipeline       |
| ------------------ | -------------------------- |
| Web Application    | Main Jenkinsfile           |
| Node.js/React App  | Jenkinsfile.nodejs         |
| System Maintenance | Jenkinsfile.simple         |
| Infrastructure     | Jenkinsfile.infrastructure |

### 2. Customize for Your Project

**Environment Variables**:

```groovy
environment {
    APP_NAME = 'your-app-name'
    DOCKER_REGISTRY = 'your-registry.com'
    STAGING_PORT = '8081'
    PROD_PORT = '8080'
}
```

**Build Steps** (adapt to your project):

```groovy
stage('Build') {
    steps {
        sh 'npm install'        // Node.js
        sh 'pip install -r requirements.txt'  // Python
        sh 'mvn clean compile'  // Java
    }
}
```

**Test Commands**:

```groovy
stage('Test') {
    steps {
        sh 'npm test'           // Node.js
        sh 'python -m pytest'  // Python
        sh 'mvn test'          // Java
    }
}
```

### 3. Set Up Notifications (Optional)

Add to your `post` section:

```groovy
post {
    success {
        slackSend(color: 'good', message: "✅ Build ${BUILD_NUMBER} succeeded!")
    }
    failure {
        emailext(subject: "❌ Build Failed: ${JOB_NAME}",
                 body: "Build ${BUILD_NUMBER} failed. Check console output.")
    }
}
```

---

## 🔧 Troubleshooting

### Common Issues:

1. **Docker Permission Denied**:

   - Ensure Jenkins user is in docker group
   - Check Docker socket permissions

2. **Build Tools Not Found**:

   - Install required tools in Jenkins
   - Use Docker containers for build environments

3. **Port Conflicts**:

   - Modify port numbers in pipelines
   - Check for running containers

4. **Git Access Issues**:
   - Configure SSH keys or credentials
   - Set up proper Git permissions

---

## 📚 Learning Resources

- [Jenkins Pipeline Documentation](https://jenkins.io/doc/book/pipeline/)
- [Declarative Pipeline Syntax](https://jenkins.io/doc/book/pipeline/syntax/)
- [Docker Integration](https://jenkins.io/doc/book/pipeline/docker/)
- [Best Practices](https://jenkins.io/doc/book/pipeline/pipeline-best-practices/)

---

## 🎉 Next Steps

1. **Explore** each pipeline example
2. **Customize** for your specific needs
3. **Add** additional stages as required
4. **Share** your improvements with the team!

Happy automating! 🚀
