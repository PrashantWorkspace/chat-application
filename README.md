= 💬 Real-Time Chat Application (Spring Boot + WebSockets)
:toc:
:icons: font
:sectnums:

A feature-rich **real-time chat application** leveraging *Spring Boot*, *WebSocket*, and *HTTP* protocols for seamless communication. Includes **public/private messaging, chat rooms, file uploads, and user presence indicators**.

image:https://img.shields.io/badge/Java-17+-blue[Java 17+] 
image:https://img.shields.io/badge/Spring%20Boot-3.x-green[Spring Boot] 
image:https://img.shields.io/badge/WebSockets-enabled-orange[WebSockets] 
image:https://img.shields.io/badge/License-MIT-informational[MIT License]

== ✨ Key Features
* **Real-Time Messaging** → public chat, private chat, and room-based messaging
* **User Authentication & Sessions** → secure login/logout with session management
* **Private Rooms** → create, join, leave rooms; private queues for one-to-one messaging
* **File Upload Support** → share images/files with uploads stored in a dedicated directory
* **Dynamic Avatars** → auto-generated avatar URLs based on usernames
* **Docker Deployment** → containerized for reproducible deployments

== 📡 API Endpoints

=== WebSocket Endpoints
[cols="2,5", options="header"]
|===
| Endpoint | Functionality
| /chat.sendMessage | Broadcast public message, update user status, attach avatar
| /chat.addUser | Add a user to session and notify public chat
| /chat.sendPrivateMessage | Send private message between two users via dedicated queues
| /chat.createPrivateRoom | Create private room and assign users
| /chat.joinRoom | Join a user to a room and notify members
| /chat.leaveRoom | Remove a user from a room and notify remaining members
| /chat.sendRoomMessage | Broadcast message to all users in a private room
|===

=== HTTP Endpoints
[cols="2,2,5", options="header"]
|===
| Endpoint | Method | Functionality
| / | GET | Render chat page if authenticated; else redirect to login
| /login | GET | Display login page
| /login | POST | Authenticate user and create session
| /logout | GET | Invalidate session and redirect to login
| /upload | POST | Handle file uploads (e.g., images) and return file URL
|===

== 🔧 Tech Stack
* Java 17+
* Spring Boot (WebSockets, REST)
* HTML, JavaScript, CSS
* Docker for containerized deployment

== 🚀 Quick Start

=== Prerequisites
* Java 17+
* Maven 3.9+

=== Build
[source,bash]
----
mvn clean package
----

=== Run
[source,bash]
----
java -jar target/real-time-chat.jar --server.port=8081
----

Open: `http://localhost:8081`

== 🐳 Docker

=== Build
[source,bash]
----
docker build -t real-time-chat:latest .
----

=== Run
[source,bash]
----
docker run -d -p 8081:8081 real-time-chat:latest
----

== 📐 Architecture

* **Frontend**: HTML/JS + WebSockets client
* **Backend**: Spring Boot WebSocket/REST controllers
* **Storage**: Session-based authentication + local file uploads
* **Deployment**: Packaged in Docker for portability

----
Browser ↔ Spring Boot Server (WebSocket + REST) ↔ Session/File Store
----

== 🧭 Roadmap
* [ ] Add persistent DB for messages
* [ ] Enable typing indicators
* [ ] Integrate Redis pub/sub for scaling across servers
* [ ] Enhance UI with React frontend

== 🤝 Contributing
PRs welcome!

1. Fork repository
2. Create feature branch
3. Commit changes
4. Open a Pull Request

== 📜 License
Licensed under the MIT License.