import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF1F6B4F); // Dunkles Türkis
    const Color backgroundColor = Color(0xFFFDFBF7); // Helle Cremefläche
    const Color accentColor = Color(0xFFD4AF37); // Gold-Akzent

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Vorläufiges Platzhalter-Logo
                const Icon(
                  Icons.auto_stories,
                  size: 64,
                  color: primaryColor,
                ),
                const SizedBox(height: 24),
                
                // Begrüßung Arabisch
                const Text(
                  'السلام عليكم ورحمة الله وبركاته',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(height: 8),
                
                // Begrüßung Deutsch
                Text(
                  'Willkommen',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black.withAlpha((0.7 * 255).round()),
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 48),

                // Vier große Karten
                _DashboardCard(
                  icon: Icons.menu_book,
                  title: 'Heute lernen',
                  primaryColor: primaryColor,
                  accentColor: accentColor,
                ),
                const SizedBox(height: 16),
                _DashboardCard(
                  icon: Icons.sync,
                  title: 'Festigung',
                  primaryColor: primaryColor,
                  accentColor: accentColor,
                ),
                const SizedBox(height: 16),
                _DashboardCard(
                  icon: Icons.bar_chart,
                  title: 'Fortschritt',
                  primaryColor: primaryColor,
                  accentColor: accentColor,
                ),
                const SizedBox(height: 16),
                _DashboardCard(
                  icon: Icons.track_changes,
                  title: 'Nächster Schritt',
                  primaryColor: primaryColor,
                  accentColor: accentColor,
                ),
                
                const SizedBox(height: 40), // Whitespace am Ende
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DashboardCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color primaryColor;
  final Color accentColor;

  const _DashboardCard({
    required this.icon,
    required this.title,
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(color: Colors.black.withAlpha((0.05 * 255).round())),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: primaryColor.withAlpha((0.1 * 255).round()),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                icon,
                color: accentColor,
                size: 32,
              ),
            ),
            const SizedBox(width: 24),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.chevron_right,
              color: Colors.black26,
            ),
          ],
        ),
      ),
    );
  }
}
