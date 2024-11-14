import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// Definición del widget TodoList como un StatelessWidget, que representa una tarea en la lista de tareas
class TodoList extends StatelessWidget {
  const TodoList({
    super.key,
    required this.taskName, // Nombre de la tarea
    required this.taskCompleted, // Estado de la tarea (completada o no)
    required this.onChanged, // Función para cambiar el estado de la tarea
    required this.deleteFunction, // Función para eliminar la tarea
  });

  // Variables necesarias para mostrar y manejar cada tarea
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Espaciado alrededor de cada tarea
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: 0,
      ),

      // Slidable permite deslizar el widget para ver acciones como eliminar
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(), // Efecto de estiramiento en la acción deslizable
          children: [
            // Acción deslizante para eliminar la tarea
            SlidableAction(
              onPressed: deleteFunction, // Llama a la función de eliminación
              icon: Icons.delete, // Icono de eliminar
              borderRadius: BorderRadius.circular(15), // Bordes redondeados
            ),
          ],
        ),

        // Contenedor principal que muestra el nombre de la tarea y el checkbox
        child: Container(
          padding: const EdgeInsets.all(20), // Espaciado interno del contenedor
          decoration: BoxDecoration(
            color: Colors.deepPurple, // Color de fondo del contenedor
            borderRadius: BorderRadius.circular(15), // Bordes redondeados
          ),

          // Fila que contiene el checkbox y el nombre de la tarea
          child: Row(
            children: [
              // Checkbox para marcar la tarea como completada o no
              Checkbox(
                value: taskCompleted, // Valor del checkbox basado en el estado de la tarea
                onChanged: onChanged, // Llama a la función para actualizar el estado
                checkColor: Colors.black, // Color del check
                activeColor: Colors.white, // Color de fondo cuando está activo
                side: const BorderSide(color: Colors.white), // Color del borde del checkbox
              ),

              // Texto que muestra el nombre de la tarea
              Text(
                taskName,
                style: TextStyle(
                  color: Colors.white, // Color del texto
                  fontSize: 18, // Tamaño de la fuente
                  decoration: taskCompleted // Si la tarea está completada, la decora con una línea
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationColor: Colors.white, // Color de la línea de tachado
                  decorationThickness: 2, // Grosor de la línea de tachado
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
