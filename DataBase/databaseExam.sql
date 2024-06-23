CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password_hash VARCHAR(255),
    signup_date DATE,
    profile_info TEXT
);

CREATE TABLE InvestmentProducts (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    product_type VARCHAR(50),
    issuer VARCHAR(100),
    current_price DECIMAL(10, 2),
    historical_performance TEXT
);
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    user_id INT,
    product_id INT,
    transaction_date TIMESTAMP,
    transaction_type VARCHAR(10),
    transaction_amount DECIMAL(10, 2),
    quantity INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (product_id) REFERENCES InvestmentProducts(product_id)
);
CREATE TABLE Portfolios (
    portfolio_id INT PRIMARY KEY,
    user_id INT,
    total_asset_value DECIMAL(15, 2),
    portfolio_composition TEXT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
CREATE TABLE RealTimeData (
    product_id INT PRIMARY KEY,
    real_time_price DECIMAL(10, 2),
    real_time_volume INT,
    FOREIGN KEY (product_id) REFERENCES InvestmentProducts(product_id)
);
CREATE TABLE Notifications (
    notification_id INT PRIMARY KEY,
    user_id INT,
    content TEXT,
    type VARCHAR(50),
    created_at TIMESTAMP,
    is_read BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
