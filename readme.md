# DB Capstone Project

This repository contains the code and SQL scripts developed for the Little Lemon restaurant's database management system. The project includes various stored procedures, views, and queries to manage bookings, orders, and customer data efficiently.

## Table of Contents

- [Introduction](#introduction)
- [Project Structure](#project-structure)
- [Database Schema](#database-schema)
- [Key Features](#key-features)
- [How to Use](#how-to-use)
- [Contributing](#contributing)
- [License](#license)

## Introduction

The DB Capstone Project is designed to handle the booking and order management needs of Little Lemon restaurant. The project aims to optimize database operations through stored procedures, views, and efficient queries.

## Project Structure

The project is organized as follows:

- **/sql_scripts**: Contains all SQL scripts for database creation, table definitions, and stored procedures.
- **/docs**: Documentation and schema diagrams.
- **README.md**: Project documentation.

## Database Schema

The database includes the following key tables:

- **Customers**: Stores customer details.
- **Orders**: Contains order information, including total cost and order date.
- **Bookings**: Manages table reservations with booking date, time, and status.
- **BookingStatus**: Defines various statuses for bookings, such as 'Pending', 'Confirmed', 'Cancelled', and 'Completed'.

## Key Features

- **Stored Procedures**:
  - `AddBooking`: Adds a new booking record.
  - `UpdateBooking`: Updates an existing booking with a new date, time, and status.
  - `CheckBooking`: Checks if a table is already booked on a specific date.
  - `CancelOrder`: Cancels an order based on the order ID.
  
- **Views**:
  - `OrdersView`: Displays orders with quantities greater than 2.

- **Complex Queries**:
  - Retrieve customer contact details for orders greater than $60.
  - Fetch menu items ordered more than twice.

## How to Use

1. Clone the repository: 
    ```bash
    git clone https://github.com/DacostaD91/db-capstone-project.git
    ```

2. Navigate to the `/sql_scripts` directory and execute the scripts in your MySQL environment.

3. Use the provided stored procedures and queries to manage and analyze the restaurant's bookings and orders.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any changes or improvements.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
