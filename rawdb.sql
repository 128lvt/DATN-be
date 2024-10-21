
-- Tạo bảng USER
CREATE TABLE USERS (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    Username NVARCHAR(50) NOT NULL,
    [Password] NVARCHAR(50) NOT NULL,
    FullName NVARCHAR(100),
    Email NVARCHAR(100),
    Phone NVARCHAR(20),
	[Role] BIT
);

-- Tạo bảng CATEGORY
CREATE TABLE CATEGORIES (
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
    [Name] NVARCHAR(50) NOT NULL
-- Tạo bảng PRODUCT
CREATE TABLE PRODUCTS (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    [Name] NVARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    CategoryID INT,
    QuantityInStock INT,
	ImagePath NVARCHAR(MAX)
    FOREIGN KEY (CategoryID) REFERENCES CATEGORIES(CategoryID) ON DELETE CASCADE ON UPDATE CASCADE
-- Tạo bảng CART
CREATE TABLE CARTS (
    CartID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (UserID) REFERENCES USERS(UserID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES PRODUCTS(ProductID) ON DELETE CASCADE ON UPDATE CASCADE
-- Tạo bảng ORDER
CREATE TABLE ORDERS (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES USERS(UserID) ON DELETE CASCADE ON UPDATE CASCADE
-- Tạo bảng ORDER_ITEM
CREATE TABLE ORDER_ITEMS (
    OrderID INT,
    FOREIGN KEY (OrderID) REFERENCES ORDERS(OrderID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES PRODUCTS(ProductID) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (OrderID, ProductID)
-- Tạo bảng PAYMENT
CREATE TABLE PAYMENTS (
    PaymentID INT IDENTITY(1,1) PRIMARY KEY,
    PaymentMethod NVARCHAR(50),
    Amount DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES ORDERS(OrderID) ON DELETE CASCADE ON UPDATE CASCADE
-- Tạo bảng REVIEW
CREATE TABLE REVIEWS (
    ReviewID INT IDENTITY(1,1) PRIMARY KEY,
    Rating INT,
    Comment TEXT,
-- Tạo bảng PROMOTION
CREATE TABLE PROMOTIONS (
    PromotionID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName NVARCHAR(100),
    DiscountPercentage DECIMAL(5, 2),
    StartDate DATE,
    EndDate DATE,
INSERT INTO [USER] (Username, [Password], FullName, Email, Phone, [Role])
VALUES ('john_doe', '123456', 'John Doe', 'john.doe@example.com', '123456789',1),
       ('jane_smith', 'abcdef', 'Jane Smith', 'jane.smith@example.com', '987654321',0);
[Database Types_1]
JDBC Driver Class=oracle.jdbc.OracleDriver
JDBC URL=jdbc:oracle:thin:@<hostname>:<Port:1521>:<SID>
Name=Oracle 8i
DDL Generator=ca.sqlpower.architect.ddl.Oracle8DDLGenerator
Supports Updatable Result Sets=True
ca.sqlpower.architect.etl.kettle.connectionType=Oracle
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_0=BIT, BIT, -7, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_1=CHAR, CHAR, 1, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_2=BINARY, BINARY, -2, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_3=VARBINARY, VARBINARY, -3, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_4=RAW, VARBINARY, -3, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_5=VARCHAR, VARCHAR, 12, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_6=VARCHAR2,VARCHAR, 12, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_7=NVARCHAR2,NVARCHAR, 12, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_8=BLOB, BLOB, 2004, false,false,false,false,false,false,false,false
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_9=CLOB, CLOB, 2005, false,false,false,false,false,false,false,false
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_10=BIGINT, BIGINT, -5, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_11=DECIMAL, DECIMAL, 3, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_12=DOUBLE, DOUBLE, 8, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_13=FLOAT, FLOAT, 6, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_14=INTEGER, INTEGER, 4, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_15=NUMERIC, NUMERIC, 2, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_16=NUMBER,  NUMERIC, 2, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_17=REAL, REAL, 7, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_18=SMALLINT, SMALLINT, 5, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_19=TINYINT, TINYINT, -6, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_20=INTERVALDS, TINYINT, -6, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_21=INTERVALYM, TINYINT, -6, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_22=TIME, TIME, 92, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_23=TIMESTAMP, TIMESTAMP, 93, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_24=TIMESTAMP WITH LOCAL TIME ZONE, TIMESTAMP, 93, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_25=TIMESTAMP WITH TIME ZONE, TIMESTAMP, 93, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_26=DATE, DATE, 91, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_27=LONG, LONGVARCHAR, -1, false,false,false,false,false,false,false,false
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_28=LONG RAW, LONGVARBINARY, -4, false,false,false,false,false,false,false,false
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_29=STRUCT, LONGVARBINARY, -4, false,false,false,false,false,false,false,false
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_30=ARRAY, LONGVARBINARY, -4, false,false,false,false,false,false,false,false
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_31=REF, LONGVARBINARY, -4, false,false,false,false,false,false,false,false
ca.sqlpower.architect.profile.ColumnProfileResult$StringLengthSQLFunction=LENGTH(:)
ca.sqlpower.architect.profile.ColumnProfileResult$AverageSQLFunction=AVG(:)
ca.sqlpower.architect.profile.ColumnProfileResult$CaseWhenNullSQLFunction=DECODE(:,NULL,:)
ca.sqlpower.sqlobject.SQLIndex.IndexType_0=CTXCAT
ca.sqlpower.sqlobject.SQLIndex.IndexType_1=BTREE
ca.sqlpower.sqlobject.SQLIndex.IndexType_2=BITMAP
ca.sqlpower.sqlobject.SQLIndex.IndexType_3=FUNCTION-BASED
ca.sqlpower.sqlobject.SQLIndex.IndexType_4=IOT - TOP
ca.sqlpower.sqlobject.SQLIndex.IndexType_5=DOMAIN
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_0=433cc8af-284d-4abb-8ef7-08ebcb34dbf1,NUMBER,VARIABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_1=fc731466-848e-411a-82af-e7f5e1d504bb,RAW,VARIABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_2=936cd049-d1df-44fc-ab05-b47cabe09060,NUMBER,VARIABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_3=5c50e616-a448-40e1-abcd-5bfc04dcc607,BLOB,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_4=a26374aa-3026-4bb8-b564-eb2e186dfa5d,NUMBER,VARIABLE,VARIABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_5=67ddc63f-5541-4dd1-9236-632d9d155e80,CHAR,VARIABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_6=cc1304ea-628a-4fc5-a84a-06ba14759152,NUMBER,VARIABLE,VARIABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_7=4fc90970-b2e5-41dd-911c-cc605d87e7a8,NUMBER,VARIABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_8=63b011c7-c81f-4c75-8271-632b3c87f727,NUMBER,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_9=83c27f1a-f56c-4e2c-ae53-18e02ff499af,LONG RAW,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_10=9a814859-ab26-4acd-9415-ea82291bcac1,LONG,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_11=115245ce-612c-4d6a-b559-6dd903dd959a,NUMBER,VARIABLE,VARIABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_12=8fe516a5-9833-4170-9572-50e78bbf221f,NUMBER,VARIABLE,VARIABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_13=69fb547f-e14c-4748-9746-4c0e9e94eb52,NUMBER,VARIABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_14=10d6960f-169d-47c2-860a-37341342b1d5,DATE,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_15=6497d8de-0e00-40d6-a42e-e2adca83be64,DATE,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_16=608a1d2c-c960-44ac-b1f3-503aba0a5b7b,NUMBER,VARIABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_17=f332925d-2b1a-4a8a-b22d-90b05d4f7ebb,LONG RAW,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_18=831ac2d4-0e65-47ec-a0b7-62b7f6b8760a,VARCHAR2,VARIABLE,NOT_APPLICABLE
[Database Types_2]
JDBC Driver Class=oracle.jdbc.OracleDriver
JDBC URL=jdbc:oracle:thin:@<hostname>:<Port:1521>:<SID>
Name=Oracle 9i
Supports Updatable Result Sets=True
DDL Generator=ca.sqlpower.architect.ddl.Oracle9PlusDDLGenerator
ca.sqlpower.architect.etl.kettle.connectionType=Oracle
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_0=BIT, BIT, -7, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_1=CHAR, CHAR, 1, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_2=BINARY, BINARY, -2, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_3=VARBINARY, VARBINARY, -3, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_4=RAW, VARBINARY, -3, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_5=VARCHAR, VARCHAR, 12, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_6=VARCHAR2,VARCHAR, 12, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_7=NVARCHAR2,NVARCHAR, 12, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_8=BLOB, BLOB, 2004, false,false,false,false,false,false,false,false
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_9=CLOB, CLOB, 2005, false,false,false,false,false,false,false,false
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_10=BIGINT, BIGINT, -5, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_11=DECIMAL, DECIMAL, 3, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_12=DOUBLE, DOUBLE, 8, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_13=FLOAT, FLOAT, 6, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_14=INTEGER, INTEGER, 4, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_15=NUMERIC, NUMERIC, 2, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_16=NUMBER,  NUMERIC, 2, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_17=REAL, REAL, 7, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_18=SMALLINT, SMALLINT, 5, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_19=TINYINT, TINYINT, -6, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_20=INTERVALDS, TINYINT, -6, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_21=INTERVALYM, TINYINT, -6, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_22=TIME, TIME, 92, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_23=TIMESTAMP, TIMESTAMP, 93, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_24=TIMESTAMP WITH LOCAL TIME ZONE, TIMESTAMP, 93, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_25=TIMESTAMP WITH TIME ZONE, TIMESTAMP, 93, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_26=DATE, DATE, 91, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_27=LONG, LONGVARCHAR, -1, false,false,false,false,false,false,false,false
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_28=LONG RAW, LONGVARBINARY, -4, false,false,false,false,false,false,false,false
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_29=STRUCT, LONGVARBINARY, -4, false,false,false,false,false,false,false,false
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_30=ARRAY, LONGVARBINARY, -4, false,false,false,false,false,false,false,false
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_31=REF, LONGVARBINARY, -4, false,false,false,false,false,false,false,false
ca.sqlpower.architect.profile.ColumnProfileResult$StringLengthSQLFunction=LENGTH(:)
ca.sqlpower.architect.profile.ColumnProfileResult$AverageSQLFunction=AVG(:)
ca.sqlpower.architect.profile.ColumnProfileResult$CaseWhenNullSQLFunction=DECODE(:,NULL,:)
ca.sqlpower.sqlobject.SQLIndex.IndexType_0=CTXCAT
ca.sqlpower.sqlobject.SQLIndex.IndexType_1=BTREE
ca.sqlpower.sqlobject.SQLIndex.IndexType_2=BITMAP
ca.sqlpower.sqlobject.SQLIndex.IndexType_3=FUNCTION-BASED
ca.sqlpower.sqlobject.SQLIndex.IndexType_4=IOT - TOP
ca.sqlpower.sqlobject.SQLIndex.IndexType_5=DOMAIN
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_0=433cc8af-284d-4abb-8ef7-08ebcb34dbf1,NUMBER,VARIABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_1=fc731466-848e-411a-82af-e7f5e1d504bb,RAW,VARIABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_2=936cd049-d1df-44fc-ab05-b47cabe09060,NUMBER,VARIABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_3=5c50e616-a448-40e1-abcd-5bfc04dcc607,BLOB,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_4=a26374aa-3026-4bb8-b564-eb2e186dfa5d,NUMBER,VARIABLE,VARIABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_5=cc1304ea-628a-4fc5-a84a-06ba14759152,NUMBER,VARIABLE,VARIABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_6=4fc90970-b2e5-41dd-911c-cc605d87e7a8,NUMBER,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_7=63b011c7-c81f-4c75-8271-632b3c87f727,NUMBER,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_8=83c27f1a-f56c-4e2c-ae53-18e02ff499af,LONG RAW,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_9=9a814859-ab26-4acd-9415-ea82291bcac1,LONG,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_10=0b8db85e-251b-4be0-8205-4d74362105cb,NCLOB,VARIABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_11=115245ce-612c-4d6a-b559-6dd903dd959a,NUMBER,VARIABLE,VARIABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_12=8fe516a5-9833-4170-9572-50e78bbf221f,NUMBER,VARIABLE,VARIABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_13=69fb547f-e14c-4748-9746-4c0e9e94eb52,NUMBER,VARIABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_14=10d6960f-169d-47c2-860a-37341342b1d5,DATE,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_15=608a1d2c-c960-44ac-b1f3-503aba0a5b7b,NUMBER,VARIABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_16=f332925d-2b1a-4a8a-b22d-90b05d4f7ebb,LONG RAW,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_17=831ac2d4-0e65-47ec-a0b7-62b7f6b8760a,VARCHAR2,VARIABLE,NOT_APPLICABLE
[Database Types_3]
JDBC Driver Class=oracle.jdbc.OracleDriver
JDBC URL=jdbc:oracle:thin:@<hostname>:<Port:1521>:<SID>
Name=Oracle 10g
Supports Updatable Result Sets=True
DDL Generator=ca.sqlpower.architect.ddl.Oracle9PlusDDLGenerator
ca.sqlpower.architect.etl.kettle.connectionType=Oracle
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_0=BIT, BIT, -7, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_1=CHAR, CHAR, 1, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_2=BINARY, BINARY, -2, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_3=VARBINARY, VARBINARY, -3, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_4=RAW, VARBINARY, -3, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_5=VARCHAR, VARCHAR, 12, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_6=VARCHAR2,VARCHAR, 12, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_7=NVARCHAR2,NVARCHAR, 12, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_8=BLOB, BLOB, 2004, false,false,false,false,false,false,false,false
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_9=CLOB, CLOB, 2005, false,false,false,false,false,false,false,false
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_10=BIGINT, BIGINT, -5, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_11=DECIMAL, DECIMAL, 3, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_12=DOUBLE, DOUBLE, 8, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_13=FLOAT, FLOAT, 6, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_14=INTEGER, INTEGER, 4, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_15=NUMERIC, NUMERIC, 2, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_16=NUMBER,  NUMERIC, 2, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_17=REAL, REAL, 7, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_18=SMALLINT, SMALLINT, 5, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_19=TINYINT, TINYINT, -6, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_20=INTERVALDS, TINYINT, -6, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_21=INTERVALYM, TINYINT, -6, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_22=TIME, TIME, 92, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_23=TIMESTAMP, TIMESTAMP, 93, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_24=TIMESTAMP WITH LOCAL TIME ZONE, TIMESTAMP, 93, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_25=TIMESTAMP WITH TIME ZONE, TIMESTAMP, 93, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_26=DATE, DATE, 91, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_27=LONG, LONGVARCHAR, -1, false,false,false,false,false,false,false,false
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_28=LONG RAW, LONGVARBINARY, -4, false,false,false,false,false,false,false,false
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_29=STRUCT, LONGVARBINARY, -4, false,false,false,false,false,false,false,false
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_30=ARRAY, LONGVARBINARY, -4, false,false,false,false,false,false,false,false
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_31=REF, LONGVARBINARY, -4, false,false,false,false,false,false,false,false
ca.sqlpower.architect.profile.ColumnProfileResult$StringLengthSQLFunction=LENGTH(:)
ca.sqlpower.architect.profile.ColumnProfileResult$AverageSQLFunction=AVG(:)
ca.sqlpower.architect.profile.ColumnProfileResult$CaseWhenNullSQLFunction=DECODE(:,NULL,:)
ca.sqlpower.sqlobject.SQLIndex.IndexType_0=CTXCAT
ca.sqlpower.sqlobject.SQLIndex.IndexType_1=BTREE
ca.sqlpower.sqlobject.SQLIndex.IndexType_2=BITMAP
ca.sqlpower.sqlobject.SQLIndex.IndexType_3=FUNCTION-BASED
ca.sqlpower.sqlobject.SQLIndex.IndexType_4=IOT - TOP
ca.sqlpower.sqlobject.SQLIndex.IndexType_5=DOMAIN
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_0=433cc8af-284d-4abb-8ef7-08ebcb34dbf1,NUMBER,VARIABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_1=fc731466-848e-411a-82af-e7f5e1d504bb,RAW,VARIABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_2=936cd049-d1df-44fc-ab05-b47cabe09060,NUMBER,VARIABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_3=5c50e616-a448-40e1-abcd-5bfc04dcc607,BLOB,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_4=a26374aa-3026-4bb8-b564-eb2e186dfa5d,NUMBER,VARIABLE,VARIABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_5=cc1304ea-628a-4fc5-a84a-06ba14759152,NUMBER,VARIABLE,VARIABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_6=4fc90970-b2e5-41dd-911c-cc605d87e7a8,NUMBER,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_7=63b011c7-c81f-4c75-8271-632b3c87f727,NUMBER,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_8=83c27f1a-f56c-4e2c-ae53-18e02ff499af,LONG RAW,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_9=9a814859-ab26-4acd-9415-ea82291bcac1,LONG,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_10=0b8db85e-251b-4be0-8205-4d74362105cb,NCLOB,VARIABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_11=115245ce-612c-4d6a-b559-6dd903dd959a,NUMBER,VARIABLE,VARIABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_12=8fe516a5-9833-4170-9572-50e78bbf221f,NUMBER,VARIABLE,VARIABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_13=69fb547f-e14c-4748-9746-4c0e9e94eb52,NUMBER,VARIABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_14=10d6960f-169d-47c2-860a-37341342b1d5,DATE,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_15=608a1d2c-c960-44ac-b1f3-503aba0a5b7b,NUMBER,VARIABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_16=f332925d-2b1a-4a8a-b22d-90b05d4f7ebb,LONG RAW,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_17=831ac2d4-0e65-47ec-a0b7-62b7f6b8760a,VARCHAR2,VARIABLE,NOT_APPLICABLE
[Database Types_4]
JDBC Driver Class=oracle.jdbc.OracleDriver
JDBC URL=jdbc:oracle:thin:@<hostname>:<Port:1521>:<SID>
Name=Oracle 11g
Supports Updatable Result Sets=True
DDL Generator=ca.sqlpower.architect.ddl.Oracle9PlusDDLGenerator
ca.sqlpower.architect.etl.kettle.connectionType=Oracle
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_0=BIT, BIT, -7, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_1=CHAR, CHAR, 1, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_2=BINARY, BINARY, -2, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_3=VARBINARY, VARBINARY, -3, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_4=RAW, VARBINARY, -3, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_5=VARCHAR, VARCHAR, 12, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_6=VARCHAR2,VARCHAR, 12, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_7=NVARCHAR2,NVARCHAR, 12, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_8=BLOB, BLOB, 2004, false,false,false,false,false,false,false,false
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_9=CLOB, CLOB, 2005, false,false,false,false,false,false,false,false
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_10=BIGINT, BIGINT, -5, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_11=DECIMAL, DECIMAL, 3, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_12=DOUBLE, DOUBLE, 8, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_13=FLOAT, FLOAT, 6, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_14=INTEGER, INTEGER, 4, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_15=NUMERIC, NUMERIC, 2, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_16=NUMBER,  NUMERIC, 2, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_17=REAL, REAL, 7, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_18=SMALLINT, SMALLINT, 5, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_19=TINYINT, TINYINT, -6, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_20=INTERVALDS, TINYINT, -6, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_21=INTERVALYM, TINYINT, -6, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_22=TIME, TIME, 92, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_23=TIMESTAMP, TIMESTAMP, 93, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_24=TIMESTAMP WITH LOCAL TIME ZONE, TIMESTAMP, 93, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_25=TIMESTAMP WITH TIME ZONE, TIMESTAMP, 93, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_26=DATE, DATE, 91, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_27=LONG, LONGVARCHAR, -1, false,false,false,false,false,false,false,false
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_28=LONG RAW, LONGVARBINARY, -4, false,false,false,false,false,false,false,false
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_29=STRUCT, LONGVARBINARY, -4, false,false,false,false,false,false,false,false
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_30=ARRAY, LONGVARBINARY, -4, false,false,false,false,false,false,false,false
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_31=REF, LONGVARBINARY, -4, false,false,false,false,false,false,false,false
ca.sqlpower.architect.profile.ColumnProfileResult$StringLengthSQLFunction=LENGTH(:)
ca.sqlpower.architect.profile.ColumnProfileResult$AverageSQLFunction=AVG(:)
ca.sqlpower.architect.profile.ColumnProfileResult$CaseWhenNullSQLFunction=DECODE(:,NULL,:)
ca.sqlpower.sqlobject.SQLIndex.IndexType_0=CTXCAT
ca.sqlpower.sqlobject.SQLIndex.IndexType_1=BTREE
ca.sqlpower.sqlobject.SQLIndex.IndexType_2=BITMAP
ca.sqlpower.sqlobject.SQLIndex.IndexType_3=FUNCTION-BASED
ca.sqlpower.sqlobject.SQLIndex.IndexType_4=IOT - TOP
ca.sqlpower.sqlobject.SQLIndex.IndexType_5=DOMAIN
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_0=433cc8af-284d-4abb-8ef7-08ebcb34dbf1,NUMBER,VARIABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_1=fc731466-848e-411a-82af-e7f5e1d504bb,RAW,VARIABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_2=936cd049-d1df-44fc-ab05-b47cabe09060,NUMBER,VARIABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_3=5c50e616-a448-40e1-abcd-5bfc04dcc607,BLOB,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_4=a26374aa-3026-4bb8-b564-eb2e186dfa5d,NUMBER,VARIABLE,VARIABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_5=cc1304ea-628a-4fc5-a84a-06ba14759152,NUMBER,VARIABLE,VARIABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_6=4fc90970-b2e5-41dd-911c-cc605d87e7a8,NUMBER,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_7=63b011c7-c81f-4c75-8271-632b3c87f727,NUMBER,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_8=83c27f1a-f56c-4e2c-ae53-18e02ff499af,LONG RAW,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_9=9a814859-ab26-4acd-9415-ea82291bcac1,LONG,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_10=0b8db85e-251b-4be0-8205-4d74362105cb,NCLOB,VARIABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_11=115245ce-612c-4d6a-b559-6dd903dd959a,NUMBER,VARIABLE,VARIABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_12=8fe516a5-9833-4170-9572-50e78bbf221f,NUMBER,VARIABLE,VARIABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_13=69fb547f-e14c-4748-9746-4c0e9e94eb52,NUMBER,VARIABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_14=10d6960f-169d-47c2-860a-37341342b1d5,DATE,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_15=608a1d2c-c960-44ac-b1f3-503aba0a5b7b,NUMBER,VARIABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_16=f332925d-2b1a-4a8a-b22d-90b05d4f7ebb,LONG RAW,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_17=831ac2d4-0e65-47ec-a0b7-62b7f6b8760a,VARCHAR2,VARIABLE,NOT_APPLICABLE
[Database Types_5]
JDBC Driver Class=org.postgresql.Driver
JDBC JAR_0=builtin:postgresql-8.2-506.jdbc3.jar
JDBC JAR Count=1
JDBC URL=jdbc:postgresql://<Hostname>:<Port:5432>/<Database>
DDL Generator=ca.sqlpower.architect.ddl.PostgresDDLGenerator
Name=PostgreSQL
Supports Updatable Result Sets=True
ca.sqlpower.architect.etl.kettle.connectionType=PostgreSQL
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_0=varchar,varchar,12,true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_1=char,char,1,true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_2=name,name,1,true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_3=bpchar,bpchar,1,true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_4=date,date,91,true,true,true,false,false,false,false,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_5=time,time,92,true,true,true,false,false,false,false,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_6=timestamp,timestamp,93,true,true,true,false,false,false,false,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_7=timestamptz,timestamptz,93,true,true,true,false,false,false,false,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_8=timetz,timetz,92,true,true,true,false,false,false,false,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_9=float4,float,6,true,true,true,true,false,false,false,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_10=float8,float,6,true,true,true,true,false,false,false,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_11=int2,int,4,true,true,true,true,false,false,false,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_12=int4,int,4,true,true,true,true,false,false,false,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_13=int8,int,4,true,true,true,true,false,false,false,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_14=float4,float,6,true,true,true,true,false,false,false,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_15=float4,float,6,true,true,true,true,false,false,false,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_16=numeric,numeric,6,true,true,true,true,false,false,false,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_17=interval,interval,6,true,true,true,true,false,false,false,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_18=bool,bool,16,true,false,false,false,false,false,false,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_19=bit,bit,-7,true,false,false,false,false,false,false,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_20=bytea,bytea,2004,false,false,false,false,false,false,false,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_21=text,text,2004,false,false,false,false,false,false,false,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_22=oid,oid,2004,false,false,false,false,false,false,false,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_23=xid,xid,2004,false,false,false,false,false,false,false,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_24=cid,cid,2004,false,false,false,false,false,false,false,true
ca.sqlpower.architect.profile.ColumnProfileResult$StringLengthSQLFunction=LENGTH(:)
ca.sqlpower.architect.profile.ColumnProfileResult$AverageSQLFunction=AVG(:)
ca.sqlpower.architect.profile.ColumnProfileResult$CaseWhenNullSQLFunction=CASE WHEN : IS NULL THEN : END
ca.sqlpower.sqlobject.SQLIndex.IndexType_0=HASH
ca.sqlpower.sqlobject.SQLIndex.IndexType_1=BTREE
ca.sqlpower.sqlobject.SQLIndex.IndexType_2=RTREE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_0=fc731466-848e-411a-82af-e7f5e1d504bb,BYTEA,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_1=936cd049-d1df-44fc-ab05-b47cabe09060,BIT,VARIABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_2=5c50e616-a448-40e1-abcd-5bfc04dcc607,BYTEA,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_3=67ddc63f-5541-4dd1-9236-632d9d155e80,CHAR,VARIABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_4=9c22ed40-2868-4d9e-96ca-789234a53c8f,TEXT,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_5=cc1304ea-628a-4fc5-a84a-06ba14759152,NUMERIC,VARIABLE,VARIABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_6=4fc90970-b2e5-41dd-911c-cc605d87e7a8,DOUBLE PRECISION,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_7=7e55bcd0-7606-4153-b749-9c397f12c4d8,REAL,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_8=83c27f1a-f56c-4e2c-ae53-18e02ff499af,BYTEA,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_9=9a814859-ab26-4acd-9415-ea82291bcac1,TEXT,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_10=608a1d2c-c960-44ac-b1f3-503aba0a5b7b,SMALLINT,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_11=f332925d-2b1a-4a8a-b22d-90b05d4f7ebb,BYTEA,NOT_APPLICABLE,NOT_APPLICABLE
[Database Types_6]
JDBC Driver Class=com.microsoft.sqlserver.jdbc.SQLServerDriver
JDBC JAR_0=builtin:sqljdbc4-2.0.jar
JDBC JAR Count=1
JDBC URL=jdbc:sqlserver://<Hostname>:<Port:1433>
Name=SQL Server 2000
Supports Updatable Result Sets=True
DDL Generator=ca.sqlpower.architect.ddl.SQLServer2000DDLGenerator
ca.sqlpower.architect.etl.kettle.connectionType=MS SQL Server:MSSQL
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_0=bit, bit, -7, true,false,false,false,false,false,false,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_1=tinyint, INTEGER, -6, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_2=tinyint identity, INTEGER, -6, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_3=bigint, INTEGER, -5, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_4=bigint identity, INTEGER, -5, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_5=numeric, numeric, 2, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_6=numeric(), numeric, 2, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_7=decimal, decimal, 2, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_8=decimal(), decimal, 2,true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_9=int, INTEGER, 4,true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_10=int identity, INTEGER, 4, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_11=smallint, INTEGER, 4,true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_12=smallint identity, INTEGER, 4,true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_13=float, float, 6, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_14=real, real, 7,true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_15=money, money, 2, true,true,true,true,false,false,false,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_16=smallmoney, smallmoney, 7, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_17=text, text, 2005, false,false,false,false,false,false,false,false
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_18=ntext, ntext, 2005, false,false,false,false,false,false,false,false
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_19=image, image, 2004, false,false,false,false,false,false,false,false
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_20=datetime, datetime, 93, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_21=smalldatetime, smalldatetime, 93, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_22=varbinary, varbinary, -3, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_23=binary, binary, -2, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_24=char, char, 1, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_25=nchar, nchar, 1, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_26=varchar, varchar, 12, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_27=nvarchar, nvarchar, 12, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_28=sysname, sysname, 12, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_29=timestamp, timestamp, 2006, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_30=uniqueidentifier, uniqueidentifier, 2006, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_31=sql_variant, sql_variant, 2006, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ColumnProfileResult$StringLengthSQLFunction=LEN(:)
ca.sqlpower.architect.profile.ColumnProfileResult$AverageSQLFunction=AVG(CONVERT(DECIMAL,:))
ca.sqlpower.architect.profile.ColumnProfileResult$CaseWhenNullSQLFunction=CASE WHEN : IS NULL THEN : END
ca.sqlpower.sqlobject.SQLIndex.IndexType_0=HASH
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_0=5c50e616-a448-40e1-abcd-5bfc04dcc607,IMAGE,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_1=9c22ed40-2868-4d9e-96ca-789234a53c8f,TEXT,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_2=ee349be3-6af2-46e1-b305-975f5354b009,DATETIME,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_3=4fc90970-b2e5-41dd-911c-cc605d87e7a8,REAL,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_4=63b011c7-c81f-4c75-8271-632b3c87f727,INT,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_5=83c27f1a-f56c-4e2c-ae53-18e02ff499af,IMAGE,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_6=9a814859-ab26-4acd-9415-ea82291bcac1,TEXT,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_7=0b8db85e-251b-4be0-8205-4d74362105cb,NCLOB,VARIABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_8=10d6960f-169d-47c2-860a-37341342b1d5,DATETIME,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_9=6497d8de-0e00-40d6-a42e-e2adca83be64,DATETIME,NOT_APPLICABLE,NOT_APPLICABLE
[Database Types_7]
JDBC Driver Class=com.microsoft.sqlserver.jdbc.SQLServerDriver
JDBC JAR_0=builtin:sqljdbc4-2.0.jar
JDBC JAR Count=1
JDBC URL=jdbc:sqlserver://<Hostname>:<Port:1433>
Name=SQL Server 2005
Supports Updatable Result Sets=True
DDL Generator=ca.sqlpower.architect.ddl.SQLServer2005DDLGenerator
ca.sqlpower.architect.etl.kettle.connectionType=MS SQL Server:MSSQL
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_0=bit, bit, -7, true,false,false,false,false,false,false,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_1=tinyint, INTEGER, -6, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_2=tinyint identity, INTEGER, -6, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_3=bigint, INTEGER, -5, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_4=bigint identity, INTEGER, -5, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_5=numeric, numeric, 2, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_6=numeric(), numeric, 2, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_7=decimal, decimal, 2, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_8=decimal(), decimal, 2,true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_9=int, INTEGER, 4,true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_10=int identity, INTEGER, 4, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_11=smallint, INTEGER, 4,true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_12=smallint identity, INTEGER, 4,true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_13=float, float, 6, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_14=real, real, 7,true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_15=money, money, 2, true,true,true,true,false,false,false,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_16=smallmoney, smallmoney, 7, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_17=text, text, 2005, false,false,false,false,false,false,false,false
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_18=ntext, ntext, 2005, false,false,false,false,false,false,false,false
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_19=image, image, 2004, false,false,false,false,false,false,false,false
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_20=datetime, datetime, 93, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_21=smalldatetime, smalldatetime, 93, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_22=varbinary, varbinary, -3, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_23=binary, binary, -2, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_24=char, char, 1, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_25=nchar, nchar, 1, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_26=varchar, varchar, 12, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_27=nvarchar, nvarchar, 12, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_28=sysname, sysname, 12, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_29=timestamp, timestamp, 2006, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_30=uniqueidentifier, uniqueidentifier, 2006, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_31=sql_variant, sql_variant, 2006, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ColumnProfileResult$StringLengthSQLFunction=LEN(:)
ca.sqlpower.architect.profile.ColumnProfileResult$AverageSQLFunction=AVG(CONVERT(DECIMAL,:))
ca.sqlpower.architect.profile.ColumnProfileResult$CaseWhenNullSQLFunction=CASE WHEN : IS NULL THEN : END
ca.sqlpower.sqlobject.SQLIndex.IndexType_0=HASH
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_0=5c50e616-a448-40e1-abcd-5bfc04dcc607,IMAGE,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_1=9c22ed40-2868-4d9e-96ca-789234a53c8f,TEXT,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_2=ee349be3-6af2-46e1-b305-975f5354b009,DATETIME,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_3=4fc90970-b2e5-41dd-911c-cc605d87e7a8,REAL,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_4=63b011c7-c81f-4c75-8271-632b3c87f727,INT,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_5=83c27f1a-f56c-4e2c-ae53-18e02ff499af,IMAGE,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_6=9a814859-ab26-4acd-9415-ea82291bcac1,TEXT,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_7=0b8db85e-251b-4be0-8205-4d74362105cb,NCLOB,VARIABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_8=10d6960f-169d-47c2-860a-37341342b1d5,DATETIME,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_9=6497d8de-0e00-40d6-a42e-e2adca83be64,DATETIME,NOT_APPLICABLE,NOT_APPLICABLE
[Database Types_8]
JDBC Driver Class=com.microsoft.sqlserver.jdbc.SQLServerDriver
JDBC JAR_0=builtin:sqljdbc4-2.0.jar
JDBC JAR Count=1
JDBC URL=jdbc:sqlserver://<Hostname>:<Port:1433>;DatabaseName=<Database Name>
Name=SQL Server 2008
Supports Updatable Result Sets=True
DDL Generator=ca.sqlpower.architect.ddl.SQLServer2005DDLGenerator
ca.sqlpower.architect.etl.kettle.connectionType=MS SQL Server:MSSQL
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_0=bit, bit, -7, true,false,false,false,false,false,false,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_1=tinyint, INTEGER, -6, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_2=tinyint identity, INTEGER, -6, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_3=bigint, INTEGER, -5, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_4=bigint identity, INTEGER, -5, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_5=numeric, numeric, 2, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_6=numeric(), numeric, 2, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_7=decimal, decimal, 2, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_8=decimal(), decimal, 2,true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_9=int, INTEGER, 4,true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_10=int identity, INTEGER, 4, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_11=smallint, INTEGER, 4,true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_12=smallint identity, INTEGER, 4,true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_13=float, float, 6, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_14=real, real, 7,true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_15=money, money, 2, true,true,true,true,false,false,false,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_16=smallmoney, smallmoney, 7, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_17=text, text, 2005, false,false,false,false,false,false,false,false
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_18=ntext, ntext, 2005, false,false,false,false,false,false,false,false
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_19=image, image, 2004, false,false,false,false,false,false,false,false
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_20=datetime, datetime, 93, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_21=smalldatetime, smalldatetime, 93, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_22=varbinary, varbinary, -3, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_23=binary, binary, -2, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_24=char, char, 1, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_25=nchar, nchar, 1, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_26=varchar, varchar, 12, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_27=nvarchar, nvarchar, 12, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_28=sysname, sysname, 12, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_29=timestamp, timestamp, 2006, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_30=uniqueidentifier, uniqueidentifier, 2006, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_31=sql_variant, sql_variant, 2006, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ColumnProfileResult$StringLengthSQLFunction=LEN(:)
ca.sqlpower.architect.profile.ColumnProfileResult$AverageSQLFunction=AVG(CONVERT(DECIMAL,:))
ca.sqlpower.architect.profile.ColumnProfileResult$CaseWhenNullSQLFunction=CASE WHEN : IS NULL THEN : END
ca.sqlpower.sqlobject.SQLIndex.IndexType_0=HASH
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_0=5c50e616-a448-40e1-abcd-5bfc04dcc607,IMAGE,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_1=9c22ed40-2868-4d9e-96ca-789234a53c8f,TEXT,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_2=ee349be3-6af2-46e1-b305-975f5354b009,DATETIME,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_3=4fc90970-b2e5-41dd-911c-cc605d87e7a8,REAL,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_4=63b011c7-c81f-4c75-8271-632b3c87f727,INT,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_5=83c27f1a-f56c-4e2c-ae53-18e02ff499af,IMAGE,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_6=9a814859-ab26-4acd-9415-ea82291bcac1,TEXT,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_7=0b8db85e-251b-4be0-8205-4d74362105cb,NCLOB,VARIABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_8=10d6960f-169d-47c2-860a-37341342b1d5,DATETIME,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_9=6497d8de-0e00-40d6-a42e-e2adca83be64,DATETIME,NOT_APPLICABLE,NOT_APPLICABLE
[Database Types_9]
JDBC Driver Class=com.mysql.jdbc.Driver
JDBC URL=jdbc:mysql://<Hostname>:<Port:3306>/<Database>
Name=MySQL
Supports Updatable Result Sets=true
DDL Generator=ca.sqlpower.architect.ddl.MySqlDDLGenerator
ca.sqlpower.architect.etl.kettle.connectionType=MySQL
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_0=BIGINT,BIGINT,-5,true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_1=BINARY,BINARY,-2,true,false,false,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_2=BIT,TINYINT,-7,true,false,false,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_3=BLOB,LONGBLOB,2004,true,false,false,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_4=CHAR,CHAR,1,true,false,false,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_5=CLOB,LONGTEXT,2005,true,false,false,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_6=DATE,DATE,91,true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_7=DECIMAL,DECIMAL,3,true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_8=DOUBLE,DOUBLE PRECISION,8,true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_9=FLOAT,DOUBLE PRECISION,6,true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_10=INTEGER,INT,4,true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_11=LONGVARBINARY,VARBINARY,-4,false,false,false,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_12=LONGVARCHAR,VARCHAR,-1,false,false,false,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_13=NUMERIC,NUMERIC,2,true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_14=REAL,DOUBLE PRECISION,7,true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_15=SMALLINT,SMALLINT,5,true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_16=TIME,TIME,92,true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_17=TIMESTAMP,TIMESTAMP,93,true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_18=TINYINT,TINYINT,-6,true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_19=VARBINARY,VARBINARY,-3,true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_20=VARCHAR,VARCHAR,12,true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ColumnProfileResult$StringLengthSQLFunction=LENGTH(:)
ca.sqlpower.architect.profile.ColumnProfileResult$AverageSQLFunction=AVG(:)
ca.sqlpower.architect.profile.ColumnProfileResult$CaseWhenNullSQLFunction=CASE WHEN : IS NULL THEN : END
ca.sqlpower.sqlobject.SQLIndex.IndexType_0=HASH
ca.sqlpower.sqlobject.SQLIndex.IndexType_1=BTREE
ca.sqlpower.sqlobject.SQLIndex.IndexType_2=RTREE
JDBC JAR Count=1
JDBC JAR_0=file:/C:/Users/Admin/Downloads/Compressed/mysql-connector-j-9.0.0/mysql-connector-j-9.0.0/mysql-connector-j-9.0.0.jar
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_0=433cc8af-284d-4abb-8ef7-08ebcb34dbf1,BIGINT,VARIABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_1=936cd049-d1df-44fc-ab05-b47cabe09060,TINYINT,VARIABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_2=5c50e616-a448-40e1-abcd-5bfc04dcc607,LONGBLOB,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_3=9c22ed40-2868-4d9e-96ca-789234a53c8f,LONGTEXT,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_4=4fc90970-b2e5-41dd-911c-cc605d87e7a8,DOUBLE PRECISION,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_5=7e55bcd0-7606-4153-b749-9c397f12c4d8,DOUBLE PRECISIONS,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_6=63b011c7-c81f-4c75-8271-632b3c87f727,INT,VARIABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_7=83c27f1a-f56c-4e2c-ae53-18e02ff499af,VARBINARY,VARIABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_8=9a814859-ab26-4acd-9415-ea82291bcac1,TEXT,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_9=8fe516a5-9833-4170-9572-50e78bbf221f,DOUBLE PRECISION,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_10=69fb547f-e14c-4748-9746-4c0e9e94eb52,SMALLINT,VARIABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_11=6497d8de-0e00-40d6-a42e-e2adca83be64,DATETIME,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_12=608a1d2c-c960-44ac-b1f3-503aba0a5b7b,TINYINT,VARIABLE,NOT_APPLICABLE
[Database Types_10]
JDBC URL=jdbc:db2://<Hostname>:<Port>/<Database>
Name=DB2
Supports Updatable Result Sets=True
DDL Generator=ca.sqlpower.architect.ddl.DB2DDLGenerator
ca.sqlpower.architect.etl.kettle.connectionType=IBM DB2
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_0=BIGINT, BIGINT, -5, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_1=BINARY, BINARY, -2, true,false,false,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_2=BIT, BIT, -7, true,false,false,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_3=BLOB, BLOB, 2004, true,false,false,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_4=CHAR, CHAR, 1, true,false,false,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_5=CLOB, CLOB, 2005, true,false,false,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_6=DATE, DATE, 91, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_7=DECIMAL, DECIMAL, 3, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_8=DOUBLE, DOUBLE, 8, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_9=FLOAT, FLOAT, 6, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_10=INTEGER, INTEGER, 4, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_11=LONGVARBINARY, LONGVARBINARY, -4, false,false,false,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_12=LONGVARCHAR, LONGVARCHAR, -1, false,false,false,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_13=NUMERIC, NUMERIC, 2, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_14=REAL, REAL, 7, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_15=SMALLINT, SMALLINT, 5, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_16=TIME, TIME, 92, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_17=TIMESTAMP, TIMESTAMP, 93, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_18=TINYINT, TINYINT, -6, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_19=VARBINARY, VARBINARY, -3, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_20=VARCHAR, VARCHAR, 12, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ColumnProfileResult$StringLengthSQLFunction=LENGTH(:)
ca.sqlpower.architect.profile.ColumnProfileResult$AverageSQLFunction=AVG(:)
ca.sqlpower.architect.profile.ColumnProfileResult$CaseWhenNullSQLFunction=CASE WHEN : IS NULL THEN : END
ca.sqlpower.sqlobject.SQLIndex.IndexType_0=HASH
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_0=fc731466-848e-411a-82af-e7f5e1d504bb,BLOB,VARIABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_1=936cd049-d1df-44fc-ab05-b47cabe09060,DECIMAL,VARIABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_2=5c50e616-a448-40e1-abcd-5bfc04dcc607,BLOB,VARIABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_3=9c22ed40-2868-4d9e-96ca-789234a53c8f,CLOB,VARIABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_4=4fc90970-b2e5-41dd-911c-cc605d87e7a8,DOUBLE,VARIABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_5=7e55bcd0-7606-4153-b749-9c397f12c4d8,FLOAT,VARIABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_6=83c27f1a-f56c-4e2c-ae53-18e02ff499af,BLOB,VARIABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_7=9a814859-ab26-4acd-9415-ea82291bcac1,CLOB,VARIABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_8=115245ce-612c-4d6a-b559-6dd903dd959a,DECIMAL,VARIABLE,VARIABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_9=8fe516a5-9833-4170-9572-50e78bbf221f,FLOAT,VARIABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_10=608a1d2c-c960-44ac-b1f3-503aba0a5b7b,SMALLINT,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_11=f332925d-2b1a-4a8a-b22d-90b05d4f7ebb,BLOB,VARIABLE,NOT_APPLICABLE
[Database Types_11]
JDBC URL=jdbc:derby:<Database>;create=true
Name=Derby Embedded
JDBC JAR_0=builtin:derby.jar
JDBC JAR Count=1
Supports Updatable Result Sets=True
JDBC Driver Class=org.apache.derby.jdbc.EmbeddedDriver
ca.sqlpower.architect.etl.kettle.connectionType=Apache Derby
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_0=BIGINT, BIGINT, -5, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_1=BINARY, BINARY, -2, true,false,false,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_2=BIT, BIT, -7, true,false,false,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_3=BLOB, BLOB, 2004, true,false,false,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_4=CHAR, CHAR, 1, true,false,false,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_5=CLOB, CLOB, 2005, true,false,false,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_6=DATE, DATE, 91, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_7=DECIMAL, DECIMAL, 3, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_8=DOUBLE, DOUBLE, 8, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_9=FLOAT, FLOAT, 6, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_10=INTEGER, INTEGER, 4, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_11=LONGVARBINARY, LONGVARBINARY, -4, false,false,false,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_12=LONGVARCHAR, LONGVARCHAR, -1, false,false,false,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_13=NUMERIC, NUMERIC, 2, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_14=REAL, REAL, 7, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_15=SMALLINT, SMALLINT, 5, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_16=TIME, TIME, 92, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_17=TIMESTAMP, TIMESTAMP, 93, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_18=TINYINT, TINYINT, -6, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_19=VARBINARY, VARBINARY, -3, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_20=VARCHAR, VARCHAR, 12, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ColumnProfileResult$StringLengthSQLFunction=LENGTH(:)
ca.sqlpower.architect.profile.ColumnProfileResult$AverageSQLFunction=AVG(:)
ca.sqlpower.architect.profile.ColumnProfileResult$CaseWhenNullSQLFunction=CASE WHEN : IS NULL THEN : END
ca.sqlpower.sqlobject.SQLIndex.IndexType_0=HASH
[Database Types_12]
Name=HSQLDB
JDBC JAR_0=builtin:hsqldb-1.8.0.9.jar
JDBC JAR Count=1
Supports Updatable Result Sets=False
JDBC Driver Class=org.hsqldb.jdbcDriver
JDBC URL=jdbc:hsqldb:<Type>:<Filename>;shutdown=true
DDL Generator=ca.sqlpower.architect.ddl.HSQLDBDDLGenerator
ca.sqlpower.architect.etl.kettle.connectionType=Hypersonic
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_0=BIGINT, BIGINT, -5, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_1=BINARY, BINARY, -2, true,false,false,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_2=BIT, BIT, -7, true,false,false,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_3=BLOB, BLOB, 2004, true,false,false,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_4=CHAR, CHAR, 1, true,false,false,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_5=CLOB, CLOB, 2005, true,false,false,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_6=DATE, DATE, 91, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_7=DECIMAL, DECIMAL, 3, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_8=DOUBLE, DOUBLE, 8, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_9=FLOAT, FLOAT, 6, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_10=INTEGER, INTEGER, 4, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_11=LONGVARBINARY, LONGVARBINARY, -4, false,false,false,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_12=LONGVARCHAR, LONGVARCHAR, -1, false,false,false,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_13=NUMERIC, NUMERIC, 2, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_14=REAL, REAL, 7, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_15=SMALLINT, SMALLINT, 5, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_16=TIME, TIME, 92, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_17=TIMESTAMP, TIMESTAMP, 93, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_18=TINYINT, TINYINT, -6, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_19=VARBINARY, VARBINARY, -3, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_20=VARCHAR, VARCHAR, 12, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_21=BOOLEAN,BOOLEAN,16,false,false,false,false,false,false,false,false
ca.sqlpower.architect.profile.ColumnProfileResult$StringLengthSQLFunction=LENGTH(:)
ca.sqlpower.architect.profile.ColumnProfileResult$AverageSQLFunction=AVG(:)
ca.sqlpower.architect.profile.ColumnProfileResult$CaseWhenNullSQLFunction=CASE WHEN : IS NULL THEN : END
ca.sqlpower.sqlobject.SQLIndex.IndexType_0=HASH
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_0=433cc8af-284d-4abb-8ef7-08ebcb34dbf1,BIGINT,VARIABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_1=fc731466-848e-411a-82af-e7f5e1d504bb,BINARY,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_2=936cd049-d1df-44fc-ab05-b47cabe09060,BIT,VARIABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_3=5c50e616-a448-40e1-abcd-5bfc04dcc607,LONGVARBINARY,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_4=9c22ed40-2868-4d9e-96ca-789234a53c8f,LONGVARCHAR,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_5=cc1304ea-628a-4fc5-a84a-06ba14759152,DECIMAL,VARIABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_6=83c27f1a-f56c-4e2c-ae53-18e02ff499af,LONGVARBINARY,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_7=9a814859-ab26-4acd-9415-ea82291bcac1,LONGVARCHAR,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_8=f332925d-2b1a-4a8a-b22d-90b05d4f7ebb,VARBINARY,NOT_APPLICABLE,NOT_APPLICABLE
[Database Types_13]
JDBC Driver Class=com.sqlstream.jdbc.Driver
JDBC JAR_0=builtin:SqlStreamJdbc_Complete-2.0.3.jar
JDBC JAR Count=1
JDBC URL=jdbc:sqlstream://<Host>
Name=SQLstream
Supports Updatable Result Sets=True
DDL Generator=ca.sqlpower.architect.ddl.GenericDDLGenerator
Supports Stream Queries=True
[Database Types_14]
JDBC Driver Class=org.h2.Driver
JDBC URL=jdbc:h2:/path/to/database
Name=H2 Database
Supports Updatable Result Sets=false
DDL Generator=ca.sqlpower.architect.ddl.H2DDLGenerator
ca.sqlpower.architect.etl.kettle.connectionType=Hypersonic
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_0=BIGINT, BIGINT, -5, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_1=BINARY, BINARY, -2, true,false,false,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_2=BIT, BIT, -7, true,false,false,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_3=BLOB, BLOB, 2004, true,false,false,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_4=CHAR, CHAR, 1, true,false,false,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_5=CLOB, CLOB, 2005, true,false,false,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_6=DATE, DATE, 91, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_7=DECIMAL, DECIMAL, 3, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_8=DOUBLE, DOUBLE, 8, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_9=FLOAT, FLOAT, 6, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_10=INTEGER, INTEGER, 4, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_11=LONGVARBINARY, LONGVARBINARY, -4, false,false,false,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_12=LONGVARCHAR, LONGVARCHAR, -1, false,false,false,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_13=NUMERIC, NUMERIC, 2, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_14=REAL, REAL, 7, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_15=SMALLINT, SMALLINT, 5, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_16=TIME, TIME, 92, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_17=TIMESTAMP, TIMESTAMP, 93, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_18=TINYINT, TINYINT, -6, true,true,true,true,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_19=VARBINARY, VARBINARY, -3, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_20=VARCHAR, VARCHAR, 12, true,true,true,false,true,true,true,true
ca.sqlpower.architect.profile.ProfileFunctionDescriptor_21=BOOLEAN,BOOLEAN,16,false,false,false,false,false,false,false,false
ca.sqlpower.architect.profile.ColumnProfileResult$StringLengthSQLFunction=LENGTH(:)
ca.sqlpower.architect.profile.ColumnProfileResult$AverageSQLFunction=AVG(:)
ca.sqlpower.architect.profile.ColumnProfileResult$CaseWhenNullSQLFunction=CASE WHEN : IS NULL THEN : END
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_0=433cc8af-284d-4abb-8ef7-08ebcb34dbf1,BIGINT,VARIABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_1=fc731466-848e-411a-82af-e7f5e1d504bb,BINARY,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_2=936cd049-d1df-44fc-ab05-b47cabe09060,BIT,VARIABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_3=5c50e616-a448-40e1-abcd-5bfc04dcc607,LONGVARBINARY,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_4=9c22ed40-2868-4d9e-96ca-789234a53c8f,LONGVARCHAR,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_5=83c27f1a-f56c-4e2c-ae53-18e02ff499af,LONGVARBINARY,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_6=9a814859-ab26-4acd-9415-ea82291bcac1,LONGVARCHAR,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_7=0b8db85e-251b-4be0-8205-4d74362105cb,NCLOB,VARIABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_8=8fe516a5-9833-4170-9572-50e78bbf221f,REAL,NOT_APPLICABLE,NOT_APPLICABLE
ca.sqlpower.sqlobject.SQLTypePhysicalProperties_9=f332925d-2b1a-4a8a-b22d-90b05d4f7ebb,VARBINARY,NOT_APPLICABLE,NOT_APPLICABLE
[Data Types_1]
Name=ARRAY
UUID=5a4374b2-131e-46dd-b7f1-5eb2aaf25f8b
Basic Type=OTHER
Description=
Precision Type=NOT_APPLICABLE
Scale Type=NOT_APPLICABLE
JDBC Type=2003
[Data Types_2]
Name=BIGINT
UUID=433cc8af-284d-4abb-8ef7-08ebcb34dbf1
Basic Type=NUMBER
Description=8-byte integer
Precision Type=NOT_APPLICABLE
Scale Type=NOT_APPLICABLE
JDBC Type=-5
[Data Types_3]
Name=BINARY
UUID=fc731466-848e-411a-82af-e7f5e1d504bb
Basic Type=OTHER
Description=Fixed-length binary data
Precision Type=VARIABLE
Scale Type=NOT_APPLICABLE
JDBC Type=-2
[Data Types_4]
Name=BIT
UUID=936cd049-d1df-44fc-ab05-b47cabe09060
Basic Type=NUMBER
Description=
Precision Type=NOT_APPLICABLE
Scale Type=NOT_APPLICABLE
JDBC Type=-7
[Data Types_5]
Name=BLOB
UUID=5c50e616-a448-40e1-abcd-5bfc04dcc607
Basic Type=OTHER
Description=A Binary Large OBject
Precision Type=VARIABLE
Scale Type=NOT_APPLICABLE
JDBC Type=2004
[Data Types_6]
Name=BOOLEAN
UUID=a26374aa-3026-4bb8-b564-eb2e186dfa5d
Basic Type=BOOLEAN
Description=A boolean value (true or false)
Precision Type=NOT_APPLICABLE
Scale Type=NOT_APPLICABLE
JDBC Type=16
[Data Types_7]
Name=CHAR
UUID=67ddc63f-5541-4dd1-9236-632d9d155e80
Basic Type=TEXT
Description=Fixed-length character data
Precision Type=VARIABLE
Scale Type=NOT_APPLICABLE
JDBC Type=1
[Data Types_8]
Name=CLOB
UUID=9c22ed40-2868-4d9e-96ca-789234a53c8f
Basic Type=OTHER
Description=A Character Large OBject
Precision Type=NOT_APPLICABLE
Scale Type=NOT_APPLICABLE
JDBC Type=2005
[Data Types_9]
Name=DATALINK
UUID=dd5ea6b7-8ef8-4865-94cf-cde8435e479a
Basic Type=OTHER
Description=
Precision Type=NOT_APPLICABLE
Scale Type=NOT_APPLICABLE
JDBC Type=70
[Data Types_10]
Name=DATE
UUID=ee349be3-6af2-46e1-b305-975f5354b009
Basic Type=DATETIME
Description=A date, without time-of-day
Precision Type=NOT_APPLICABLE
Scale Type=NOT_APPLICABLE
JDBC Type=91
[Data Types_11]
Name=DECIMAL
UUID=cc1304ea-628a-4fc5-a84a-06ba14759152
Basic Type=NUMBER
Description=Numeric value with a fixed precision and scale
Precision Type=VARIABLE
Scale Type=VARIABLE
JDBC Type=3
[Data Types_12]
Name=DISTINCT
UUID=691163ca-b094-43dc-b36a-cc0dca835be8
Basic Type=OTHER
Description=
Precision Type=NOT_APPLICABLE
Scale Type=NOT_APPLICABLE
JDBC Type=2001
[Data Types_13]
Name=DOUBLE
UUID=4fc90970-b2e5-41dd-911c-cc605d87e7a8
Basic Type=NUMBER
Description=Double-precision floating point number
Precision Type=NOT_APPLICABLE
Scale Type=NOT_APPLICABLE
JDBC Type=8
[Data Types_14]
Name=FLOAT
UUID=7e55bcd0-7606-4153-b749-9c397f12c4d8
Basic Type=NUMBER
Description=Single-precision floating point number
Precision Type=NOT_APPLICABLE
Scale Type=NOT_APPLICABLE
JDBC Type=6
[Data Types_15]
Name=INTEGER
UUID=63b011c7-c81f-4c75-8271-632b3c87f727
Basic Type=NUMBER
Description=4-byte integer (-2147483648 to 2147483647 signed)
Precision Type=NOT_APPLICABLE
Scale Type=NOT_APPLICABLE
JDBC Type=4
[Data Types_16]
Name=JAVA_OBJECT
UUID=9cf970cb-9fda-4564-a567-3d34deeb5869
Basic Type=OTHER
Description=
Precision Type=NOT_APPLICABLE
Scale Type=NOT_APPLICABLE
JDBC Type=2000
[Data Types_17]
Name=LONGNVARCHAR
UUID=895cdc41-03a5-44f8-b41c-43668f815af2
Basic Type=TEXT
Description=Large variable-length national character data
Precision Type=VARIABLE
Scale Type=NOT_APPLICABLE
JDBC Type=-16
[Data Types_18]
Name=LONGVARBINARY
UUID=83c27f1a-f56c-4e2c-ae53-18e02ff499af
Basic Type=NUMBER
Description=Long variable-length binary data
Precision Type=VARIABLE
Scale Type=NOT_APPLICABLE
JDBC Type=-4
[Data Types_19]
Name=LONGVARCHAR
UUID=9a814859-ab26-4acd-9415-ea82291bcac1
Basic Type=TEXT
Description=Large variable-length character data
Precision Type=VARIABLE
Scale Type=NOT_APPLICABLE
JDBC Type=-1
[Data Types_20]
Name=NCHAR
UUID=18b8c53c-4811-4ed7-802e-2c8586fca549
Basic Type=TEXT
Description=Fixed-length national character data
Precision Type=VARIABLE
Scale Type=NOT_APPLICABLE
JDBC Type=-15
[Data Types_21]
Name=NCLOB
UUID=0b8db85e-251b-4be0-8205-4d74362105cb
Basic Type=OTHER
Description=A National Character Large OBject
Precision Type=NOT_APPLICABLE
Scale Type=NOT_APPLICABLE
JDBC Type=2011
[Data Types_22]
Name=NULL
UUID=7e164a6e-b44f-40e0-8022-495a87989568
Basic Type=OTHER
Description=
Precision Type=NOT_APPLICABLE
Scale Type=NOT_APPLICABLE
JDBC Type=0
[Data Types_23]
Name=NUMERIC
UUID=115245ce-612c-4d6a-b559-6dd903dd959a
Basic Type=NUMBER
Description=Numeric value with a fixed precision and scale
Precision Type=VARIABLE
Scale Type=VARIABLE
JDBC Type=2
[Data Types_24]
Name=NVARCHAR
UUID=087a20b8-b387-474a-b9c8-55eb87aff017
Basic Type=TEXT
Description=Variable-length national character data
Precision Type=VARIABLE
Scale Type=NOT_APPLICABLE
JDBC Type=-9
[Data Types_25]
Name=OTHER
UUID=d9e42a14-4d15-4b55-b176-ecbba383bbdd
Basic Type=OTHER
Description=
Precision Type=NOT_APPLICABLE
Scale Type=NOT_APPLICABLE
JDBC Type=1111
[Data Types_26]
Name=REAL
UUID=8fe516a5-9833-4170-9572-50e78bbf221f
Basic Type=NUMBER
Description=Single-precision floating point number
Precision Type=NOT_APPLICABLE
Scale Type=NOT_APPLICABLE
JDBC Type=7
[Data Types_27]
Name=REF
UUID=15422a2f-0cd9-49b9-97e8-afa2253a0951
Basic Type=OTHER
Description=
Precision Type=NOT_APPLICABLE
Scale Type=NOT_APPLICABLE
JDBC Type=2006
[Data Types_28]
Name=ROWID
UUID=cc2c22e6-30f2-48ee-b700-12f37571061e
Basic Type=OTHER
Description=
Precision Type=NOT_APPLICABLE
Scale Type=NOT_APPLICABLE
JDBC Type=-8
[Data Types_29]
Name=SMALLINT
UUID=69fb547f-e14c-4748-9746-4c0e9e94eb52
Basic Type=NUMBER
Description=2-byte integer (0 to 65525 unsigned, -32768 to 32767 signed)
Precision Type=NOT_APPLICABLE
Scale Type=NOT_APPLICABLE
JDBC Type=5
[Data Types_30]
Name=SQLXML
UUID=82d5ff2b-1b7e-482d-8047-ad6c6e0e726b
Basic Type=OTHER
Description=XML data
Precision Type=NOT_APPLICABLE
Scale Type=NOT_APPLICABLE
JDBC Type=2009
[Data Types_31]
Name=STRUCT
UUID=efddce6b-f53f-442d-8010-306bc3c6c755
Basic Type=OTHER
Description=
Precision Type=NOT_APPLICABLE
Scale Type=NOT_APPLICABLE
JDBC Type=2002
[Data Types_32]
Name=TIME
UUID=10d6960f-169d-47c2-860a-37341342b1d5
Basic Type=DATETIME
Description=Time of day
Precision Type=NOT_APPLICABLE
Scale Type=NOT_APPLICABLE
JDBC Type=92
[Data Types_33]
Name=TIMESTAMP
UUID=6497d8de-0e00-40d6-a42e-e2adca83be64
Basic Type=DATETIME
Description=A time and date
Precision Type=NOT_APPLICABLE
Scale Type=NOT_APPLICABLE
JDBC Type=93
[Data Types_34]
Name=TINYINT
UUID=608a1d2c-c960-44ac-b1f3-503aba0a5b7b
Basic Type=NUMBER
Description=1-byte integer (0 to 255 unsigned, -127 to 128 signed)
Precision Type=NOT_APPLICABLE
Scale Type=NOT_APPLICABLE
JDBC Type=-6
[Data Types_35]
Name=VARBINARY
UUID=f332925d-2b1a-4a8a-b22d-90b05d4f7ebb
Basic Type=OTHER
Description=Variable-length binary data
Precision Type=VARIABLE
Scale Type=NOT_APPLICABLE
JDBC Type=-3
[Data Types_36]
Name=VARCHAR
UUID=831ac2d4-0e65-47ec-a0b7-62b7f6b8760a
Basic Type=TEXT
Description=Variable-length character data
Precision Type=VARIABLE
Scale Type=NOT_APPLICABLE
JDBC Type=12
[Data Types_37]
Name=UNKNOWN
UUID=Unknown_UserDefinedSQLType
Basic Type=OTHER
Description=Unknown Type
Precision Type=NOT_APPLICABLE
Scale Type=NOT_APPLICABLE
JDBC Type=1111
[Databases_1]
Logical=New Connection
Connection Type=MySQL
JDBC URL=jdbc:mysql://127.0.0.1:3308/shopapp
UID=root
PWD=X6}k�&zZ
ca.sqlpower.architect.etl.kettle.database=
ca.sqlpower.architect.etl.kettle.port=
ca.sqlpower.architect.etl.kettle.hostname=
ca.sqlpower.architect.etl.kettle.repos.login=
ca.sqlpower.architect.etl.kettle.repos.password=
