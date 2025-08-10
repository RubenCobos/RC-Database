---------------------------------------------------
-- RC's Custom Built PCs Product Ordering System --
---------------------------------------------------

-- Create Database

CREATE DATABASE OrderSystem;

GO

USE OrderSystem;

-- Create Tables

CREATE TABLE Customers
(
	CustomerID int PRIMARY KEY IDENTITY,
	FirstName varchar(25),
	LastName varchar(25),
	Address varchar(50),
	Phone char(12),
	Email varchar(50)
);

CREATE TABLE Products
(
	ProductID int PRIMARY KEY IDENTITY,
	Name varchar(50),
	Description varchar(250),
	Price money,
	Stock int
);

CREATE TABLE Components
(
	ComponentID int PRIMARY KEY IDENTITY,
	Type varchar(11) CHECK (Type IN ('Motherboard', 'CPU', 'RAM', 'Video Card')),
	Model varchar(50),
	Brand varchar(50),
	Specifications varchar(1000),
	Cost money
);

CREATE TABLE Orders
(
	OrderNumber int PRIMARY KEY IDENTITY,
	CustomerID int REFERENCES Customers (CustomerID),
	SaleAmount money,
	OrderDate date,
	Status smallint CHECK (Status IN (1, 2, 3, 4)),
);

CREATE TABLE OrderItems
(
	OrderNumber int REFERENCES Orders (OrderNumber),
	ProductID int REFERENCES Products (ProductID),
	Quantity int,
	PRIMARY KEY (OrderNumber, ProductID)
);

CREATE TABLE ProductComponents
(
	ProductID int REFERENCES Products (ProductID),
	ComponentID int REFERENCES Components (ComponentID),
	PRIMARY KEY (ProductID, ComponentID)
);

GO

-- Populate Tables

INSERT INTO Components VALUES ('Motherboard', 'Z570 Phantom', 'FalconTech', 'Mid-tier AM5 board with DDR5 support, PCIe 5.0, dual M.2 slots, and Wi-Fi 6E.', 179.99);
INSERT INTO Components VALUES ('Motherboard', 'X990 Elite', 'Nebula', 'High-end LGA 1800 board with PCIe 5.0, quad M.2 slots, 10Gb Ethernet, and premium cooling.', 529.99);
INSERT INTO Components VALUES ('CPU', 'R7 570X', 'OrionTech', '8-core, 16-thread Zen 5 processor with a 3.9GHz base and 5.1GHz boost, built for gaming and multitasking.', 249.99);
INSERT INTO Components VALUES ('CPU', 'X9 Ultra', 'ApexCore', '16-core, 32-thread powerhouse with 4.5GHz base and 5.8GHz boost, optimized for extreme workloads.', 749.99);
INSERT INTO Components VALUES ('RAM', 'Viper 32GB', 'HyperVolt', 'DDR5 memory kit with 5600MHz speed, CL36 latency, and aluminum heat spreaders.', 119.99);
INSERT INTO Components VALUES ('RAM', 'Xtreme 64GB', 'NovaCore', 'Ultra-fast DDR5 with 7200MHz speed, CL32 latency, graphene cooling, and RGB sync.', 349.99);
INSERT INTO Components VALUES ('Video Card', 'ArcStorm 3060X', 'FalconTech', '8GB GDDR6 card with 2000MHz boost, ray tracing cores, and dual-fan cooling.', 329.99);
INSERT INTO Components VALUES ('Video Card', 'Titan Xtreme 5090 Ultra', 'ApexCore', '24GB GDDR7 beast with 2650MHz boost, AI-enhanced rendering, and liquid cooling.', 1499.99);

