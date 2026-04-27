#  Practice Project (Agentforce Vibes)

##  Overview

This project is built using Salesforce Lightning Web Components (LWC) and Apex through Agentforce Vibes.

It demonstrates how to:
- Fetch Accounts with related Contacts
- Display structured data in LWC
- Handle UI states (loading, error, no data)
- Create interactive components (greeting, refresh)
- Push and manage code using GitHub via Agentforce Vibes

---

##  Tech Stack

- Salesforce LWC
- Apex (Server-side logic)
- Agentforce Vibes
- GitHub

---

##  Project Structure

### 🔹 Apex Classes

#### 1. AccountContactController
- Fetches Accounts along with their related Contacts
- Uses wrapper classes:
  - `AccountWithContacts`
  - `ContactInfo`
- Transforms Salesforce data into UI-friendly structure

#### 2. ContactController
- Fetches a list of Contacts (Id, Name, Email)

---

###  Lightning Web Components

#### 1. accountContactTable
- Displays Accounts and their related Contacts
- Features:
  - Account header section
  - Contact table (Name, Email, Phone)
  - Loading spinner
  - Error message handling
  - No data fallback message

---

#### 2. contactList
- Displays list of Contacts
- Features:
  - Simple list UI
  - Refresh button

---

#### 3. greetingCard
- Takes user input (name)
- Displays personalized greeting
- Features:
  - Dynamic message update
  - Reset functionality

---

##  How It Works

1. LWC uses `@wire` to call Apex methods
2. Apex queries Salesforce objects (Account, Contact)
3. Data is structured using wrapper classes
4. LWC dynamically renders the UI

---

##  Setup Instructions

### 1. Clone Repository
```bash
git clone <your-repo-url>
cd <project-folder>