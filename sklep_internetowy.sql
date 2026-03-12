-- ============================================
-- BAZA DANYCH: sklep_internetowy
-- ============================================
CREATE DATABASE IF NOT EXISTS sklep_internetowy;
USE sklep_internetowy;

-- Tabela: klienci
CREATE TABLE klienci (
  id          INT PRIMARY KEY AUTO_INCREMENT,
  imie        VARCHAR(50),
  nazwisko    VARCHAR(50),
  miasto      VARCHAR(50),
  kraj        VARCHAR(50) DEFAULT 'Polska',
  email       VARCHAR(100),
  vip         TINYINT(1) DEFAULT 0
);

-- Tabela: produkty
CREATE TABLE produkty (
  id          INT PRIMARY KEY AUTO_INCREMENT,
  nazwa       VARCHAR(100),
  kategoria   VARCHAR(50),
  cena        DECIMAL(10,2),
  stan_mag    INT DEFAULT 0
);

-- Tabela: zamowienia
CREATE TABLE zamowienia (
  id          INT PRIMARY KEY AUTO_INCREMENT,
  id_klienta  INT,
  data_zam    DATE,
  status      VARCHAR(20),
  FOREIGN KEY (id_klienta) REFERENCES klienci(id)
);

-- Tabela: pozycje_zamowienia
CREATE TABLE pozycje_zamowienia (
  id           INT PRIMARY KEY AUTO_INCREMENT,
  id_zamowienia INT,
  id_produktu  INT,
  ilosc        INT,
  FOREIGN KEY (id_zamowienia) REFERENCES zamowienia(id),
  FOREIGN KEY (id_produktu)   REFERENCES produkty(id)
);

-- ============================================
-- DANE TESTOWE
-- ============================================
INSERT INTO klienci VALUES
  (1,'Anna','Nowak','Warszawa','Polska','anna@mail.pl',1),
  (2,'Piotr','Kowalski','Krakow','Polska','piotr@mail.pl',0),
  (3,'Maria','Wisniewska','Gdansk','Polska','maria@mail.pl',1),
  (4,'Tomasz','Zajac','Warszawa','Polska','tomasz@mail.pl',0),
  (5,'Julia','Krawczyk','Poznan','Polska','julia@mail.pl',0),
  (6,'Klaus','Müller','Berlin','Niemcy','klaus@mail.de',1),
  (7,'Emma','Schmidt','Hamburg','Niemcy','emma@mail.de',0),
  (8,'Lucia','Rossi','Rzym','Wlochy','lucia@mail.it',0);

INSERT INTO produkty VALUES
  (1,'Laptop Pro 15','Elektronika',3499.00,15),
  (2,'Myszka bezprzewodowa','Elektronika',89.00,120),
  (3,'Klawiatura mechaniczna','Elektronika',299.00,45),
  (4,'Monitor 24 cale','Elektronika',899.00,30),
  (5,'Krzeslo biurowe','Meble',549.00,20),
  (6,'Biurko narozne','Meble',1299.00,8),
  (7,'Kubek termiczny','AGD',49.00,200),
  (8,'Ekspres do kawy','AGD',649.00,25),
  (9,'Plecak laptopowy','Akcesoria',179.00,60),
  (10,'Podkladka pod mysz','Akcesoria',39.00,0);

INSERT INTO zamowienia VALUES
  (1,1,'2024-01-10','dostarczone'),
  (2,1,'2024-02-15','dostarczone'),
  (3,2,'2024-01-20','anulowane'),
  (4,3,'2024-02-01','dostarczone'),
  (5,3,'2024-03-05','w_realizacji'),
  (6,4,'2024-03-10','w_realizacji'),
  (7,5,'2024-01-25','dostarczone'),
  (8,6,'2024-02-20','dostarczone'),
  (9,7,'2024-03-01','dostarczone'),
  (10,1,'2024-03-15','w_realizacji'),
  (11,2,'2024-03-20','dostarczone'),
  (12,8,'2024-02-10','anulowane');

INSERT INTO pozycje_zamowienia VALUES
  (1,1,1,1),(2,1,2,2),(3,2,3,1),(4,2,9,1),
  (5,3,7,3),(6,4,4,1),(7,4,2,1),(8,5,1,1),
  (9,5,5,1),(10,6,6,1),(11,7,8,1),(12,7,7,2),
  (13,8,1,2),(14,8,3,1),(15,9,2,1),(16,9,10,2),
  (17,10,4,1),(18,11,5,1),(19,11,9,2),(20,12,7,1);