INSERT INTO Products VALUES ('LightX', 'Mid-tier gaming & multitasking, solid performance.', 879.96, 251);
INSERT INTO Products VALUES ('UltraVision', 'Strong mid-range power with high-end GPU boost.', 1529.96, 372);
INSERT INTO Products VALUES ('TitanEdge', 'Balanced multitasking with expanded memory capacity.', 1109.96, 130);
INSERT INTO Products VALUES ('StormMaster', 'High-performance mid-tier build for creative workloads.', 1759.96, 76);
INSERT INTO Products VALUES ('NitroBoost', 'Entry-level high-end computing, strong CPU power.', 1179.96, 444);
INSERT INTO Products VALUES ('ApexDrive', 'Mid-tier base enhanced with extreme GPU capabilities.', 1829.96, 278);
INSERT INTO Products VALUES ('QuantumCore', 'Heavy multitasking rig with advanced RAM capacity.', 1409.96, 517);
INSERT INTO Products VALUES ('OverdriveX', 'Hybrid workstation/gaming setup with balanced power.', 2059.96, 117);
INSERT INTO Products VALUES ('PrimeX', 'High-end foundation with efficient processing power.', 1079.96, 248);
INSERT INTO Products VALUES ('TitanForce', 'Professional-grade multitasking with ultimate GPU boost.', 1729.96, 421);
INSERT INTO Products VALUES ('ZeroGravity', 'Memory-intensive creative powerhouse.', 1309.96, 169);
INSERT INTO Products VALUES ('DarkMatter', 'Elite gaming & workstation fusion with extreme capabilities.', 1959.96, 284);
INSERT INTO Products VALUES ('FusionDrive', 'Overclock-ready system optimized for peak performance.', 1379.96, 50);
INSERT INTO Products VALUES ('HyperNova', 'Ultra-high-speed powerhouse designed for rendering & AI workloads.', 2029.96, 300);
INSERT INTO Products VALUES ('FiniteX', 'AI-enhanced workstation with fluid multitasking performance.', 1609.96, 413);
INSERT INTO Products VALUES ('StrikeForce', 'Maximum power, designed for extreme gaming & professional work.', 2259.96, 465);

INSERT INTO ProductComponents VALUES (1, 1);
INSERT INTO ProductComponents VALUES (1, 3);
INSERT INTO ProductComponents VALUES (1, 5);
INSERT INTO ProductComponents VALUES (1, 7);
INSERT INTO ProductComponents VALUES (2, 1);
INSERT INTO ProductComponents VALUES (2, 3);
INSERT INTO ProductComponents VALUES (2, 5);
INSERT INTO ProductComponents VALUES (2, 8);
INSERT INTO ProductComponents VALUES (3, 1);
INSERT INTO ProductComponents VALUES (3, 3);
INSERT INTO ProductComponents VALUES (3, 6);
INSERT INTO ProductComponents VALUES (3, 7);
INSERT INTO ProductComponents VALUES (4, 1);
INSERT INTO ProductComponents VALUES (4, 3);
INSERT INTO ProductComponents VALUES (4, 6);
INSERT INTO ProductComponents VALUES (4, 8);
INSERT INTO ProductComponents VALUES (5, 1);
INSERT INTO ProductComponents VALUES (5, 4);
INSERT INTO ProductComponents VALUES (5, 5);
INSERT INTO ProductComponents VALUES (5, 7);
INSERT INTO ProductComponents VALUES (6, 1);
INSERT INTO ProductComponents VALUES (6, 4);
INSERT INTO ProductComponents VALUES (6, 5);
INSERT INTO ProductComponents VALUES (6, 8);
INSERT INTO ProductComponents VALUES (7, 1);
INSERT INTO ProductComponents VALUES (7, 4);
INSERT INTO ProductComponents VALUES (7, 6);
INSERT INTO ProductComponents VALUES (7, 7);
INSERT INTO ProductComponents VALUES (8, 1);
INSERT INTO ProductComponents VALUES (8, 4);
INSERT INTO ProductComponents VALUES (8, 6);
INSERT INTO ProductComponents VALUES (8, 8);
INSERT INTO ProductComponents VALUES (9, 2);
INSERT INTO ProductComponents VALUES (9, 3);
INSERT INTO ProductComponents VALUES (9, 5);
INSERT INTO ProductComponents VALUES (9, 7);
INSERT INTO ProductComponents VALUES (10, 2);
INSERT INTO ProductComponents VALUES (10, 3);
INSERT INTO ProductComponents VALUES (10, 5);
INSERT INTO ProductComponents VALUES (10, 8);
INSERT INTO ProductComponents VALUES (11, 2);
INSERT INTO ProductComponents VALUES (11, 3);
INSERT INTO ProductComponents VALUES (11, 6);
INSERT INTO ProductComponents VALUES (11, 7);
INSERT INTO ProductComponents VALUES (12, 2);
INSERT INTO ProductComponents VALUES (12, 3);
INSERT INTO ProductComponents VALUES (12, 6);
INSERT INTO ProductComponents VALUES (12, 8);
INSERT INTO ProductComponents VALUES (13, 2);
INSERT INTO ProductComponents VALUES (13, 4);
INSERT INTO ProductComponents VALUES (13, 5);
INSERT INTO ProductComponents VALUES (13, 7);
INSERT INTO ProductComponents VALUES (14, 2);
INSERT INTO ProductComponents VALUES (14, 4);
INSERT INTO ProductComponents VALUES (14, 5);
INSERT INTO ProductComponents VALUES (14, 8);
INSERT INTO ProductComponents VALUES (15, 2);
INSERT INTO ProductComponents VALUES (15, 4);
INSERT INTO ProductComponents VALUES (15, 6);
INSERT INTO ProductComponents VALUES (15, 7);
INSERT INTO ProductComponents VALUES (16, 2);
INSERT INTO ProductComponents VALUES (16, 4);
INSERT INTO ProductComponents VALUES (16, 6);
INSERT INTO ProductComponents VALUES (16, 8);

