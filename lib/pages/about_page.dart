import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About Me',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.1),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.orange.withOpacity(0.3), width: 2),
                  ),
                  child: const Icon(
                    Icons.info_outline,
                    size: 60,
                    color: Colors.orange,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              _buildSection(
                title: 'GOALS',
                icon: Icons.flag,
                content:
                    'My goal is to become a proficient professional in the field of Artificial Intelligence while pursuing my path toward becoming a lawyer specializing in cybercrime. I aim to bridge the worlds of technology and law by contributing to the development of secure, ethical, and innovative digital systems. Through this, I hope to uphold justice in the modern technological landscape and create a meaningful impact on society.',
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        _buildSection(
                          title: 'HOBBIES & EXPERIENCES',
                          icon: Icons.interests,
                          content: '',
                        ),
                        const SizedBox(height: 10),
                        _buildHobbiesGrid(),
                      ],
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      children: [
                        _buildSection(
                          title: 'SKILLS',
                          icon: Icons.code,
                          content: '',
                        ),
                        const SizedBox(height: 10),
                        _buildSkillsGrid(),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required String content,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1a1a1a),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.orange.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.orange, size: 24),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
          if (content.isNotEmpty) ...[
            const SizedBox(height: 15),
            Text(
              content,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white70,
                height: 1.6,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildHobbiesGrid() {
    final hobbies = [
      {
        'title': 'Badminton',
        'icon': Icons.sports_tennis,
        'description': '10 yrs • 3 Gold & 3 Silver',
      },
      {
        'title': 'Cycling',
        'icon': Icons.directions_bike,
        'description': '5 yrs road & mountain',
      },
      {
        'title': 'Programming',
        'icon': Icons.code,
        'description': '3 yrs • Python, Java',
      },
      {
        'title': 'Running',
        'icon': Icons.directions_run,
        'description': '2x 10K finisher',
      },
      {
        'title': 'Travelling',
        'icon': Icons.flight_takeoff,
        'description': 'SG, MY, HK • PH explorer',
      },
      {
        'title': 'Golf',
        'icon': Icons.golf_course,
        'description': '1 yr beginner',
      },
      {
        'title': 'Billiards',
        'icon': Icons.sports_baseball,
        'description': '6 yrs casual',
      },
      {
        'title': 'Model UN',
        'icon': Icons.public,
        'description': 'Diplomacy forums',
      },
    ];

    return Column(
      children: hobbies.map((hobby) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF1a1a1a),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.orange.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  hobby['icon'] as IconData,
                  color: Colors.orange,
                  size: 18,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hobby['title'] as String,
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        hobby['description'] as String,
                        style: const TextStyle(
                          fontSize: 9,
                          color: Colors.white60,
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSkillsGrid() {
    final skills = [
      {'name': 'Python & Java', 'icon': Icons.code},
      {'name': 'Flutter', 'icon': Icons.phone_android},
      {'name': 'Cyber Security', 'icon': Icons.security},
      {'name': 'Problem Solving', 'icon': Icons.lightbulb},
      {'name': 'Diplomacy', 'icon': Icons.balance},
      {'name': 'Team Work', 'icon': Icons.groups},
    ];

    return Column(
      children: skills.map((skill) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF1a1a1a),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.orange.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  skill['icon'] as IconData,
                  color: Colors.orange,
                  size: 18,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    skill['name'] as String,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}