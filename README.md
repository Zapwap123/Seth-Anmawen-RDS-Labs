# AWS RDS Labs – Step-by-Step Project

## 📌 Overview

This repository contains lab work and assessment notes for practicing **Amazon RDS** concepts, including high availability, replication, backups, and recovery.  
The project was completed as part of DevOps/Cloud training to gain hands-on experience with AWS-managed relational databases.

## 📂 Project Structure

```
Seth-Anmawen-RDS-Labs/
├── Lab1
│   ├── Notes.txt
│   └── Screenshots/
├── Lab2
│   ├── Notes.txt
│   └── Screenshots/
├── Lab3
│   ├── Notes.txt
│   └── Screenshots/
├── Lab4
│   ├── Notes.txt
│   └── Screenshots/
├── Seth-Anmawen-RDS-Lab-Report.pdf
└── Seth-Anmawen-RDS-Test-Scripts.sql
```

### Contents

- **Lab1** → RDS instance setup for MySQL and PostgreSQL, connectivity testing.
- **Lab2** → Enabling Multi-AZ deployment and testing failover.
- **Lab3** → Creating read replicas (local and cross-region), testing replication and promotion.
- **Lab4** → Snapshots, backup retention, and point-in-time recovery.
- **Seth-Anmawen-RDS-Lab-Report.pdf** → Final compiled answers for lab assessment questions.
- **Seth-Anmawen-RDS-Test-Scripts.sql** → SQL scripts used for testing connectivity, inserts, and recovery.

## 🧪 Labs Completed

- **Lab 1**: Setup and Connectivity (MySQL & PostgreSQL)
- **Lab 2**: High Availability with Multi-AZ
- **Lab 3**: Read Replicas and Cross-Region Replication
- **Lab 4**: Backup, Snapshots, and PITR (Point-in-Time Recovery)

## 📝 Deliverables

- Notes from each lab with timings, observations, and test results.
- Screenshots proving step-by-step progress.
- SQL test scripts for inserts/queries.
- Final consolidated **lab report (PDF)** answering assessment questions.

## 🚀 Key Learnings

- Differences in RDS setup between MySQL and PostgreSQL.
- Multi-AZ ensures high availability but does not change the DB endpoint.
- Read replicas are **read-only** and can be promoted when needed.
- Cross-region replication introduces additional latency and cost.
- Snapshots and PITR are crucial for disaster recovery planning.

## 🔒 Security Notes

- Database access was restricted via **AWS Security Groups**.
- Only whitelisted IPs were able to connect to the RDS instances.

---

📘 **Author:** Seth Anmawen
