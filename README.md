# STUDENT-MANAGEMENT-J2EE

## Project Overview

The **STUDENT-MANAGEMENT-J2EE** project is a web-based application designed to streamline the management of student data for educational institutions. Built using Java 2 Enterprise Edition (J2EE), the application provides functionalities to handle student registration, and enables admin features.

## Features

- **Student Registration:** Add, update, and delete student profiles.
-**Admin (Principle):hw can control everything 

## Technologies Used

- **Backend:** J2EE (Servlets, JSP, JDBC)
- **Frontend:** HTML, CSS, JavaScript, Bootstrap
- **Database:** MySQL
- **Server:** Apache Tomcat
- **Tools:** Eclipse IDE, Maven

## Prerequisites

- Java Development Kit (JDK) 1.8 or later
- Apache Tomcat 9 or later
- MySQL Server 8.0 or later
- Maven 3.6 or later
- An IDE such as Eclipse or IntelliJ IDEA

## Installation and Setup

1. **Clone the Repository:**
   ```bash
   git clone <https://github.com/Shivuakkur/STUDENT-MANAGEMENT-J2EE>
   cd STUDENT-MANAGEMENT-J2EE
   ```

2. **Configure Database:**
   - Create a MySQL database named `student_management`.
   - Import the provided `student_management.sql` file to set up the required tables and sample data.

3. **Update Database Configuration:**
   - Update the `db.properties` file in the project with your MySQL credentials:
     ```properties
     db.url=jdbc:mysql://localhost:3306/student_management
     db.username=your-username
     db.password=your-password
     ```

4. **Build the Project:**
   ```bash
   mvn clean install
   ```

5. **Deploy to Tomcat:**
   - Copy the generated WAR file from the `target` directory to the Tomcat `webapps` folder.
   - Start the Tomcat server.

6. **Access the Application:**
   Open your browser and navigate to `http://localhost:8080/STUDENT-MANAGEMENT-J2EE`.

## Usage

- **Admin Panel:**
  - URL: `/admin`
  - Manage students.

- **Student Panel:**
  - URL: `/student`
  - View personal information.
## Project Structure

```
STUDENT-MANAGEMENT-J2EE
├── src/main/java
│   ├── com.example.controllers
│   ├── com.example.models
│   ├── com.example.services
│   └── com.example.utils
├── src/main/webapp
│   ├── WEB-INF
│   │   ├── web.xml
│   │   └── views
│   ├── assets
│   └── index.jsp
├── pom.xml
└── README.md
```

## Contributing

1. Fork the repository.
2. Create a feature branch: `git checkout -b feature-name`.
3. Commit your changes: `git commit -m 'Add feature name'`.
4. Push to the branch: `git push origin feature-name`.
5. Open a pull request.


## Contact

For any queries or suggestions, please reach out to:
- **Email:** shivuakkur4153@gmail.com
- **GitHub:** [Shivuakkur](https://github.com/Shivuakkur)
