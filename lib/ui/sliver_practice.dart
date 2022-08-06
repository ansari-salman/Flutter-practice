import 'package:demo_app/modal/onbordingmodal.dart';
import 'package:demo_app/ui/recipe.dart';
import 'package:flutter/material.dart';

class SliverPractice extends StatefulWidget {
  const SliverPractice({Key? key}) : super(key: key);

  @override
  _SliverPracticeState createState() => _SliverPracticeState();
}

class _SliverPracticeState extends State<SliverPractice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: CustomHeader(),
          ),
          SliverList(
            delegate: SliverChildListDelegate(List.generate(
                30,
                (index) => ListTile(
                    title: Text("Hi There I am using flutter $index")))),
          ),
        ],
      ),
    );
  }
}

const maxHeader = 400.0;
const minHeader = 80.0;

const _maxIconSize = 80.0;
const _minIconSize = 40.0;

const _leftEnd = 45.0;

class CustomHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final percent = shrinkOffset / maxHeader;

    final _leftInitial =
        (MediaQuery.of(context).size.width / 2) - (((_maxIconSize) * 1.2) / 2);

    print(shrinkOffset);

    final iconSize =
        (_maxIconSize * (1 - percent)).clamp(_minIconSize, _maxIconSize);
    final iconLeft =
        (_leftInitial * (1 - percent)).clamp(_leftEnd, _leftInitial);

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset('images/sneaking.jpeg',
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover),
        SizedBox(
          height: 150,
          child: Column(
            children: [
              Expanded(
                  child: Container(
                      // color: Colors.red,
                      )),
              Expanded(
                child: AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(
                                  shrinkOffset >= (maxHeader - minHeader)
                                      ? 1.0
                                      : 0.0),
                              blurRadius: 7,
                              offset: Offset(0, 4))
                        ],
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30))),
                    child: Row(
                      children: [
                      ],
                    ),
                    ),
              ),
              
            ],
          ),
        ),
        Positioned.fill(
          child: Container(
            color: Colors.white.withOpacity(percent),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).padding.top + 14,
          left: 15,
          child: GestureDetector(
            onTap: ()=>Navigator.of(context).pop(),
            child: Icon(Icons.arrow_back_ios_new_rounded))),
        Positioned(
            left: iconLeft,
            bottom: 25,
            child: Container(
                height: (iconSize) * 1.2,
                width: (iconSize) * 1.2,
                padding: EdgeInsets.all(iconSize / 15),
                decoration:
                    BoxDecoration(color: Colors.indigo, shape: BoxShape.circle),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset('images/dp.jpeg', fit: BoxFit.cover)))),
                    Positioned(child: Text('Aiden Pearce',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black))),
      ],
    );
  }

  @override
  double get maxExtent => maxHeader;

  @override
  double get minExtent => minHeader;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
