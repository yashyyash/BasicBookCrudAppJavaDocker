## 📘 `README.md`

# 📚 Book CRUD App Using MySQL + Spring Boot + Docker

This project is a simple Book Management CRUD application built using **Spring Boot**, **MySQL**, and **Docker**, designed to run smoothly inside **WSL (Ubuntu)** or any Linux environment.

---

## 🚀 Features

- Add, update, delete, and list books
- RESTful API with Spring Boot
- MySQL database
- Containerized with Docker
- WSL/Ubuntu setup automation

---

## 🛠️ Prerequisites

Make sure you have the following installed:

- **WSL (Ubuntu)** or any Debian-based Linux
- **Git** (`sudo apt install git`)
- Enough disk space & internet connectivity

> 🐳 Docker Desktop for Windows is **not needed** when using WSL with this script — Docker will run inside WSL itself.

---

## 📦 Installation (One-time setup)

1. **Clone the repository**

```bash
git clone https://github.com/your-username/book-crud-app-using-mysql.git
cd book-crud-app-using-mysql
````

2. **Run the setup script**

```bash
chmod +x setup.sh
./setup.sh
```

> 🔁 **Restart your terminal** after the first run to apply Docker permissions.

---

## 🔁 Running the Application

After setup, you can start the application anytime with:

```bash
docker compose up --build
```

To stop it:

```bash
docker compose down
```

---

## 🌐 Access

Once running, open:

```
http://localhost:8080
```

You can interact with the API using tools like Postman, Curl, or a frontend if connected.

---

## ⚙️ Environment Variables (Optional)

If you want to customize your DB credentials or port, update them inside `docker-compose.yml`:

```yaml
environment:
  MYSQL_ROOT_PASSWORD: yourpassword
  MYSQL_DATABASE: yourdb
```

---

## 📂 Project Structure

```
.
├── Dockerfile
├── docker-compose.yml
├── setup.sh
├── README.md
└── src/
```

---

## 🧼 Cleanup

To remove all containers, networks, and volumes:

```bash
docker compose down -v --remove-orphans
```

---

## 📃 License

MIT License. Use freely and modify as needed.

---

## 🙋‍♂️ Author

Developed as part of CDAC Advanced Java Assignment
Instructor: *Nitin Vijaykar*

---

## ✅ First-Time Setup Summary

| Step             | Command             |
| ---------------- | ------------------- |
| Clone Repo       | `git clone ...`     |
| Run Script       | `./setup.sh`        |
| Restart Terminal | `exit && reopen`    |
| Start App        | `docker compose up` |




