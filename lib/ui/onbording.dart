import 'package:flutter/material.dart';
import '/modal/onbordingmodal.dart';
import 'home.dart';

class OnBording extends StatefulWidget {
  @override
  _OnBordingState createState() => _OnBordingState();
}

class _OnBordingState extends State<OnBording> {
  var currentIndex = 0;
  PageController _controller = PageController(initialPage: 0);

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: model[currentIndex].bgColor,
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: model.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Column(
                    children: [
                      SizedBox(height: 100),
                      Expanded(
                        child: Image.asset(
                          model[i].imgSrc,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30),
                        child: Column(children: [
                          Text(
                            model[i].title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            model[i].desc,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ]),
                      ),
                    ],
                  );
                },
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  model.length,
                  (index) => buildDot(index),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () => {gotoHome()},
                    child: Text("Skip",
                        style: TextStyle(
                          color: Colors.white,
                        ))),
                IconButton(
                    onPressed: () => {
                          currentIndex == model.length - 1
                              ? gotoHome()
                              : gotoNext()
                        },
                    icon: Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.white,
                    ))
              ],
            )
          ],
        ));
  }

  void gotoNext() {
    _controller.nextPage(
      duration: Duration(milliseconds: 100),
      curve: Curves.bounceIn,
    );
  }

  void gotoHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => Home(),
      ),
    );
  }

  Container buildDot(int index) {
    return Container(
      height: 8,
      width: currentIndex == index ? 14 : 8,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white70,
      ),
    );
  }
}
