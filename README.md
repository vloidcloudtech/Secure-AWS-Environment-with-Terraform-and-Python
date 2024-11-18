Cloud Security Lab with Terraform and Python
============================================

**Build, Secure, and Automate Cloud Environments**

\-\-\-

Overview
--------

This project simulates a real-world cloud security environment where you will deploy a multi-account AWS architecture with Terraform and automate compliance, monitoring, and remediation using Python. The lab combines **Infrastructure as Code (IaC)** with **security automation** and a **real-time monitoring dashboard** to enhance your skills in cloud security engineering.

\-\-\-

Features
--------

* Deploy secure AWS environments with **Terraform**.
* Enable centralized logging with S3 and CloudTrail for compliance tracking.
* Integrate AWS native tools like **GuardDuty** and **Security Hub** for threat detection and monitoring.
* Automate S3 bucket compliance checks and incident response workflows using **Python scripts**.
* Visualize real-time security insights with a **Flask-based web dashboard**.

\-\-\-

Scenarios
---------

### 1\. S3 Bucket Security Violation

**Violation:** Create a public, unencrypted S3 bucket.

**Remediation:** Use the Python compliance checker to automatically detect and remediate the issue by revoking public access and enabling server-side encryption.

### 2\. EC2 Instance Compromise

**Violation:** Simulate a compromised EC2 instance flagged by GuardDuty.

**Remediation:** Trigger a Lambda function to isolate the instance by moving it to a quarantine Security Group.

### 3\. IAM Role Violation

**Violation:** Create an overly permissive IAM role with Administrator Access.

**Remediation:** Use Security Hub to detect the violation and detach the policy manually or programmatically.

\-\-\-

Outcomes
--------

* Gain hands-on experience with cloud security best practices.
* Master **Infrastructure as Code (IaC)** with Terraform for repeatable deployments.
* Develop Python scripts for automated compliance and threat detection.
* Build a real-time security dashboard to monitor your AWS environment.
* Learn how to simulate and remediate security violations in a controlled environment.

\-\-\-

How to Use This Project
-----------------------

1.  **Deploy Infrastructure:** Use Terraform to deploy the AWS environment with secure VPC, S3 logging, GuardDuty, and Security Hub.
2.  **Run Python Automation:** Execute scripts to enforce compliance and analyze findings.
3.  **Simulate Violations:** Create intentional security violations to test detection and remediation.
4.  **Visualize Insights:** Access the Flask dashboard for a centralized view of compliance and threats.

\-\-\-

Prerequisites
-------------

* Terraform and AWS CLI installed on your machine.
* An AWS account with administrative privileges.
* Basic knowledge of Python and cloud security concepts.

\-\-\-

Technologies Used
-----------------

* **AWS Services:** VPC, S3, GuardDuty, Security Hub, CloudTrail, Lambda
* **Terraform:** For Infrastructure as Code (IaC).
* **Python:** For automation and monitoring.
* **Flask:** For building the security dashboard.

\-\-\-

License
-------

This project is licensed under the MIT License. Feel free to use and modify it for personal or professional use.

