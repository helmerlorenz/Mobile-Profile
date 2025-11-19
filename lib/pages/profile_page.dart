import 'package:flutter/material.dart';
import '../widgets/animated_particle.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with TickerProviderStateMixin {
  late AnimationController _floatingController;
  late AnimationController _pulseController;
  late AnimationController _fadeController;
  late Animation<double> _floatingAnimation;
  late Animation<double> _pulseAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _floatingController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _floatingAnimation = Tween<double>(begin: -10, end: 10).animate(
      CurvedAnimation(parent: _floatingController, curve: Curves.easeInOut),
    );

    _pulseController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeIn),
    );

    _fadeController.forward();
  }

  @override
  void dispose() {
    _floatingController.dispose();
    _pulseController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Helmer Lorenz Andalajao',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Stack(
        children: [
          ...List.generate(20, (index) => AnimatedParticle(index: index)),
          Center(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildProfileHeader(),
                      const SizedBox(height: 40),
                      _buildDivider(),
                      const SizedBox(height: 30),
                      const Text(
                        'PERSONAL INFORMATION',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                          color: Colors.orange,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                _buildInfoRow(
                                  icon: Icons.email,
                                  label: 'EMAIL',
                                  data: 'helmerlorenzaj@gmail.com',
                                  delay: 200,
                                ),
                                const SizedBox(height: 15),
                                _buildInfoRow(
                                  icon: Icons.account_balance,
                                  label: 'UNIVERSITY',
                                  data: 'West Visayas State University',
                                  delay: 300,
                                ),
                                const SizedBox(height: 15),
                                _buildInfoRow(
                                  icon: Icons.school,
                                  label: 'COURSE',
                                  data: 'Computer Science Artificial Intelligence Major',
                                  delay: 400,
                                ),
                                const SizedBox(height: 15),
                                _buildInfoRow(
                                  icon: Icons.cake,
                                  label: 'BIRTHDAY',
                                  data: 'November 18, 2004',
                                  delay: 500,
                                ),
                                const SizedBox(height: 15),
                                _buildInfoRow(
                                  icon: Icons.location_on,
                                  label: 'ADDRESS',
                                  data: 'Iloilo City, Philippines, 5000',
                                  delay: 600,
                                ),
                                const SizedBox(height: 15),
                                _buildInfoRow(
                                  icon: Icons.favorite,
                                  label: 'HOBBIES',
                                  data: 'Programming, Cyber Security, Law, Running, Badminton, Cycling, Travelling, Golf, Billards, Diplomacy, Model UN',
                                  delay: 700,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            flex: 2,
                            child: _buildBiographySection(),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        AnimatedBuilder(
          animation: _floatingAnimation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, _floatingAnimation.value),
              child: child,
            );
          },
          child: ScaleTransition(
            scale: _pulseAnimation,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.orange.withOpacity(0.4),
                    blurRadius: 30,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.orange.withOpacity(0.2),
                child: const CircleAvatar(
                  radius: 46,
                  backgroundImage: AssetImage('assets/profile.jpg'),
                  backgroundColor: Color(0xFF1a1a1a),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'HELMER LORENZ',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          'ANDALAJAO',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.orange.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.orange.withOpacity(0.3)),
          ),
          child: const Text(
            'STUDENT',
            style: TextStyle(
              fontSize: 12,
              color: Colors.orange,
              letterSpacing: 1.5,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      width: double.infinity,
      height: 1,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            Colors.orange.withOpacity(0.5),
            Colors.transparent,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String data,
    required int delay,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 800 + delay),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 20 * (1 - value)),
            child: child,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: const Color(0xFF1a1a1a),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.orange.withOpacity(0.2),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.orange.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                color: Colors.orange,
                size: 20,
              ),
            ),
            const SizedBox(width: 15),
            SizedBox(
              width: 80,
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
            ),
            const Text(
              ':',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.orange,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                data,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBiographySection() {
    return Container(
      height: 510, // Matches the height of 6 info rows (6 * 70) + (5 * 15 spacing)
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: const Color(0xFF1a1a1a),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.orange.withOpacity(0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.orange.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.auto_stories,
                color: Colors.orange,
                size: 28,
              ),
              const SizedBox(width: 10),
              const Text(
                'MY BIOGRAPHY',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Expanded(
            child: SingleChildScrollView(
              child: Text(
                'I am Helmer Lorenz Andalajao, a 3rd-year Computer Science student majoring in Artificial Intelligence, driven by a deep passion for understanding and harnessing today’s rapidly evolving technology. My studies in computer science serve as a foundation for my pre-law journey, as I aspire to become a lawyer specializing in cybercrime, a field that bridges technology and justice in our digital age. Outside the academe, I am actively involved in Model United Nations (MUN), where I advocate for diplomacy, international cooperation, and the rule of law. I also take pride in being a varsity player for the WVSU Main Badminton Team, embodying discipline, strategy, and teamwork both on and off the court. During my free time, I dedicate myself to 10K marathons, cycling, billiards, and golf, activities that keep me balanced and focused. As young as I am, I hold a strong sense of passion and curiosity for the world. My love for travel allows me to explore diverse cultures and perspectives, which I continuously integrate into my personal growth and professional pursuits. Curiosity, discipline, and a commitment to learning define who I am, qualities that guide me as I navigate my academic journey, athletic endeavors, and future aspirations in law and technology.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                  height: 1.8,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ],
      ),
    );
  }
}