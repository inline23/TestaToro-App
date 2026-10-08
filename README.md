🐂 TestaToro

TestaToro is a modern e-commerce mobile application built with Flutter, designed for selling footwear and accessories with a smooth, scalable, and user-friendly shopping experience.

The project focuses on building a production-ready Flutter application while applying practical concepts such as state management, Supabase integration, reusable UI components, and clean project organization.

🚧 Status: In Development

📱 About the Project

TestaToro is an Egyptian e-commerce application for browsing and purchasing:

👟 Sneakers
👞 Shoes
👔 Belts
👛 Wallets

The application is being developed for Android and iOS using Flutter, with Supabase as the backend platform.

The goal is to create a complete shopping experience starting from browsing products and ending with order placement and tracking.

✨ Features
Customer App
🔐 Authentication
🏠 Home screen
🗂️ Product categories
🔎 Product search
🛍️ Product listing
📦 Product details
🎨 Product color selection
📏 Product size selection
🛒 Shopping cart
📍 Address management
💳 Checkout & payment
⭐ Product reviews
📦 Order management
🚚 Order tracking
👤 User profile
🌐 Arabic & English localization
🌓 Responsive modern UI
Product Management

Products support:

Multiple categories
Different sizes
Different colors
Product images
Stock management
Product pricing
Product availability
🛠️ Tech Stack
Frontend
Flutter
Dart
Flutter Bloc / Cubit
Backend
Supabase
PostgreSQL
Supabase Authentication
Supabase Storage
Row Level Security (RLS)
Development Tools
Git & GitHub
Figma
Google Stitch
VS Code / Android Studio
🏗️ Project Architecture

The project follows a simple and practical feature-based structure.

lib/
│
├── core/
│   ├── constants/
│   ├── theme/
│   ├── utils/
│   └── widgets/
│
├── features/
│   │
│   ├── auth/
│   │   ├── cubit/
│   │   ├── models/
│   │   ├── repos/
│   │   └── screens/
│   │
│   ├── products/
│   │   ├── cubit/
│   │   ├── models/
│   │   ├── repos/
│   │   └── screens/
│   │
│   ├── cart/
│   ├── orders/
│   ├── profile/
│   └── categories/
│
└── main.dart

The current approach intentionally avoids unnecessary architectural complexity while keeping responsibilities separated between:

UI
 ↓
Cubit
 ↓
Repository
 ↓
Supabase
🗄️ Backend

TestaToro uses Supabase for its backend infrastructure.

Main Database Tables
categories
products
colors
sizes
product_images
orders
order_items
profiles
Product Relationship
categories
     │
     │ 1 : N
     ▼
 products
     │
     ├──────────► product_images
     │
     ├──────────► colors
     │
     └──────────► sizes

Product images are stored using Supabase Storage, while their URLs are stored in the database.

🎨 Design

The application's UI was designed using Google Stitch, with a focus on:

Modern e-commerce UX
Consistent spacing
Reusable components
Clear product presentation
Simple navigation
Mobile-first design
Arabic RTL support
English LTR support

The final Flutter implementation follows the established Stitch design system rather than redesigning screens during development.

🌍 Localization

TestaToro is designed to support:

🇬🇧 English — LTR
🇪🇬 Arabic — RTL

The application structure allows additional languages to be added in the future.

🚀 Getting Started
1. Clone the repository
git clone https://github.com/YOUR_USERNAME/testa-toro.git
2. Navigate to the project
cd testa-toro
3. Install dependencies
flutter pub get
4. Configure Supabase

Create a Supabase project and configure your Flutter application with your Supabase project URL and anon/publishable key.

Example:

await Supabase.initialize(
  url: 'YOUR_SUPABASE_URL',
  anonKey: 'YOUR_SUPABASE_ANON_KEY',
);

⚠️ Never commit private keys, service-role keys, passwords, or other sensitive credentials to GitHub.

5. Run the application
flutter run
📂 Current Development Flow

The project is being developed feature by feature.

Each feature follows the general flow:

Design
   ↓
Flutter UI
   ↓
Model
   ↓
Repository
   ↓
Cubit
   ↓
Supabase
   ↓
Integration & Testing

The development process focuses on understanding and implementing each feature rather than relying on generated code without understanding the underlying architecture.

🧪 Development Goals

The project is being built with the following goals:

Improve Flutter development skills
Practice Bloc/Cubit state management
Build real-world Supabase integrations
Work with relational PostgreSQL databases
Handle product variants and inventory
Implement authentication and authorization
Build reusable Flutter components
Apply practical repository-based architecture
Create a production-quality mobile application
🗺️ Roadmap
Core

Flutter project setup

Supabase integration

Product database

Product repository

Product model

Product Cubit

Complete product management

Product image upload

Customer Experience

Authentication

Home

Categories

Search

Product details

Product variants

Cart

Checkout

Address management

Orders

Order tracking

Profile

Admin

Admin authentication

Product management

Category management

Inventory management

Order management

Dashboard & statistics

Polish

Arabic localization

English localization

RTL support

Error handling improvements

Loading & empty states

Performance optimization

Testing

Production release

🔐 Security

Supabase Row Level Security (RLS) is used to control access to database records.

The application should never expose:

Supabase service-role keys
Database passwords
Private API keys
Sensitive environment variables

Public/client-side credentials should only be used according to Supabase's recommended security model.

📸 Screenshots

Screenshots and application previews will be added as development progresses.

Coming Soon 🚀
🤝 Contributing

This project is currently developed as a personal learning and portfolio project.

Suggestions, feedback, and improvements are welcome.

If you would like to contribute:

git checkout -b feature/your-feature

Make your changes, commit them, and open a Pull Request.

📌 Project Status

TestaToro is currently under active development.

The project is being built incrementally, with new features and improvements added continuously.

👨‍💻 Developer

Waleed Mohamed

Flutter Developer

Focused on building modern mobile applications with Flutter, Supabase, and scalable application architecture.
