import 'package:flutter/material.dart';
import 'package:todo_app_ulisinio/utils/todo_list.dart';

// Definición del widget de la página principal como un StatefulWidget para manejar cambios de estado
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// Estado de la página principal donde se maneja la lista de tareas
class _HomePageState extends State<HomePage> {

  // Controlador para el campo de texto donde se ingresa una nueva tarea
  final _controller = TextEditingController();

  // Lista de tareas, cada tarea tiene el nombre y un valor booleano que indica si está completada
  List toDoList = [
    ['Pasar la unidad 2 de Móviles', false],
    ['Tomar agua', false],
    ['Hacer mis Commits', false]
  ];

  // Método para cambiar el estado de completado de una tarea (checked/unchecked)
  void checkBoxChanged(int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  // Método para guardar una nueva tarea ingresada por el usuario
  void saveNewTask() {
    setState(() {
      // Agrega la tarea con el valor false (no completada) y limpia el campo de texto
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
  }

  // Método para eliminar una tarea según el índice especificado
  void deleteTask(int index) {
    setState(() {
      // Elimina la tarea de la lista
      toDoList.removeAt(index);
    });
  }

  // Construcción de la interfaz de usuario de la página principal
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        title: const Text('ToDo Simple'), // Título del AppBar
        backgroundColor: Colors.deepPurple, // Color de fondo del AppBar
        foregroundColor: Colors.white, // Color del texto en el AppBar
      ),

      // Cuerpo de la página: lista de tareas usando ListView.builder para rendimiento en listas dinámicas
      body: ListView.builder(
        itemCount: toDoList.length, // Número total de tareas en la lista
        itemBuilder: (BuildContext context, index) {
          return TodoList(
            taskName: toDoList[index][0], // Nombre de la tarea
            taskCompleted: toDoList[index][1], // Estado de completado de la tarea
            onChanged: (value) => checkBoxChanged(index), // Cambio en el estado de completado
            deleteFunction: (context) => deleteTask(index), // Función para eliminar la tarea
          );
        },
      ),

      // Botón flotante para añadir una nueva tarea
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),

                // Campo de texto donde el usuario ingresa la nueva tarea
                child: TextField(
                  controller: _controller, // Controlador para obtener el texto ingresado
                  decoration: InputDecoration(
                    hintText: 'Añadir nueva tarea', // Texto sugerido para el usuario
                    filled: true,
                    fillColor: Colors.deepPurple.shade200, // Color de fondo del campo de texto
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.deepPurple,
                      ),
                      borderRadius: BorderRadius.circular(15), // Bordes redondeados
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.deepPurple,
                      ),
                      borderRadius: BorderRadius.circular(15), // Bordes redondeados cuando se selecciona
                    ),
                  ),
                ),
              ),
            ),

            // Botón flotante que agrega una nueva tarea al presionarse
            FloatingActionButton(
              onPressed: saveNewTask, // Llama al método que guarda la nueva tarea
              child: const Icon(Icons.add), // Icono de agregar
            ),
          ],
        ),
      ),
    );
  }
}
