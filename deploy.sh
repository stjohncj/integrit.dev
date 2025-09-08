#!/bin/bash

# IntegritDev Firebase Deployment Script
# This script automates the build and deployment process

set -e  # Exit on any error

echo "🚀 IntegritDev Deployment Script"
echo "=================================="

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if Firebase CLI is installed
if ! command -v firebase &> /dev/null; then
    print_error "Firebase CLI not found. Please install it first:"
    echo "npm install -g firebase-tools"
    exit 1
fi

# Check if user is logged in
print_status "Checking Firebase authentication..."
if ! firebase projects:list &> /dev/null; then
    print_warning "Not logged into Firebase. Please run:"
    echo "firebase login"
    exit 1
fi

# Build the project
print_status "Building project for production..."
npm run build

if [ $? -eq 0 ]; then
    print_success "Build completed successfully"
else
    print_error "Build failed"
    exit 1
fi

# Check if project exists, create if it doesn't
print_status "Checking Firebase project..."
if ! firebase use integrit-dev &> /dev/null; then
    print_warning "Project 'integrit-dev' not found. Please check your Firebase Console."
    print_error "Make sure the project 'integrit-dev' exists and you have access to it."
    exit 1
else
    print_success "Using existing project 'integrit-dev'"
fi

# Deploy to Firebase
print_status "Deploying to Firebase Hosting..."
firebase deploy --only hosting

if [ $? -eq 0 ]; then
    echo ""
    print_success "🎉 Deployment completed successfully!"
    echo ""
    echo "Your site is now live at:"
    echo "• https://integrit-dev.web.app"
    echo "• https://integrit-dev.firebaseapp.com"
    echo ""
    echo "Next steps:"
    echo "1. Visit Firebase Console: https://console.firebase.google.com"
    echo "2. Add custom domain 'integrit.dev' in Hosting settings"
    echo "3. Configure DNS records as instructed by Firebase"
    echo ""
else
    print_error "Deployment failed"
    exit 1
fi