INSERT INTO Customers VALUES ('Azariah', 'Vostrov', '1824 Starlight Ave, Seattle, WA', '206-555-2391', 'azariah.vostrov@email.com');
INSERT INTO Customers VALUES ('Zephyr', 'Takacarro', '4759 Horizon Dr, San Diego, CA', '619-555-7412', 'zephyr.takacarro@email.com');
INSERT INTO Customers VALUES ('Lysondra', 'Veyron', '2933 Ember Way, Denver, CO', '303-555-6923', 'lysondra.veyron@email.com');
INSERT INTO Customers VALUES ('Druven', 'Lucent', '3174 Lightbrook Ln, Austin, TX', '512-555-8482', 'druven.lucent@email.com');
INSERT INTO Customers VALUES ('Cassius', 'Alaric', '1209 Skyline Rd, Miami, FL', '305-555-6271', 'cassius.alaric@email.com');
INSERT INTO Customers VALUES ('Chicha', 'Solhaven', '4821 Twilight Blvd, Portland, OR', '503-555-1938', 'chicha.solhaven@email.com');
INSERT INTO Customers VALUES ('Orion', 'Dawnmoor', '7590 Crescent St, Chicago, IL', '312-555-9821', 'orion.dawnmoor@email.com');
INSERT INTO Customers VALUES ('Elysia', 'Thornvale', '6214 Oak Trace, Boston, MA', '617-555-4387', 'elysia.thornvale@email.com');
INSERT INTO Customers VALUES ('Giro', 'Voss', '8357 Mystic Dr, Phoenix, AZ', '480-555-6729', 'Giro.voss@email.com');
INSERT INTO Customers VALUES ('Selene', 'Ardentis', '2940 Moonstone Ct, Nashville, TN', '615-555-3598', 'selene.ardentis@email.com');
INSERT INTO Customers VALUES ('Ronan', 'Blackyr', '1925 Obsidian Ave, New York, NY', '212-555-9273', 'ronan.blackyr@email.com');
INSERT INTO Customers VALUES ('Isolde', 'Nightwind', '6842 Eaglecrest Loop, Dallas, TX', '214-555-5136', 'isolde.nightwind@email.com');
INSERT INTO Customers VALUES ('Lucy', 'Whitlock', '4085 Iron Hollow Rd, Atlanta, GA', '404-555-8672', 'lucy.whitlock@email.com');
INSERT INTO Customers VALUES ('Vesper', 'Dumaris', '2271 Starborn Ct, Las Vegas, NV', '702-555-3945', 'vesper.dumaris@email.com');
INSERT INTO Customers VALUES ('Zaira', 'Starcrest', '5623 Dawnfire Blvd, Los Angeles, CA', '310-555-7984', 'zaira.starcrest@email.com');
INSERT INTO Customers VALUES ('Sylas', 'Emberthorn', '8312 Phoenix Rise, San Francisco, CA', '415-555-1457', 'sylas.emberthorn@email.com');
INSERT INTO Customers VALUES ('Calista', 'Drayden', '6291 Stormwatch St, Houston, TX', '713-555-2639', 'calista.drayden@email.com');
INSERT INTO Customers VALUES ('Theo', 'Lumen', '3548 Highnoon Row, Minneapolis, MN', '612-555-7183', 'theo.lumen@email.com');
INSERT INTO Customers VALUES ('Seraphine', 'Wraith', '7893 Entropy Rd, Philadelphia, PA', '215-555-8493', 'seraphine.wraith@email.com');
INSERT INTO Customers VALUES ('Xavier', 'Solstice', '2407 Solaris Ct, Orlando, FL', '407-555-6721', 'xavier.solstice@email.com');
INSERT INTO Customers VALUES ('Rowan', 'Emberise', '7358 Crest Ave, Kansas City, MO', '816-555-2418', 'rowan.emberise@email.com');
INSERT INTO Customers VALUES ('Talia', 'Blackthorn', '6184 Driftwood Pkwy, Detroit, MI', '313-555-3948', 'talia.blackthorn@email.com');
INSERT INTO Customers VALUES ('Alistair', 'Veyl', '5421 Nightshade Loop, Columbus, OH', '614-555-5392', 'alistair.veyl@email.com');
INSERT INTO Customers VALUES ('Elias', 'Hillside', '9023 Eclipse Way, Indianapolis, IN', '317-555-8135', 'elias.hillside@email.com');

