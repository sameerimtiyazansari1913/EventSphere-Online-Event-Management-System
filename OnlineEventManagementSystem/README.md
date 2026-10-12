# EventSphere — Online Event Management System

Java Web project for the GUVI project review. Built with Java 21, Jakarta Servlets/JSP, JDBC, MySQL and responsive CSS.

## Roles
- Admin: manage users and approve/reject events.
- Event Organizer: create events and ticket types.
- Attendee: view approved events (registration/purchase workflow can be extended).

## Tech stack
Java 21, Jakarta Servlet 6, JSP/JSTL, MySQL 8+, JDBC, HTML5, CSS3, Maven, Apache Tomcat 10.1+.

## Setup
1. Install JDK 21, Maven, MySQL and Apache Tomcat 10.1+.
2. Create the database by running `database/schema.sql` in MySQL Workbench.
3. Open `src/main/java/com/eventmanager/util/DB.java` and change the MySQL username/password.
4. From the project folder run `mvn clean package`.
5. Copy `target/event-management.war` into Tomcat's `webapps` folder.
6. Start Tomcat and open `http://localhost:8080/event-management/`.

## Demo accounts
- Admin: admin@eventsphere.com / admin123
- Organizer: organizer@eventsphere.com / organizer123
- Attendee: attendee@eventsphere.com / attendee123

## Project structure
`controller/` = Servlets and request handling
`dao/` = JDBC database operations
`model/` = Java entity classes
`util/` = database and password utilities
`webapp/` = JSP pages, CSS and web configuration
`database/` = SQL schema and demo data


