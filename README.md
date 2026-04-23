# CPSU Supply Office Inventory System v2.0

A web-based inventory management system built with Laravel for the Central Philippine State University (CPSU) Supply Office. It handles stock tracking, user management, client records, and reporting with role-based access control.

---

## Features

### Dashboard
- Overview of total items, total stock in, total stock out, and remaining stock
- Category summary with per-category stock breakdown
- Top 5 most requested items based on stock-out history
- Visual charts for inventory trends

### Current Stocks
- View all inventory items with details: name, brand, model, serial number, category, unit, price, and quantity
- Add new items to the catalog
- Edit and delete existing items
- Filter items by category (Office Supplies, ICT Office Supplies, Cleaning Supplies, Agronomic Supplies)
- Import items in bulk via CSV upload

### Stock In
- Record incoming stock with supplier/person name, workplace, quantity, and price
- Automatically updates item quantity and price
- View full stock-in history with filters by person and date
- Admin can delete stock-in history records

### Stock Out
- Record outgoing stock with recipient name, workplace, quantity, and remarks
- View stock-out history grouped by person
- Admin can delete stock-out history records
- Generates printable release slips per recipient

### Daily Reports
- Export inventory reports as CSV
- Category-based report: total items, stock in, stock out, and remaining per category
- Monthly report: daily breakdown of stock movement per item

### Clients
- Add, edit, and delete client records (name and workplace)
- Client list used as reference when recording stock-out transactions

### Accounts (Admin only)
- Create new user accounts with roles: Admin or Staff
- Edit existing user details and passwords
- Delete staff accounts
- Admins cannot modify or delete other admin accounts

### Security (Admin only)
- Block and unblock user accounts
- Blocked users are immediately logged out and denied access
- Set and update the admin confirmation code
- Database backup: create, download, and delete SQL backup files
- Database restore: import a previously exported SQL backup
- Activity log: view the last 200 actions performed by all users (action type, description, IP address, timestamp)

### Profile
- Upload and update profile picture
- Supported formats: JPEG, PNG, JPG, GIF

---

## Roles

| Role    | Access                                      |
|---------|---------------------------------------------|
| Admin   | Full access to all features                 |
| Staff   | Inventory operations, no admin-only panels  |
| Blocked | No access — redirected to login on attempt  |

---

## Tech Stack

- Backend: Laravel 11 (PHP)
- Frontend: Blade templates, vanilla JS
- Database: MySQL
- Charts: Chart.js

---

## Setup

1. Clone the repo and install dependencies:
   ```bash
   composer install
   npm install
   ```

2. Copy `.env.example` to `.env` and configure your database:
   ```bash
   cp .env.example .env
   php artisan key:generate
   ```

3. Run migrations:
   ```bash
   php artisan migrate
   ```

4. Serve the application:
   ```bash
   php artisan serve
   ```

> For local XAMPP setup, place the project under `htdocs` and access via `http://localhost/[folder]/public`.
