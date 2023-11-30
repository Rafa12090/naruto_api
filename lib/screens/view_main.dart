import 'package:flutter/material.dart';
import 'package:naruto_app/screens/characters_naruto.dart';

class ViewMain extends StatelessWidget {
  const ViewMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Welcome to'),
            const Text('Naruto Application'),
            Image.network(
              'https://assets.turbologo.com/blog/en/2021/11/14061115/Naruto_logo.png',
              width: 150, // Ajusta el ancho según sea necesario
              height: 75,  // Ajusta el alto según sea necesario
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const CharactersNaruto()));
              },
              child: const Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}
