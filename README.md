<h1>PictureRate</h1>
<p>Das Projekt wird im Rahmen der Vorlesung Webprogrammierung der DHBW Karlsruhe entwickelt</p>
<h2>Inhalt</h2>
<li>
  <ol>1. Technologien</ol>
  <ol>2. Datenbankeinrichtung</ol>
  <ol></ol>
</li>

<h3>1. Technologien</h3>
<li>
  <ul>- Als Applikation-Server kommt Tomcat in der Version 9.0.12 zum Einsatz : https://tomcat.apache.org/download-90.cgi. Dazu wird unter Binary Distributions Core: die .zip-Datei benötigt.</ul>
  <ul>- Als Datenbank-Server wird MySQL in der Community Version verwendet : https://dev.mysql.com/downloads/mysql/. Es wird sowohl der Server, die MySQL Workbench als auch der JConnector benötigt. PS: Für eine Test-Datenbank wird ein entsprechendes Skript unter WebPages -> res -> picturetable.csv zu finden sein. Diese einfach mit Hilfe von MySQL Workbench in MySQL importieren</ul>
  <ul>- NetBeans 9.0 wird als IDE verwendet, dort die Binaries herunterladen : https://netbeans.apache.org/download/nb90/nb90.html. Dazu soll der Tomcat-Server in die IDE integriert werden. <br> 1. Dafür unter Tools -> Servers einen neuen Tomcat Server hinzufügen <br> 2. Den Pfad zu dem Tomcat-Ordner angeben <br> 3. Als Benutzernamen und Passwort admin verwenden</ul>
</li>

<h3>2. Datenbankeinrichtung</h3>
<li>
  <ul>
    Eine Verbindung unter localhost:3306 einrichten mit den entsprechenden Benutzernamen und Passwort (root/root). Anschließend ein         neues Schema mit dem Namen "picturerate" erstellen.
  </ul>
  <ul>
    <li>
      <ul>
        Erstellen der Bild-Tabelle mit dem Namen "picture". Dort soll ein Primary Key mit dem Namen "idpicture" erstellt werden. Dieser         wird für jeden Eintrag automatisch gesetzt (Auto-Increment). Anschließend wird eine Reihe mit dem Datenwert LONGBLOB und dem             Namen "data" gesetzt. Nun muss ein VARCHAR mit dem Namen "name" erstellt werden. Am Ende soll das Uploaddatum gespeichert               werden. Dazu wird der Name "uploaddate" mit dem Typ DATETIME benötigt.
      </ul>
    </li>
    <li>
      <ul>
         Nun muss noch eine Kommentartabelle erstellt werden. Diese beinhaltet die ID der Bilder unter dem Namen "idpicture" und die ID          der Kommentare mit dem Namen "idkommentar". Dabei sollen weder idpicture noch idkommentar ein Primary Key, Not Null oder Auto            Incrementier sein. Die letzte Spalte mit dem Namen "kommentar" soll das Kommentar beinhalten.
      </ul>
  </li></ul>
  </li>
