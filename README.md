# Database-Management-System
# Cybersecurity Incident Management System (CIMS)

## 📌 Project Overview

The **Cybersecurity Incident Management System (CIMS)** is a MySQL-based database solution designed to help organizations log, track, and analyze cybersecurity incidents, the assets affected, the actions taken, and the teams involved. This solution is ideal for small to medium-sized SOCs (Security Operations Centers), IT departments, or training environments.

## 🎯 Features

- Record and categorize incidents with severity and status.
- Track analysts assigned to investigations.
- Associate incidents with affected assets.
- Log actions taken to resolve each incident.
- Identify users who report incidents.

## 🏗️ Database Structure

The system includes the following relational tables:

| Table            | Description |
|------------------|-------------|
| **Users**        | Users who report incidents. |
| **Analysts**     | Security team members who investigate and resolve incidents. |
| **Assets**       | IT infrastructure assets (e.g., servers, endpoints). |
| **Incidents**    | Logged incidents with severity, description, and assignment. |
| **IncidentAsset**| Junction table to link incidents to affected assets. |
| **Actions**      | Steps taken during investigation and remediation. |

All tables have appropriate constraints including:
- `PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, `NOT NULL`, and `ENUM` fields
- Proper **1:1**, **1:M**, and **M:N** relationships

## 📂 File Structure
CyberSecIncidentDB/
├── CyberSecIncidentDB.sql # Full SQL schema
├── ERD_CyberSecIncidentDB.pdf # Entity Relationship Diagram (ERD)
└── README.md # This file
👨‍💻 Author

Joseph Mwangi (Technologist036)

    🔗 GitHub https://github.com/Technologist0366

    🛡️ Fiverr https://www.fiverr.com/jalicemwangi

    🐦 Twitter https://x.com/Technologist36

    ✍️ Blog  https://medium.com/@Technologist036
