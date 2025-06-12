import 'package:flutter/material.dart';

void main() { runApp(const SoloLevelingApp()); }

class SoloLevelingApp extends StatelessWidget { const SoloLevelingApp({super.key});

@override Widget build(BuildContext context) { return MaterialApp( title: 'Solo Leveling', theme: ThemeData.dark().copyWith( scaffoldBackgroundColor: Colors.black, textTheme: const TextTheme( bodyLarge: TextStyle(fontSize: 18, color: Colors.white), headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueAccent), ), ), home: const PlayerSelectionScreen(), debugShowCheckedModeBanner: false, ); } }

class PlayerSelectionScreen extends StatefulWidget { const PlayerSelectionScreen({super.key});

@override State<PlayerSelectionScreen> createState() => _PlayerSelectionScreenState(); }

class _PlayerSelectionScreenState extends State<PlayerSelectionScreen> { bool? agreed;

void _onSelect(bool choice) { setState(() { agreed = choice; }); Future.delayed(const Duration(seconds: 1), () { if (choice) { Navigator.push( context, MaterialPageRoute(builder: (context) => const EnterNameScreen()), ); } }); }

@override Widget build(BuildContext context) { if (agreed == null) { return Scaffold( body: Center( child: Padding( padding: const EdgeInsets.all(20.0), child: Column( mainAxisAlignment: MainAxisAlignment.center, children: [ Text('You have been selected to become a player, do you agree or not?', textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineMedium), const SizedBox(height: 30), ElevatedButton( onPressed: () => _onSelect(true), child: const Text('Yes'), ), ElevatedButton( onPressed: () => _onSelect(false), child: const Text('No'), ), ], ), ), ), ); } else { return const Scaffold( body: Center( child: Text('Welcome Player...', style: TextStyle(fontSize: 24, color: Colors.green)), ), ); } } }

class EnterNameScreen extends StatelessWidget { const EnterNameScreen({super.key});

@override Widget build(BuildContext context) { final TextEditingController nameController = TextEditingController();

return Scaffold(
  appBar: AppBar(title: const Text('Enter Your Name')),
  body: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('What is your name?', style: TextStyle(fontSize: 20)),
        const SizedBox(height: 20),
        TextField(
          controller: nameController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter your name',
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            final name = nameController.text.trim();
            if (name.isNotEmpty) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen(playerName: name)),
              );
            }
          },
          child: const Text('Continue'),
        ),
      ],
    ),
  ),
);

} }

class HomeScreen extends StatelessWidget { final String playerName;

const HomeScreen({super.key, required this.playerName});

@override Widget build(BuildContext context) { return Scaffold( appBar: AppBar(title: Text('Welcome, $playerName')), body: Center( child: Text('This is your dashboard, Hunter $playerName!', style: const TextStyle(fontSize: 20)), ), ); } }

