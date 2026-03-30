import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

class SuccessScreen extends StatefulWidget {
  // Receives the user's name from the signup screen
  final String userName;

  const SuccessScreen({super.key, required this.userName});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  // Controller to manage the confetti animation
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    // Initialize confetti with a 3 second duration
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 3));
    // Automatically play confetti as soon as the screen opens
    _confettiController.play();
  }

  @override
  void dispose() {
    // Always dispose the controller to free up resources
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      body: Stack(
        children: [
          // Confetti widget positioned at the top center of the screen
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              numberOfParticles: 30,
              // Confetti colors matching the app theme
              colors: const [
                Color(0xFF00D4FF),
                Colors.pink,
                Colors.yellow,
                Colors.green,
                Colors.purple,
              ],
            ),
          ),

          // Main content centered on the screen
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Success checkmark icon
                  const Icon(
                    Icons.check_circle_rounded,
                    size: 100,
                    color: Color(0xFF00D4FF),
                  ),
                  const SizedBox(height: 24),

                  // Personalized welcome message using the received userName
                  Text(
                    'Welcome, ${widget.userName}! 🎉',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Confirmation message below the username
                  const Text(
                    'Your account has been\nsuccessfully created!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 48),

                  // Button to replay the confetti animation
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton.icon(
                      onPressed: () => _confettiController.play(),
                      icon: const Icon(Icons.celebration_rounded),
                      label: const Text('Celebrate Again!'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00D4FF),
                        foregroundColor: const Color(0xFF1A1A2E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}