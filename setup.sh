#!/bin/bash

# Setup script for Kanbino login system
# Run this script to complete the installation

echo "========================================="
echo "Kanbino Login System Setup"
echo "========================================="
echo ""

echo "Step 1: Installing dependencies..."
bundle install

if [ $? -ne 0 ]; then
  echo "Error: Bundle install failed. Please check your Ruby installation."
  exit 1
fi

echo ""
echo "Step 2: Running database migrations..."
rails db:migrate

if [ $? -ne 0 ]; then
  echo "Error: Database migration failed."
  exit 1
fi

echo ""
echo "Step 3: Seeding the database with users..."
rails db:seed

if [ $? -ne 0 ]; then
  echo "Error: Database seeding failed."
  exit 1
fi

echo ""
echo "========================================="
echo "Setup completed successfully!"
echo "========================================="
echo ""
echo "Demo accounts created:"
echo "  - user1 / password123 (User)"
echo "  - user2 / password123 (User)"
echo "  - user3 / password123 (User)"
echo "  - admin / admin123 (Administrator)"
echo ""
echo "To start the application, run:"
echo "  rails server"
echo ""
echo "Then visit: http://localhost:3000"
echo "========================================="
