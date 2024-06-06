# BiteBox: A Food Delivery Application

Welcome to BiteBox, a comprehensive food delivery application designed to streamline the process of ordering food, managing restaurant menus, and coordinating deliveries. This README file provides an overview of the project, its key features, the tech stack used, and how to set up and run the application.

## Table of Contents

1. [Overview](#overview)
2. [Key Features](#key-features)
3. [Tech Stack](#tech-stack)
4. [Installation](#installation)
5. [Usage](#usage)
6. [Contributors](#contributors)
7. [Contact](#contact)

## Overview

BiteBox is developed as a semester project for the Database Course. The project is a collaborative effort by Laiba Ijaz, Hissan Butt, and Naila Awan. BiteBox aims to enhance the food delivery experience by providing a user-friendly interface for customers, restaurants, and riders, along with robust administrative controls.

## Key Features

- *Customer Interaction*: Customers can browse restaurants, place orders, and view their order history.
- *Restaurant Management*: Restaurants can manage their menus, receive orders, and edit their profiles.
- *Rider Coordination*: Riders can access customer and order information and update the order status upon delivery.
- *Contact Forms*: All user accounts have a 'Contact Us' form that emails queries directly to the admins.
- *Admin Control*: Admins can manage customer, rider, and restaurant accounts, edit or delete accounts, and handle rider payments.

## Tech Stack

- *Frontend*: HTML, CSS, JavaScript
- *Backend*: ASP.NET Framework using C#
- *Database*: SQL
- *Version Control*: Git, GitHub

## Installation

### Prerequisites

- [Visual Studio](https://visualstudio.microsoft.com/)
- [SQL Server](https://www.microsoft.com/en-us/sql-server)
- [.NET Framework](https://dotnet.microsoft.com/)

### Steps

1. *Clone the repository*:
   sh
   git clone https://github.com/yourusername/bitebox.git
   

2. *Open the solution*:
   Open the BiteBox.sln file in Visual Studio.

3. *Restore NuGet packages*:
   In Visual Studio, navigate to Tools > NuGet Package Manager > Package Manager Console and run:
   sh
   Update-Package -reinstall
   

4. *Set up the database*:
   - Create a new SQL Server database.
   - Run the SQL scripts located in the Database folder to set up the database schema and initial data.

5. *Update the connection string*:
   Update the connection string in the web.config file to match your SQL Server database settings.

6. *Run the application*:
   Press F5 in Visual Studio to build and run the Home.aspx file in the Main folder.

## Usage

### Customers

- *Browse Restaurants*: View a list of available restaurants.
- *Place Orders*: Select menu items and place orders.
- *Order History*: View past orders and their status.

### Restaurants

- *Manage Menus*: Add, update, or delete menu items.
- *Receive Orders*: View and process incoming orders.
- *Edit Profile*: Update restaurant information.

### Riders

- *View Orders*: Access customer and order information.
- *Update Status*: Mark orders as delivered.

### Admins

- *Manage Accounts*: Add, edit, or delete customer, rider, and restaurant accounts.
- *Handle Payments*: Process payments to riders.

## Contributors

- *Laiba Ijaz*
- *Hissan Butt*
- *Naila Awan*

## Contact

For any queries or issues, please contact us at naila.awan.2005@gmail.com.

Thank you for using BiteBox!
