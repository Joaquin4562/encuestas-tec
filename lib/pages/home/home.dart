import 'package:encuestas_tec/pages/global_widgets/custom_btn.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 0, 91, 160),
        title: Text(
          'Encuestas',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 6.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Menu',
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
            child: Padding(
              padding: const EdgeInsets.only(right: 300, left: 6),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Color.fromARGB(255, 0, 91, 160),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          CustomButton(
            padding: 25,
            label: 'Estudio socioeconomico',
            fillColor: Color.fromARGB(255, 135, 20, 86),
            icon: Icons.poll,
            splashColr: Colors.amber,
            colorIcon: Colors.white,
            colorText: Colors.white,
            onPressed: () {
              Navigator.pushNamed(context, 'estudio_socioeconomico');
            },
          ),
          const SizedBox(height: 20),
          CustomButton(
            padding: 25.0,
            label: 'Ficha de identificación',
            fillColor: Color.fromARGB(255, 80, 110, 255),
            icon: Icons.graphic_eq_rounded,
            splashColr: Colors.amber,
            colorIcon: Colors.white,
            colorText: Colors.white,
            onPressed: () {
              Navigator.pushNamed(context, 'ficha_identificacion');
            },
          ),
          const SizedBox(height: 20),
          CustomButton(
            padding: 25.0,
            label: 'Formato de encuesta',
            fillColor: Color.fromARGB(255, 177, 84, 255),
            icon: Icons.emoji_people_outlined,
            splashColr: Colors.amber,
            colorIcon: Colors.white,
            colorText: Colors.white,
            onPressed: () {
              Navigator.pushNamed(context, 'formato_encuesta');
            },
          ),
        ],
      ),
    );
  }
}
