CREATE DATABASE IF NOT EXISTS event_management;
USE event_management;

CREATE TABLE users (
 id INT PRIMARY KEY AUTO_INCREMENT,
 name VARCHAR(100) NOT NULL,
 email VARCHAR(150) NOT NULL UNIQUE,
 password_hash VARCHAR(64) NOT NULL,
 role ENUM('ADMIN','ORGANIZER','ATTENDEE') NOT NULL DEFAULT 'ATTENDEE',
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE events (
 id INT PRIMARY KEY AUTO_INCREMENT,
 organizer_id INT NOT NULL,
 title VARCHAR(150) NOT NULL,
 description TEXT,
 event_date DATE NOT NULL,
 event_time TIME NOT NULL,
 venue VARCHAR(200) NOT NULL,
 status ENUM('PENDING','APPROVED','REJECTED') DEFAULT 'PENDING',
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY (organizer_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE tickets (
 id INT PRIMARY KEY AUTO_INCREMENT,
 event_id INT NOT NULL,
 ticket_name VARCHAR(100) NOT NULL,
 price DECIMAL(10,2) NOT NULL,
 quantity INT NOT NULL,
 FOREIGN KEY (event_id) REFERENCES events(id) ON DELETE CASCADE
);

CREATE TABLE registrations (
 id INT PRIMARY KEY AUTO_INCREMENT,
 event_id INT NOT NULL,
 attendee_id INT NOT NULL,
 ticket_id INT,
 status ENUM('REGISTERED','CANCELLED') DEFAULT 'REGISTERED',
 registered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 UNIQUE KEY unique_registration(event_id, attendee_id),
 FOREIGN KEY (event_id) REFERENCES events(id) ON DELETE CASCADE,
 FOREIGN KEY (attendee_id) REFERENCES users(id) ON DELETE CASCADE,
 FOREIGN KEY (ticket_id) REFERENCES tickets(id) ON DELETE SET NULL
);

CREATE TABLE messages (
 id INT PRIMARY KEY AUTO_INCREMENT,
 event_id INT NOT NULL,
 sender_id INT NOT NULL,
 message TEXT NOT NULL,
 sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY (event_id) REFERENCES events(id) ON DELETE CASCADE,
 FOREIGN KEY (sender_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE purchases (
 id INT PRIMARY KEY AUTO_INCREMENT,
 registration_id INT NOT NULL,
 amount DECIMAL(10,2) NOT NULL,
 purchased_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY (registration_id) REFERENCES registrations(id) ON DELETE CASCADE
);

CREATE TABLE system_settings (
 setting_key VARCHAR(80) PRIMARY KEY,
 setting_value VARCHAR(255) NOT NULL
);

INSERT INTO system_settings VALUES ('site_name','EventSphere'),('maintenance_mode','false');

INSERT INTO users(name,email,password_hash,role) VALUES
('System Admin','admin@eventsphere.com',SHA2('admin123',256),'ADMIN'),
('Demo Organizer','organizer@eventsphere.com',SHA2('organizer123',256),'ORGANIZER'),
('Demo Attendee','attendee@eventsphere.com',SHA2('attendee123',256),'ATTENDEE');

INSERT INTO events(organizer_id,title,description,event_date,event_time,venue,status)
VALUES(2,'Tech Innovation Summit','A student-focused technology and innovation event.',DATE_ADD(CURDATE(),INTERVAL 15 DAY),'10:00:00','Main Auditorium','APPROVED');
INSERT INTO tickets(event_id,ticket_name,price,quantity) VALUES(1,'Standard',199.00,100),(1,'VIP',499.00,25);

USE event_management;

SELECT id, name, email, role
FROM users;

USE event_management;

INSERT INTO users (name, email, password_hash, role)
VALUES (
    'Demo Attendee',
    'attendee@eventsphere.com',
    SHA2('attendee123', 256),
    'ATTENDEE'
);

SELECT id, name, email, role
FROM users;