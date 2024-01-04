import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatefulWidget {
  final String? taskName;
  final String? price; // Change the type to String
  final bool? isCompleted;
  final Function(bool?)? onChanged;
  final void Function(BuildContext)? deleteItem;

  const TodoTile({
    super.key,
    this.taskName,
    this.isCompleted,
    this.onChanged,
    this.deleteItem,
    this.price,
  });

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(10),
              backgroundColor: Colors.purple,
              onPressed: widget.deleteItem,
              icon: Icons.delete_forever,
            ),
          ],
        ),
        child: Container(
          width: 400,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.deepPurple[100],
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Checkbox(
                  value: widget.isCompleted ?? false,
                  onChanged: widget.onChanged,
                ),
                Text(
                  widget.taskName ?? '',
                  style: TextStyle(
                    fontSize: 15,
                    decoration:
                        widget.isCompleted != null && widget.isCompleted!
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(left: 50, right: 50)),

                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    'price: ${widget.price}',
                    style: const TextStyle(fontSize: 15),
                  ),
                ), // Display price as String
              ],
            ),
          ),
        ),
      ),
    );
  }
}
