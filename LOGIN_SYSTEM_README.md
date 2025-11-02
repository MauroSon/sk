# Kanbino Login System

A simple authentication system with user roles (regular users and administrators) built with Ruby on Rails 8.

## Features

- ✅ User authentication with username and password
- ✅ BCrypt password encryption
- ✅ Session-based authentication
- ✅ Role-based access (User and Administrator)
- ✅ 3 regular users + 1 administrator account
- ✅ Modern, responsive UI design
- ✅ Flash messages for user feedback
- ✅ Protected dashboard routes

## Demo Accounts

After running the setup, you can login with these accounts:

| Username | Password    | Role          |
|----------|-------------|---------------|
| user1    | password123 | User          |
| user2    | password123 | User          |
| user3    | password123 | User          |
| admin    | admin123    | Administrator |

## Installation & Setup

### Quick Setup

Run the setup script to install dependencies, migrate the database, and seed users:

```bash
./setup.sh
```

### Manual Setup

If you prefer to run commands individually:

```bash
# Install dependencies
bundle install

# Create and migrate database
rails db:migrate

# Seed the database with demo users
rails db:seed

# Start the server
rails server
```

Then visit: [http://localhost:3000](http://localhost:3000)

## Project Structure

### Models

- **User** (`app/models/user.rb`)
  - Fields: `username`, `password_digest`, `role`
  - Uses `has_secure_password` for authentication
  - Validations for username uniqueness and password presence
  - Role can be either "user" or "admin"

### Controllers

- **SessionsController** (`app/controllers/sessions_controller.rb`)
  - `new`: Display login form
  - `create`: Handle login and create session
  - `destroy`: Handle logout and clear session

- **DashboardController** (`app/controllers/dashboard_controller.rb`)
  - `index`: Protected dashboard page (requires login)

- **ApplicationController** (`app/controllers/application_controller.rb`)
  - Helper methods: `current_user`, `logged_in?`, `admin?`, `require_login`
  - Available to all controllers and views

### Views

- **Login Page** (`app/views/sessions/new.html.erb`)
  - Clean, centered login form
  - Shows demo account credentials
  - Flash messages for errors

- **Dashboard** (`app/views/dashboard/index.html.erb`)
  - Personalized welcome message
  - Role badge (User/Administrator)
  - Admin-specific panel with user statistics
  - User-specific panel with account information
  - Logout button

- **Layout** (`app/views/layouts/application.html.erb`)
  - Flash message display system
  - Consistent styling across all pages

### Routes

```ruby
root "sessions#new"           # Login page (homepage)
get "login"                   # Login page
post "login"                  # Handle login
delete "logout"               # Handle logout
get "dashboard"               # User dashboard (protected)
```

### Styling

All styles are in `app/assets/stylesheets/application.css`:

- Modern gradient background
- Card-based UI design
- Responsive layout (mobile-friendly)
- Smooth animations and transitions
- Flash message styling
- Admin vs User visual differentiation

## User Flow

1. **Visit Homepage** → Redirected to login page
2. **Enter Credentials** → Username and password
3. **Authentication** → System verifies credentials
4. **Success** → Redirected to dashboard with welcome message
5. **Dashboard** → Different views for users vs administrators
6. **Logout** → Returns to login page

## Security Features

- ✅ **Password Encryption**: BCrypt hashing via `has_secure_password`
- ✅ **CSRF Protection**: Rails default CSRF tokens
- ✅ **Session Management**: Secure session-based authentication
- ✅ **Protected Routes**: `before_action :require_login` on dashboard
- ✅ **Password Validation**: Minimum 6 characters
- ✅ **Username Uniqueness**: Database constraint + model validation

## Admin Features

When logged in as an administrator, the dashboard shows:

- Total number of users in the system
- Number of administrators
- Number of regular users
- Administrative badge and distinct styling

## Regular User Features

When logged in as a regular user, the dashboard shows:

- Account information (username, role, member since date)
- User badge
- Standard user interface

## Database Schema

### Users Table

```ruby
create_table :users do |t|
  t.string :username, null: false
  t.string :password_digest, null: false
  t.string :role, default: "user", null: false
  t.timestamps
end

add_index :users, :username, unique: true
```

## Technologies Used

- **Ruby on Rails 8.0.2**
- **SQLite3** - Database
- **BCrypt** - Password encryption
- **Hotwire (Turbo/Stimulus)** - Modern JavaScript framework
- **Importmap** - JavaScript module management

## File Changes Summary

### Files Created (8):
1. `db/migrate/20251009164611_create_users.rb` - Users table migration
2. `app/models/user.rb` - User model with authentication
3. `app/controllers/sessions_controller.rb` - Login/logout controller
4. `app/controllers/dashboard_controller.rb` - Dashboard controller
5. `app/views/sessions/new.html.erb` - Login form view
6. `app/views/dashboard/index.html.erb` - Dashboard view
7. `setup.sh` - Automated setup script
8. `LOGIN_SYSTEM_README.md` - This documentation

### Files Modified (5):
1. `Gemfile` - Enabled bcrypt gem
2. `db/seeds.rb` - Added demo users
3. `app/controllers/application_controller.rb` - Added authentication helpers
4. `config/routes.rb` - Added authentication routes
5. `app/assets/stylesheets/application.css` - Added comprehensive styling
6. `app/views/layouts/application.html.erb` - Added flash message display

## Testing the Application

### Test Login Flow

1. Start the server: `rails server`
2. Visit: `http://localhost:3000`
3. Login with `user1` / `password123`
4. Verify you see the user dashboard
5. Logout
6. Login with `admin` / `admin123`
7. Verify you see the admin dashboard with statistics

### Test Protected Routes

1. Without logging in, try to visit: `http://localhost:3000/dashboard`
2. You should be redirected to login with an alert message

### Test Invalid Credentials

1. Try to login with incorrect username/password
2. You should see an error message: "Invalid username or password"

## Extending the System

### Adding New Users

You can add users via Rails console:

```ruby
rails console

User.create!(
  username: "newuser",
  password: "password123",
  password_confirmation: "password123",
  role: "user"
)
```

### Adding Admin Privileges

To make an existing user an admin:

```ruby
rails console

user = User.find_by(username: "user1")
user.update(role: "admin")
```

### Adding More Features

Some ideas for extending this system:

- Email/password reset functionality
- User profile editing
- Account registration page
- Remember me functionality
- Two-factor authentication
- Activity logging
- User management interface (for admins)

## Troubleshooting

### Bundle Install Fails

Make sure you have the correct Ruby version installed:
```bash
ruby --version  # Should be 3.4.1 or compatible
```

### Database Issues

Reset the database:
```bash
rails db:drop
rails db:create
rails db:migrate
rails db:seed
```

### Can't Login

Make sure the database was seeded:
```bash
rails db:seed
```

Check users in console:
```bash
rails console
User.all
```

## License

This is a demo authentication system for the Kanbino project.
