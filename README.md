# WatchChain iOS

WatchChain ist eine iOS-Anwendung, die es Benutzern ermöglicht, Kryptowährungen zu verfolgen und ihre Portfolios zu verwalten. Die App bietet Echtzeitinformationen, grafische Darstellungen und Analysen zu verschiedenen Kryptowährungen, um eine einfache und intuitive Benutzererfahrung zu gewährleisten.

## Funktionen
- **Echtzeit-Daten**: Verfolgt aktuelle Preise und Trends von verschiedenen Kryptowährungen.
- **Portfolio-Management**: Benutzer können ihre eigenen Portfolios hinzufügen und verwalten, um ihre Investitionen zu überwachen.
- **Graphische Darstellungen**: Zeigt historische Preistrends und Analysen in interaktiven Diagrammen an.
- **Benutzerfreundliches UI**: Ein klares und einfaches Design, das es Benutzern ermöglicht, schnell auf Informationen zuzugreifen.

## Voraussetzungen
- iOS 13.0 oder höher
- Xcode 12.0 oder höher
- Swift 5.3 oder höher
- Abhängigkeiten: `Firebase` `Alamofire` `Charts` `IQKeyboardManagerSwift`

## Installation
1. Projekt klonen:
```
git clone https://github.com/olexey27/WatchChainiOS.git
```
2. Abhängigkeiten installieren: Gehe in das Projektverzeichnis und führe den folgenden Befehl aus:
```
pod install
```
3. Öffne das Projekt: Öffne die `.xcworkspace` Datei in Xcode:
```
open WatchChain.xcworkspace
```
4. Firebase-Konfiguration:
- Lade die `GoogleService-Info.plist` Datei aus der Firebase-Konsole herunter und füge sie dem Projekt hinzu.

5. Build und Ausführen:
- Wähle dein Gerät oder Simulator und klicke auf `Build` und `Run` in Xcode.

## Verwendung
1. Portfolio Hinzufügen:
- Gehe zur Portfolio-Seite und klicke auf `Add`. Füge die gewünschte Kryptowährung hinzu und gib den Betrag ein.

2. Kurse und Charts:
- Wähle eine Kryptowährung aus, um detaillierte Informationen, Preistrends und Analysen anzuzeigen.

3. Alarmfunktion:
- Setze Alarme, um benachrichtigt zu werden, wenn bestimmte Kursziele erreicht werden.

## Technologie-Stack
- **Swift**: Programmiersprache für die iOS-Entwicklung.
- **Firebase**: Backend-Integration für Authentifizierung und Datenbank.
- **Alamofire**: Netzwerkbibliothek für HTTP-Anfragen.
- **Charts**: Bibliothek für die Darstellung von Diagrammen und Graphen.
- **IQKeyboardManagerSwift**: Verwaltung der Tastatur für eine bessere Benutzererfahrung.

## Lizenz
_Dieses Projekt ist unter der MIT-Lizenz lizenziert. Siehe die LICENSE Datei für weitere Details._

## Kontakt
- **Autor**: [**Olexey27**](https://www.linkedin.com/in/alexej-krasnokutskij-3a2920235/)
- **Projekt Repository**: [**WatchChain**](https://github.com/olexey27/WatchChainiOS)