INSERT INTO Orders VALUES (1, 10239.80, '2025-01-02', 3);
INSERT INTO Orders VALUES (2, 5939.88, '2025-01-05', 3);
INSERT INTO Orders VALUES (3, 6089.88, '2025-01-08', 3);
INSERT INTO Orders VALUES (4, 9759.80, '2025-01-12', 3);
INSERT INTO Orders VALUES (5, 8049.80, '2025-01-17', 3);
INSERT INTO Orders VALUES (6, 7919.80, '2025-01-23', 3);
INSERT INTO Orders VALUES (7, 4589.88, '2025-01-29', 3);
INSERT INTO Orders VALUES (8, 7569.80, '2025-02-06', 3);
INSERT INTO Orders VALUES (9, 6939.84, '2025-02-14', 3);
INSERT INTO Orders VALUES (10, 6829.88, '2025-02-25', 3);
INSERT INTO Orders VALUES (11, 7569.80, '2025-03-02', 3);
INSERT INTO Orders VALUES (12, 6149.80, '2025-03-09', 3);
INSERT INTO Orders VALUES (13, 5739.88, '2025-03-17', 3);
INSERT INTO Orders VALUES (14, 9789.88, '2025-03-28', 3);
INSERT INTO Orders VALUES (15, 9619.84, '2025-04-03', 3);
INSERT INTO Orders VALUES (16, 9799.80, '2025-04-11', 3);
INSERT INTO Orders VALUES (17, 7789.80, '2025-04-18', 3);
INSERT INTO Orders VALUES (18, 7739.80, '2025-04-25', 3);
INSERT INTO Orders VALUES (19, 8549.80, '2025-04-30', 2);
INSERT INTO Orders VALUES (20, 9619.84, '2025-05-02', 2);
INSERT INTO Orders VALUES (21, 8649.80, '2025-05-03', 2);
INSERT INTO Orders VALUES (22, 7979.80, '2025-05-03', 1);
INSERT INTO Orders VALUES (23, 7249.80, '2025-05-04', 1);
INSERT INTO Orders VALUES (10, 6789.80, '2025-05-04', 1);
INSERT INTO Orders VALUES (24, 9129.80, '2025-05-04', 1);

