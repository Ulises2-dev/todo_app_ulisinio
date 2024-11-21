author: Ulises Millán
summary: En este codelab, aprenderás a personalizar un widget en Flutter que representa una lista de tareas con opciones como marcar como completada, eliminar tareas y mostrar su nombre con estilo.
id: personalizar-todo-list-flutter
tags: [taller, iguide]
categories: [flutter, mobile development]
environments: Web
status: Published
feedback link: https://github.com/ulisesmillangonzalez/todo-list-flutter-codelab/issues

# Personalizando una lista de tareas en Flutter

## Introducción
Duration: 0:05:00

## Configuración del widget TodoList
Duration: 0:15:00

## Paso 1: Crear un widget TodoList
Duration: 0:10:00

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Tareas',
      home: TodoList(),
    );
  }
}

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tareas'),
      ),
      body: Center(
        child: Text('Aquí irán las tareas'),
      ),
    );
  }
}
```

## Paso 2: Configuración del estado
Duration: 0:05:00

```dart
class _TodoListState extends State<TodoList> {
  final List<Map<String, dynamic>> tasks = [
    {'name': 'Tarea 1', 'completed': false},
    {'name': 'Tarea 2', 'completed': false},
    {'name': 'Tarea 3', 'completed': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tareas'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return ListTile(
            title: Text(task['name']),
          );
        },
      ),
    );
  }
}
```

## Paso 3: Mostrar lista de tareas
Duration: 0:10:00

```dart
class _TodoListState extends State<TodoList> {
  final List<Map<String, dynamic>> tasks = [
    {'name': 'Tarea 1', 'completed': false},
    {'name': 'Tarea 2', 'completed': false},
    {'name': 'Tarea 3', 'completed': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tareas'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return ListTile(
            title: Text(task['name']),
          );
        },
      ),
    );
  }
}
```

## Paso 4: Agregar Checkbox
Duration: 0:05:00

```dart
class _TodoListState extends State<TodoList> {
  final List<Map<String, dynamic>> tasks = [
    {'name': 'Tarea 1', 'completed': false},
    {'name': 'Tarea 2', 'completed': false},
    {'name': 'Tarea 3', 'completed': false},
  ];

  void toggleCompletion(int index) {
    setState(() {
      tasks[index]['completed'] = !tasks[index]['completed'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tareas'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return ListTile(
            leading: Checkbox(
              value: task['completed'],
              onChanged: (value) {
                toggleCompletion(index);
              },
            ),
            title: Text(task['name']),
          );
        },
      ),
    );
  }
}
```

## Paso 5: Marcar tarea como completada
Duration: 0:10:00

La tarea se marca como completada al cambiar el valor del `Checkbox`.

```dart
// Función toggleCompletion ya está configurada para marcar la tarea como completada
```

## Paso 6: Añadir funcionalidad de eliminación
Duration: 0:10:00

```dart
void removeTask(int index) {
  setState(() {
    tasks.removeAt(index);
  });
}
```

## Paso 7: Estilización de la tarea completada
Duration: 0:05:00

```dart
Text(
  task['name'],
  style: TextStyle(
    decoration: task['completed'] ? TextDecoration.lineThrough : TextDecoration.none,
  ),
)
```

## Paso 8: Incluir Slidable para eliminar tarea
Duration: 0:10:00

```dart
import 'package:flutter_slidable/flutter_slidable.dart';

Slidable(
  actionPane: SlidableDrawerActionPane(),
  actionExtentRatio: 0.25,
  child: ListTile(
    leading: Checkbox(
      value: task['completed'],
      onChanged: (value) {
        toggleCompletion(index);
      },
    ),
    title: Text(task['name']),
  ),
  secondaryActions: [
    IconSlideAction(
      caption: 'Eliminar',
      color: Colors.red,
      icon: Icons.delete,
      onTap: () => removeTask(index),
    ),
  ],
)
```

## Paso 9: Finalización y pruebas
Duration: 0:05:00

Una vez implementados todos los pasos anteriores, puedes probar la lista de tareas en tu dispositivo o emulador para verificar que todo funcione correctamente.
