# Project Hifz Rehberi – Development Charter

## 1. Fundament und Single Source of Truth

Die Product Bible ist die einzige höchste fachliche und strategische Instanz des Projekts.

Die Product Foundation v1.0 bündelt die verbindlichen Grundlagendokumente. Bei jedem fachlichen Widerspruch gilt ausnahmslos die Product Bible. Alle Fachkonzepte, Architektur- und Designdokumente werden daraus abgeleitet.

## 2. Verantwortlichkeiten

CEO / Product Owner entscheidet über:
- Vision & Produktphilosophie
- Hifz-System & Lehrmethodik
- UX & Designphilosophie
- Navigation & Rollenmodelle
- Datenschutz & Geschäftsmodell
- Roadmap & Produktstrategie

Entwickler und KI unterstützen die Umsetzung dieser Vorgaben.

## 3. Rollenverständnis

Der CEO entwickelt das Produkt (das "Was" und "Warum").
Die KI entwickelt die Umsetzung (das "Wie").
Nicht umgekehrt.

## 4. KI-Regeln

KI darf:
- Strukturieren, dokumentieren und analysieren.
- Architektur unterstützen und Implementierungen durchführen.
- Testen, Fehler beheben und Codequalität verbessern.

KI darf nicht eigenständig:
- Produktentscheidungen oder Philosophie ändern.
- Lehrmethoden oder Rollenmodelle verändern.
- UX-Konzepte oder Navigationsstrukturen neu definieren.

## 5. Product Freeze

Produktdokumente dürfen nur nach ausdrücklicher Freigabe des CEO geändert werden. 
Die KI darf Vorschläge machen, Fragen stellen und Widersprüche aufzeigen, aber keine fachlichen Änderungen selbstständig durchführen.

## 6. Produktphilosophie

**Tradition First – Technology Second.**
Die Technik unterstützt den Qur'an, den Hoca und die Hifz-Tradition. Sie ersetzt sie nicht.

## 7. Entwicklungsprinzipien

- **Visual-First**: Neue Oberflächen werden zunächst als visuelle Referenz (Mockup/UI-Entwurf) erstellt und freigegeben. Erst danach erfolgt die technische Umsetzung in Flutter.
- **Git-Sicherheitsregel**: Vor größeren KI-gestützten Änderungen muss ein sauberer Git-Status vorliegen. Falls erforderlich, wird der aktuelle Stand zunächst committet oder anderweitig gesichert.
- **Smartphone-Test**: Nach größeren UI-Sprints erfolgt zwingend ein Test auf einem echten Smartphone, um Darstellung, Bedienbarkeit und Nutzererlebnis zu überprüfen.
- **Prozessfolge**: Problem verstehen → Product-Bible-Abgleich → Konzept → Implementierung → Test → Review.

## 8. Iterativer Entwicklungsprozess

Arbeitsprinzip: **Planen → Bauen → Testen → Verbessern.**
Jeder Sprint soll einen sichtbaren Mehrwert liefern. Wir arbeiten in kleinen, überprüfbaren Schritten.

## 9. Dokumentationsprinzip

**"So viel Dokumentation wie nötig – so viel Entwicklung wie möglich."**
Es muss eine gesunde Verhältnismäßigkeit zwischen Dokumentationsaufwand und sichtbarer Entwicklung gewahrt bleiben. Dokumentation dient der Klarheit und Nachhaltigkeit, darf aber den Fortschritt nicht lähmen.

## 10. Qualitätsprinzipien

- Qualität vor Geschwindigkeit.
- Offline First & Datenschutz First.
- Keine Werbung & ablenkungsfreie Umgebung.
- Saubere Dokumentation & modularer Code.