INSERT INTO OrderItems VALUES (1, 16, 2);
INSERT INTO OrderItems VALUES (1, 5, 3);
INSERT INTO OrderItems VALUES (2, 3, 1);
INSERT INTO OrderItems VALUES (2, 9, 2);
INSERT INTO OrderItems VALUES (2, 15, 1);
INSERT INTO OrderItems VALUES (3, 14, 3);
INSERT INTO OrderItems VALUES (4, 1, 2);
INSERT INTO OrderItems VALUES (4, 13, 1);
INSERT INTO OrderItems VALUES (4, 2, 2);
INSERT INTO OrderItems VALUES (5, 15, 5);
INSERT INTO OrderItems VALUES (6, 10, 4);
INSERT INTO OrderItems VALUES (6, 7, 1);
INSERT INTO OrderItems VALUES (7, 2, 3);
INSERT INTO OrderItems VALUES (8, 12, 2);
INSERT INTO OrderItems VALUES (8, 8, 2);
INSERT INTO OrderItems VALUES (8, 5, 1);
INSERT INTO OrderItems VALUES (9, 9, 1);
INSERT INTO OrderItems VALUES (9, 6, 3);
INSERT INTO OrderItems VALUES (10, 4, 2);
INSERT INTO OrderItems VALUES (10, 14, 1);
INSERT INTO OrderItems VALUES (11, 5, 2);
INSERT INTO OrderItems VALUES (11, 11, 3);
INSERT INTO OrderItems VALUES (12, 13, 1);
INSERT INTO OrderItems VALUES (12, 8, 1);
INSERT INTO OrderItems VALUES (12, 3, 2);
INSERT INTO OrderItems VALUES (13, 15, 1);
INSERT INTO OrderItems VALUES (13, 3, 1);
INSERT INTO OrderItems VALUES (13, 16, 1);
INSERT INTO OrderItems VALUES (14, 16, 3);
INSERT INTO OrderItems VALUES (14, 2, 1);
INSERT INTO OrderItems VALUES (15, 7, 2);
INSERT INTO OrderItems VALUES (15, 10, 2);
INSERT INTO OrderItems VALUES (16, 12, 5);
INSERT INTO OrderItems VALUES (17, 6, 3);
INSERT INTO OrderItems VALUES (17, 11, 2);
INSERT INTO OrderItems VALUES (18, 5, 4);
INSERT INTO OrderItems VALUES (18, 15, 1);
INSERT INTO OrderItems VALUES (19, 3, 2);
INSERT INTO OrderItems VALUES (19, 9, 1);
INSERT INTO OrderItems VALUES (19, 7, 2);
INSERT INTO OrderItems VALUES (20, 14, 4);
INSERT INTO OrderItems VALUES (20, 4, 1);
INSERT INTO OrderItems VALUES (21, 7, 1);
INSERT INTO OrderItems VALUES (21, 16, 1);
INSERT INTO OrderItems VALUES (21, 13, 2);
INSERT INTO OrderItems VALUES (22, 1, 2);
INSERT INTO OrderItems VALUES (22, 10, 2);
INSERT INTO OrderItems VALUES (22, 11, 1);
INSERT INTO OrderItems VALUES (23, 12, 1);
INSERT INTO OrderItems VALUES (23, 2, 1);
INSERT INTO OrderItems VALUES (23, 6, 2);
INSERT INTO OrderItems VALUES (24, 5, 3);
INSERT INTO OrderItems VALUES (24, 11, 2);
INSERT INTO OrderItems VALUES (25, 9, 2);
INSERT INTO OrderItems VALUES (25, 8, 1);
INSERT INTO OrderItems VALUES (25, 14, 1);

GO

-- Create Indexes

CREATE INDEX IX_CustomerID ON Orders (CustomerID);
CREATE INDEX IX_OrderItems ON OrderItems (OrderNumber, ProductID);
CREATE INDEX IX_ProductComponents ON ProductComponents (ProductID, ComponentID);

GO

-- End Script
