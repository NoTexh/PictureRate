# PictureRate
Das Projekt wird im Rahmen der Vorlesung Webprogrammierung der DHBW Karlsruhe entwickelt
## Inhalt
1. Technologien
1. Datenbankeinrichtung

### 1. Technologien
* Als Applikation-Server kommt Tomcat in der Version 9.0.12 zum Einsatz : [Download von Tomcat v9.0.12](https://tomcat.apache.org/download-90.cgi). Dazu wird unter Binary Distributions Core: die .zip-Datei benötigt.
* Als Datenbank-Server wird MySQL in der Community Version verwendet : [Download von MySQL](https://dev.mysql.com/downloads/mysql/). Es wird sowohl der Server, die MySQL Workbench als auch der JConnector benötigt.
* NetBeans 9.0 wird als IDE verwendet, dort die Binaries herunterladen : [Download von Netbeans IDE v9.0](https://netbeans.apache.org/download/nb90/nb90.html). Dazu soll der Tomcat-Server in die IDE integriert werden.
  1. Dafür unter `Tools -> Servers` einen neuen Tomcat Server hinzufügen.
  1. Den Pfad zu dem Tomcat-Ordner angeben.
  1. Als Benutzernamen und Passwort admin verwenden.

### 2. Datenbankeinrichtung
Eine Verbindung unter localhost:3306 einrichten mit den entsprechenden Benutzernamen und Passwort (root/root). Anschließend ein         neues Schema mit dem Namen `picturerate` erstellen.

* Erstellen der Bild-Tabelle mit dem Namen `picture`. Dort soll ein Primary Key mit dem Namen `idpicture` erstellt werden. Dieser         wird für jeden Eintrag automatisch gesetzt (Auto-Increment). Anschließend wird eine Reihe mit dem Datenwert **LONGBLOB** und dem             Namen `data` gesetzt. Nun muss ein **VARCHAR** mit dem Namen `name` erstellt werden. Am Ende soll das Uploaddatum gespeichert               werden. Dazu wird der Name `uploaddate` mit dem Typ **DATETIME** benötigt.

* Nun muss noch eine Kommentartabelle `kommentare` erstellt werden. Diese beinhaltet die ID der Bilder unter dem Namen `idpicture` und die ID           der Kommentare mit dem Namen `idkommentar`. Dabei sollen weder idpicture noch idkommentar ein Primary Key, Not Null oder Auto           Incrementier sein. Die letzte Spalte mit dem Namen `kommentar` soll das Kommentar beinhalten und den Datentyp **VARCHAR** haben.

*Für das Bewertungssystem muss die Tabelle picture angepasst werden.

ALTER TABLE `picturerate`.`picture` 
ADD COLUMN `rateheart` VARCHAR(45) NULL DEFAULT 0 AFTER `uploaddate`,
ADD COLUMN `ratethumbup` VARCHAR(45) NULL DEFAULT 0 AFTER `rateheart`,
ADD COLUMN `ratethumbdown` VARCHAR(45) NULL DEFAULT 0 AFTER `ratethumbup`,
ADD COLUMN `ratepoop` VARCHAR(45) NULL DEFAULT 0 AFTER `ratethumbdown`
ADD COLUMN `ratestar` VARCHAR(45) NULL DEFAULT 0 AFTER `ratepoop`;

