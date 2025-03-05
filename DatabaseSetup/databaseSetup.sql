CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE hotels (
    hotel_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    zip_code VARCHAR(15) NOT NULL,
    price_per_night DECIMAL(10,2) NOT NULL,
    rating FLOAT(2,1) NOT NULL,
    amenities TEXT,
    contact_email VARCHAR(100) NOT NULL,
    contact_phone VARCHAR(15) NOT NULL,
    images TEXT,
    available_rooms INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
CREATE TABLE bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    check_in DATE NOT NULL,
    check_out DATE NOT NULL,
    adults INT NOT NULL,
    children INT NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    special_requests TEXT,
    hotel_id INT NOT NULL,
    additional_services TEXT,
    total_amount DECIMAL(10,2) NOT NULL,
    user_email VARCHAR(100) NOT NULL,
    booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (hotel_id) REFERENCES hotels(hotel_id) ON DELETE CASCADE,
    FOREIGN KEY (user_email) REFERENCES users(email) ON DELETE CASCADE
);

