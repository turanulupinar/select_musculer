import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _regionName = "";
  pozitionedMusc(TapDownDetails details) {
    RenderBox box = context.findRenderObject() as RenderBox;
    double imageWidth = box.size.width;
    double imageHeight = box.size.height;
    _onTapDown(details, imageWidth, imageHeight);
  }

  void _onTapDown(
      TapDownDetails details, double imageWidth, double imageHeight) {
    final double x = details.localPosition.dx;
    final double y = details.localPosition.dy;

    // Örnek bölge: Sol üst köşe (0, 0) - Sağ alt köşe (100, 100)
    if (x >= 20 &&  x <= 40 ||y >= 55 && y <= 70) {
      setState(() {
        _regionName = "Region 1";
      });
    } else if (x >= 200 && x <= 300 && y >= 200 && y <= 300) {
      setState(() {
        _regionName = "Region 2";
      });
    } else {
      setState(() {
        _regionName = "Unknown region";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Hedef Kas Grubu"),
      ),
      body: SizedBox(
        height: 800,
        width: 450,
        child: PageView.builder(itemBuilder: (context, index) {
          return Stack(
            children: [
              SizedBox(
                height: 800,
                width: 450,
                child: GestureDetector(
                  onTapDown: pozitionedMusc,
                  child: const Image(
                    image: AssetImage("assets/front/front.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                color: Colors.red,
                height: 100,
                width: 50,
              ),
              Text(_regionName)
            ],
          );
        }),
      ),
    );
  }
}
