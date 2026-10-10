# EventSphere Presentation — Slide Content

## Slide 1 — Title
**EventSphere: Online Event Management System**
Java Web Based Project | Team Name | Team Members | Faculty Name

## Slide 2 — Problem Statement
Event organizers need one platform to create events, manage tickets and communicate with attendees. Administrators need approval and user controls, while attendees need a simple way to discover and purchase tickets.

## Slide 3 — Proposed Solution
EventSphere provides three role-based dashboards: Admin, Event Organizer and Attendee. Data is stored centrally in MySQL and accessed through JDBC DAO classes.

## Slide 4 — User Roles
Admin: users, approvals, settings, monitoring.
Organizer: events, tickets, attendee communication, statistics.
Attendee: event discovery, registration, ticket purchase, updates, profile.

## Slide 5 — Key Functionalities
Login/authentication, role-based access, event creation, event approval, ticket creation, ticket purchase, registration records, responsive dashboards.

## Slide 6 — Technology Stack
Frontend: JSP, HTML5, CSS3.
Backend: Java 21, Jakarta Servlets.
Database: MySQL.
Connectivity: JDBC.
Build: Maven.
Server: Apache Tomcat 10.1+.

## Slide 7 — System Architecture
Browser → JSP/UI → Servlet Controller → DAO Layer → JDBC → MySQL.
Model classes represent User, Event and Ticket data.

## Slide 8 — Database Design
Show ER diagram with: Users → Events → Tickets; Users → Registrations → Purchases; Events → Messages; System Settings.

## Slide 9 — OOP Concepts
Inheritance: servlets extend HttpServlet.
Polymorphism: overridden doGet/doPost methods.
Encapsulation: model/DAO separation.
Exception handling: SQLException/ServletException handling.
Collections & Generics: List<User>, List<Event>, List<Ticket>.

## Slide 10 — JDBC Integration
Driver loading → Connection → PreparedStatement → Execute Query/Update → ResultSet → Close resources.
Mention PreparedStatement for safer parameterized SQL.

## Slide 11 — Admin Dashboard
Insert screenshot of Admin Dashboard. Explain user management and event approval.

## Slide 12 — Organizer Dashboard
Insert screenshot of Organizer Dashboard. Explain event creation and event status.

## Slide 13 — Attendee Dashboard
Insert screenshot of Attendee Dashboard. Explain approved event discovery and ticket purchase.

## Slide 14 — UI/UX & Responsiveness
Consistent cards, readable tables, clear buttons, status badges, responsive CSS grid and simple navigation.

## Slide 15 — Testing
Login tests, role authorization tests, event creation, approval/rejection, ticket purchase, database verification and invalid input testing.

## Slide 16 — Future Scope
Real payment gateway, email/SMS notifications, QR tickets, analytics, profile management, audit logs and stronger production security.

## Slide 17 — GitHub & README
Show repository screenshot and explain: source folders, database/schema.sql, README setup instructions and Maven build.

## Slide 18 — Conclusion
EventSphere demonstrates Java web development, OOP, JDBC, Servlets, MySQL database integration and responsive UI design in a single role-based application.
