# system-monitoring-project
Linux System Monitoring & Automation Project
📌 Overview

This project is a Linux-based system monitoring solution built using Bash scripting and deployed on a cloud server. It collects and reports key system metrics such as CPU load, memory usage, and disk utilization.

The solution is automated using CI/CD pipelines and scheduled execution, demonstrating real-world DevOps practices.

🎯 Project Objectives
Monitor system health (CPU, memory, disk usage)
Automate execution using CI/CD tools
Deploy and run on a cloud-based Linux server
Practice real DevOps workflows using Git and automation
🛠️ Technologies Used
Linux (Ubuntu)
Bash Scripting
Git & GitHub
GitHub Actions (CI/CD)
Amazon Web Services (EC2)
⚙️ Features
📊 Displays real-time system metrics:
CPU load
Memory usage
Disk usage
⚠️ Basic alert system for high CPU usage
🔁 Automated execution using GitHub Actions
☁️ Deployed on AWS EC2 (Ubuntu server)
⏱️ Optional scheduling using cron jobs
📂 Project Structure
devops-monitoring-project/
│
├── monitor.sh
├── logs.txt
├── .github/
│   └── workflows/
│       └── monitor.yml
└── README.md
🚀 How It Works
1. Monitoring Script

The Bash script (monitor.sh) collects system data:

Uses top for CPU load
Uses free -h for memory usage
Uses df -h for disk usage
2. CI/CD Automation

A GitHub Actions workflow automatically:

Pulls the latest code
Executes the monitoring script on every push
3. Cloud Deployment

The project is deployed on an EC2 instance:

Ubuntu-based server
Connected via SSH
Script executed manually and via scheduled jobs
🧪 How to Run Locally
git clone https:/s12-samayo/github.com//devops-monitoring-project.git
cd devops-monitoring-project
chmod +x monitor.sh
./monitor.sh
☁️ Deployment on AWS EC2
Launch EC2 instance (Ubuntu)
Connect via SSH:
ssh -i your-key.pem ubuntu@your-public-ip
Install Git:
sudo apt update
sudo apt install git -y
Clone repo and run:
git clone https://github.com/your-username/devops-monitoring-project.git
cd devops-monitoring-project
./monitor.sh
⏱️ Automation with Cron (Optional)

To run every 5 minutes:

crontab -e

Add:

*/5 * * * * /home/ubuntu/devops-monitoring-project/monitor.sh >> /home/ubuntu/log.txt
📸 Sample Output
===== SYSTEM HEALTH CHECK =====
CPU Load: 0.35, 0.40, 0.45
Memory Usage: 1.2GB / 7.6GB
Disk Usage: 45%
===============================
💡 Key Learnings
Practical experience with Linux system monitoring
Hands-on use of Git workflows (branching, merging, PRs)
Understanding CI/CD pipelines using GitHub Actions
Deploying and managing applications on cloud infrastructure

👨‍💻 Author

[smart-x]

Aspiring DevOps Engineer with hands-on experience in Linux, Git, automation, and cloud deployment.

⭐ Acknowledgment

This project is part of my journey toward becoming a DevOps Engineer, focusing on building real-world skills through practical implementation.
