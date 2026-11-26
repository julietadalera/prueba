import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tareas',
      theme: ThemeData(
        
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Registro de tareas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final c = TextEditingController();
  List<String> tareas = [];


  void agregar() {
    if (c.text.trim().isEmpty) return;
    setState(() {
      tareas.add(c.text.trim());
    });
    c.clear();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: c,
              decoration: const InputDecoration(labelText: 'Nueva tarea'),
            ),
            ElevatedButton(onPressed: agregar, 
            child: const Text('Agregar')
            ),
          Expanded(
            child: ListView.builder(
              itemCount: tareas.length,
              itemBuilder: (context, i) => ListTile(
                title: Text(tareas[i]),
                trailing: IconButton(
                  onPressed: () => setState(() => tareas.removeAt(i)), 
                  icon: const Icon(Icons.delete)),
              ),
            ))
          ]
        ),
      ),
    );
  }
}
