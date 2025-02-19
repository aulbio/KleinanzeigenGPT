# Ich liebe Kleinanzeigen

... und benutze es sehr gern. Was mich stört ist aber, mir jedes Mal einen neuen Ordner und einen generischen Beschreibungstext für jeden Artikel zu erstellen. Deswegen habe ich mir als erstes ein kleines Skript gebastelt, welches die Ordnererstellung für mich übernimmt. Danach habe ich noch ChatGPT integriert, um eine kurze Beschreibung anhand des Titels und eines Kommentars zu generieren. Anschließend wird ein Ordner mit dem Name des Artikels im gewünschten Verzeichnis erstellt. Darin befindet sich eine .txt Datei mit dem Titel, einer Kurzbeschreibung und einer Preisschätzung des Artikels.

### Usage

ebay.sh "NameDesArtikels" "KommentarZumArtikel"

### Zu beachten

- der gewünschte Pfad muss im Skript ersetzt werden
- für die Nutzung von ChatGPT muss der persönliche API-KEY festgelegt werden
- es kann auch ein beliebiges Model verwendet werden, aktuell ist "gpt-4o" eingestellt, da es sehr gute Ergebnisse liefert
