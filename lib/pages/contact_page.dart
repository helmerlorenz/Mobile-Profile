
import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contact Information',
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
                    Icons.contact_mail,
                    size: 60,
                    color: Colors.orange,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'GET IN TOUCH',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Feel free to reach out to me through any of the following channels',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              _buildContactCard(
                icon: Icons.email,
                title: 'Email',
                subtitle: 'helmerlorenzaj@gmail.com',
                color: Colors.red,
              ),
              const SizedBox(height: 15),
              _buildContactCard(
                icon: Icons.phone,
                title: 'Phone',
                subtitle: '09989236362',
                color: Colors.green,
              ),
              const SizedBox(height: 15),
              _buildContactCard(
                icon: Icons.location_on,
                title: 'Location',
                subtitle: 'Iloilo City, Philippines',
                color: Colors.blue,
              ),
              const SizedBox(height: 30),
              const Text(
                'SOCIAL MEDIA',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(height: 20),
              Table(
                children: [
                  TableRow(
                    children: [
                      _buildSocialButton(Icons.facebook, 'Facebook'),
                      _buildSocialButton(Icons.link, 'LinkedIn'),
                    ],
                  ),
                  TableRow(
                    children: [
                      _buildSocialButton(Icons.code, 'GitHub'),
                      _buildSocialButton(Icons.language, 'Website'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF1a1a1a),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.orange.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: const Column(
                  children: [
                    Icon(
                      Icons.timer,
                      color: Colors.orange,
                      size: 30,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'RESPONSE TIME',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        color: Colors.orange,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'I typically respond within 24 hours',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white70,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
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
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: color,
              size: 30,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: const Color(0xFF1a1a1a),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.orange.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.orange, size: 30),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}