import 'package:flutter/material.dart';

class loadingTitle extends StatelessWidget {
  const loadingTitle({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> loadingTitle = "ANSABE?".split("");
    return Container(
      child: Row(
        children: loadingTitle.map((e) => (LoadingWidget(e))).toList(),
      ),
    );
  }

  Widget LoadingWidget(String e) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 60,
        width: 40,
        decoration: BoxDecoration(
            color: Colors.amberAccent,
            borderRadius: BorderRadius.circular(12.0)),
        child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              color: Colors.red[400], borderRadius: BorderRadius.circular(8.0)),
          child: Center(
            child: Text(
              e,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber),
            ),
          ),
        ),
      ),
    );
  }
}
