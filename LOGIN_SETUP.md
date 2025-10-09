# Login System Setup Guide

This guide will help you set up and run the login system with 3 users and 1 administrator.

## Setup Instructions

### 1. Install Dependencies
```bash
bundle install
```

### 2. Setup Database
```bash
# Create the database
rails db:create

# Run migrations
rails db:migrate

# Seed the database with test users
rails db:seed
```

### 3. Start the Server
```bash
rails server
```

### 4. Access the Application
Open your browser and navigate to:
```
http://localhost:3000
```

## Test Accounts

The system comes with 4 pre-configured accounts:

### Administrator Account
- **Username:** `admin`
- **Password:** `admin123`
- **Privileges:** Full admin access with user statistics

### Regular User Accounts
1. **User 1**
   - **Username:** `user1`
   - **Password:** `password1`

2. **User 2**
   - **Username:** `user2`
   - **Password:** `password2`

3. **User 3**
   - **Username:** `user3`
   - **Password:** `password3`

## Features

### Login Page
- Clean, modern interface with gradient background
- Form validation
- Test account credentials displayed for convenience
- Error and success message handling

### Dashboard
- Personalized welcome message
- User information display (username, role, creation date)
- Role-based content:
  - **Admin users** see system statistics (total users, admins, regular users)
  - **Regular users** see standard user access message
- Secure logout functionality

### Security Features
- Passwords encrypted using bcrypt
- Session-based authentication
- Protected routes requiring login
- Admin-only access controls

## Routes

- `GET /` or `GET /login` - Login page
- `POST /login` - Process login
- `DELETE /logout` - Logout
- `GET /dashboard` - Dashboard (requires authentication)

## File Structure

### Controllers
- `app/controllers/application_controller.rb` - Authentication helpers
- `app/controllers/sessions_controller.rb` - Login/logout logic
- `app/controllers/dashboard_controller.rb` - Dashboard display

### Models
- `app/models/user.rb` - User model with secure password

### Views
- `app/views/sessions/new.html.erb` - Login form
- `app/views/dashboard/index.html.erb` - Dashboard

### Database
- `db/migrate/20251009000001_create_users.rb` - Users table migration
- `db/seeds.rb` - Test user data

## Testing the System

1. **Test Login**
   - Navigate to http://localhost:3000
   - Try logging in with one of the test accounts
   - Verify successful redirect to dashboard

2. **Test Authentication**
   - Try accessing http://localhost:3000/dashboard without logging in
   - Verify redirect to login page

3. **Test Admin Features**
   - Login as admin (admin/admin123)
   - Verify admin section shows user statistics

4. **Test Regular User**
   - Login as user1, user2, or user3
   - Verify regular user section is displayed

5. **Test Logout**
   - Click the logout button
   - Verify redirect to login page
   - Try accessing dashboard again (should redirect to login)

## Troubleshooting

### Database Issues
If you encounter database issues, try:
```bash
rails db:drop
rails db:create
rails db:migrate
rails db:seed
```

### Bcrypt Not Installed
If you get bcrypt errors:
```bash
bundle install
```

### Port Already in Use
If port 3000 is in use:
```bash
rails server -p 3001
```

## Development Notes

- Uses Rails 8.0.2+
- SQLite3 database
- bcrypt for password encryption
- Session-based authentication (no external auth gems)
- Responsive CSS included in views
