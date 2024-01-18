// import 'package:flutter/material.dart';
// import 'package:project_notez/logic/functions.dart';

// class NotePreview extends StatelessWidget {
//   const NotePreview({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 150,
//       child: Material(
//         shape: const BeveledRectangleBorder(
//           borderRadius: BorderRadius.only(
//             topRight: Radius.circular(20),
//           ),
//         ),
//         child: Container(
//           margin: const EdgeInsets.only(right: 15),
//           child: ListTile(
//             title: Text(
//               notes[index].title,
//               overflow: TextOverflow.ellipsis,
//             ),
//             subtitle: Column(
//               children: [
//                 Text(
//                   notes[index].description,
//                   maxLines: 3,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 const SizedBox(height: 10),
//                 Align(
//                   alignment: Alignment.bottomRight,
//                   child: Text(
//                     getGermanDateTime(notes[index].dateLastUpdated),
//                   ),
//                 ),
//               ],
//             ),
//             //^later: onTap: () => Navigator.pushNamed(context, '${Routes.notes}/${notes[index].id}'),

//             // trailing: IconButton(
//             //   icon: const Icon(Icons.remove),
//             //   onPressed: () {
//             //     ref.read(notesProvider.notifier).remove(notes[index].id);
//             //   },
//             // ),
//           ),
//         ),
//       ),
//     );
//   }
// }
