import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10,top: 30,right: 125),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back),
                        iconSize: 30,
                        color: Colors.black,
                      ),
                      const Text(
                        "Help Section",
                        style: TextStyle(
                            letterSpacing: 1.2,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 2, right: 20),
              child: Text(
                "Ado ado ado meh boru marisi danda epa harida, Umberlath manussayo apith manussayo Ado ado ado meh boru marisi danda epa harida, Umberlath manussayo apith manussayo Ado ado ado meh boru marisi danda epa harida, Umberlath manussayo apith manussayo",
                style: TextStyle(
                    letterSpacing: 1.2, fontSize: 16, color: Colors.black),
                textAlign: TextAlign.justify,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Hello World",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 10, right: 20),
              child: Text(
                "Ado ado ado meh boru marisi danda epa harida, Umberlath manussayo apith manussayo Ado ado ado meh boru marisi danda epa harida, Umberlath manussayo apith manussayo Ado ado ado meh boru marisi danda epa harida, Umberlath manussayo apith manussayo",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
                textAlign: TextAlign.justify,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Hello World",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 10, right: 20),
              child: Text(
                "Ado ado ado meh boru marisi danda epa harida, Umberlath manussayo apith manussayo Ado ado ado meh boru marisi danda epa harida, Umberlath manussayo apith manussayo Ado ado ado meh boru marisi danda epa harida, Umberlath manussayo apith manussayo",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
                textAlign: TextAlign.justify,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Hello World",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 10, right: 20),
              child: Text(
                "Ado ado ado meh boru marisi danda epa harida, Umberlath manussayo apith manussayo Ado ado ado meh boru marisi danda epa harida, Umberlath manussayo apith manussayo Ado ado ado meh boru marisi danda epa harida, Umberlath manussayo apith manussayo",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                "assets/logo.png",
                width: 160,
              ),
            )
          ],
        ),
      ),
    );
  }
}
