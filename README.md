# 🤖 Robot Framework Automation - SauceDemo

## 🔹 Project Description

This project automates the SauceDemo application using **Robot Framework + SeleniumLibrary**.
It covers end-to-end test scenarios like login, add to cart, checkout, and order validation.

---

## 🔹 Tech Stack

* Robot Framework
* SeleniumLibrary
* Python
* Jenkins (CI/CD)

---

## 🔹 Project Structure

```
project/
│
├── tests/                # Test cases
├── resources/            # Reusable keywords
├── pages/                # Page object locators
├── test_data/            # Test data files
├── results/              # Execution reports
```

---

## 🔹 Setup Instructions

### 1. Install Python

Make sure Python is installed:

```
python --version
```

### 2. Create Virtual Environment

```
python -m venv venv
```

### 3. Activate Virtual Environment

Windows:

```
venv\Scripts\activate
```

Linux/Mac:

```
source venv/bin/activate
```

### 4. Install Dependencies

```
pip install robotframework
pip install robotframework-seleniumlibrary
```

---

## 🔹 Run Tests Locally

```
robot tests/
```

---

## 🔹 Test Reports

After execution, reports are generated in:

```
results/
```

Open:

* `log.html`
* `report.html`

---

# 🚀 Jenkins Execution

## 🔹 Prerequisites

* Jenkins installed on server
* Python installed on server
* Git configured
* Required plugins:

  * Git Plugin
  * Pipeline Plugin

---

## 🔹 Jenkins Pipeline (Sample)

```
pipeline {
    agent any

    triggers {
        cron('H 2 * * *')   // Runs daily at 2 AM
    }

    stages {

        stage('Clean Workspace') {
            steps {
                cleanWs()
            }
        }

        stage('Checkout Code') {
            steps {
                git 'https://github.com/your-repo-url.git'
            }
        }

        stage('Setup Environment') {
            steps {
                sh '''
                python3 -m venv venv
                . venv/bin/activate
                pip install robotframework
                pip install robotframework-seleniumlibrary
                '''
            }
        }

        stage('Run Tests') {
            steps {
                sh '''
                . venv/bin/activate
                robot -d results tests/
                '''
            }
        }

        stage('Archive Reports') {
            steps {
                archiveArtifacts artifacts: 'results/*', fingerprint: true
            }
        }
    }
}
```

---

## 🔹 How Jenkins Execution Works

1. Jenkins pulls code from GitHub
2. Creates virtual environment
3. Installs dependencies
4. Executes Robot tests
5. Generates reports
6. Archives results

---

## 🔹 Trigger Options

* Manual build
* Scheduled (2 AM daily)


---

## 🔹 Output Files in Jenkins

* `output.xml`
* `log.html`
* `report.html`

---

## 🏆 Best Practices

* Use reusable keywords
* Maintain Page Object Model
* Use variables for locators
* Avoid hardcoded values
* Keep tests independent

---

## 👨‍💻 Author
Shubham Sadgure

Automation Framework by Shubham
