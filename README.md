# K-Drama Database 📺📊

A structured SQL-based relational database designed to manage and query Korean drama data efficiently. This academic project focuses on solving real-world data problems faced by K-drama viewers using SQL triggers, views, and functions.

---

## 📖 Problem Statement

K-drama watchers often struggle to find a complete, organized list of dramas by month or discover top-performing all-time hits. This database addresses two common user problems:

### 🧩 Problem 1: List dramas released by month  
**Solution:** Use SQL **triggers** to automatically add current month/year when new drama records are inserted.

### 🧩 Problem 2: Identify all-time hit dramas  
**Solution:** Create SQL **functions** and **views** to calculate and store average viewership across platforms, enabling quick retrieval of high-performing dramas.

---

## 🗃️ Core Features

- Auto-inserts the current `month` and `year` using SQL `AFTER INSERT` triggers.  
- Calculates `average viewership` using a custom SQL function across platform and nation data.  
- Uses `views` to simplify repeated queries like fetching the best-hit drama list.  
- Normalized schema design with relationships across drama, viewership, award, and cast tables.

---

## 🧱 Schema Overview

- `drama` – stores drama metadata  
- `viewership` – stores platform and nation views  
- `drama_award` – links dramas to award wins  
- `cast` – stores cast member details  
- `award` – stores award types  

---

## ⚙️ Key SQL Components

### 🔹 View: `best_hits_list`  
Returns top dramas sorted by average viewership.

### 🔹 Trigger: `trg_insert_month_after_drama_list_updated`  
Auto-populates the `month` and `year` fields when new dramas are inserted.

### 🔹 Function: `fn_avg_viewership`  
Calculates the average of platform and nation viewership per drama.

---

## 🧠 Learning Outcomes

- Practiced advanced SQL operations including **joins**, **functions**, **views**, and **triggers**.  
- Improved database normalization and integrity enforcement using **foreign keys**.  
- Learned how to solve real-world problems using backend logic without UI.

---

## 🚫 License

This project is part of an academic portfolio and is not intended for commercial reuse or redistribution.

---

**Created and maintained by Pallavi Kandikanti**  
📧 [pallavikandikantica@gmail.com](mailto:pallavikandikantica@gmail.com)  
🔗 [LinkedIn](https://www.linkedin.com/in/kandikanti-pallavi/)
