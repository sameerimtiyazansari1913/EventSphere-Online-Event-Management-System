# EventSphere — Online Event Management System

## 1. Project Overview
EventSphere is a role-based Java web application that connects administrators, event organizers and attendees in one platform. Organizers submit events, administrators approve or reject them, and attendees can view approved events.

## 2. Problem Statement
Traditional event management often uses separate tools for event planning, approval, ticket information and attendee communication. EventSphere centralizes these operations in one database-backed application.

## 3. Objectives
- Provide separate dashboards for Admin, Organizer and Attendee.
- Store users, events, tickets and registrations in MySQL.
- Use JDBC DAO classes for database operations.
- Apply OOP concepts such as classes, encapsulation, inheritance-ready role design, interfaces-ready architecture and exception handling.
- Provide a responsive and simple user interface.

## 4. Functional Modules
### Admin
User management, event approval/rejection, system oversight.
### Organizer
Event creation, ticket creation and event management.
### Attendee
View approved events, with registration/ticket purchase workflow planned for the next iteration.

## 5. Architecture
Browser → JSP/HTML/CSS → Jakarta Servlet Controllers → DAO layer → JDBC → MySQL.

## 6. Database Design
Tables: users, events, tickets, registrations, purchases, messages, system_settings.

Relationships:
- One organizer creates many events.
- One event has many ticket types.
- An attendee can register for events.
- A registration can have a ticket purchase.
- Organizers send messages for events.

## 7. OOP and Java Concepts
- Classes: User, Event, Ticket and DAO classes.
- Encapsulation: entity data is represented through model classes and database access is separated into DAO classes.
- Polymorphism: Servlet API lifecycle methods such as doGet/doPost are overridden.
- Inheritance: custom servlets extend HttpServlet.
- Exception handling: SQL and servlet exceptions are handled and propagated as ServletException where appropriate.
- Collections: ArrayList is used for database result lists.
- Generics: List<User>, List<Event>, List<Ticket> provide type safety.
- Multithreading: servlet containers execute requests concurrently; the application is designed without unsafe shared mutable state in DAO methods.
- JDBC: DriverManager, Connection, PreparedStatement and ResultSet are used.

## 8. Security Considerations
- Passwords are stored as SHA-256 hashes in the demo implementation.
- PreparedStatement prevents SQL injection through parameterized SQL.
- Role checks are performed before protected operations.
- For production, replace SHA-256 password hashing with a slow password hashing algorithm such as bcrypt/Argon2 and add CSRF protection, secure cookies and HTTPS.

## 9. UI/UX Principles
- Consistent navigation and role-specific dashboards.
- Card-based layout for readable sections.
- Responsive grid for desktop and mobile widths.
- Clear buttons and status badges.
- Simple forms with required fields.

## 10. Testing Plan
1. Login with each role.
2. Verify incorrect login shows an error.
3. Organizer creates an event.
4. Admin sees pending event and approves/rejects it.
5. Attendee sees approved events.
6. Verify unauthorized role actions return HTTP 403.
7. Verify database records after each operation.

## 11. Future Scope
Online payment gateway, email/SMS notifications, attendee registration and cancellation, QR-code tickets, advanced analytics, organizer messaging, profile management, pagination, audit logs and stronger security.

## 12. Review Talking Points
The key story is: “The application follows a layered architecture. JSP provides the interface, Servlets control requests, DAO classes isolate JDBC operations, model classes represent entities, and MySQL stores persistent data. Role-based dashboards make the same system useful for administrators, organizers and attendees.”
