# Architektur- & Strategieentscheidungen

## ADR 001: Fokus auf Muraja'a (Wiederholung)
**Status:** Akzeptiert
**Kontext:** Nutzerbefragungen haben gezeigt, dass das Behalten des Gelernten schwieriger ist als das neue Auswendiglernen.
**Entscheidung:** Das Muraja'a-System wird als Kernpfeiler der App entwickelt.

## ADR 002: Feature-First Architektur
**Status:** Akzeptiert
**Kontext:** Skalierbarkeit für die Vision einer Lernplattform.
**Entscheidung:** Die App wird strikt nach Features modularisiert (`lib/features/...`).

## ADR 003: Integration von Tecvid-Modulen
**Status:** Akzeptiert
**Kontext:** Vermeidung von Fehlern in der initialen Lernphase.
**Entscheidung:** Tecvid und Mahreç werden als eigenständige Lernmodule integriert.
