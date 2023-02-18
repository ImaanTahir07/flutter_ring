import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:flutter_stack/view/stack.dart';

class practiceSlider extends StatefulWidget {
  const practiceSlider({super.key});

  @override
  State<practiceSlider> createState() => _practiceSliderState();
}

class _practiceSliderState extends State<practiceSlider> {
  double myVal = 70;
  double height = 50;
  double width = 50;
  bool isVisible = false;
  // double opacity = 0.7;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.indigo.shade800,
      body: Stack(
        children: [
          ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(colors: [Colors.pink, Colors.purple])
                  .createShader(bounds);
            },
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.indigo.shade800,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 300,
                  child: Container(
                    height: height,
                    width: width,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withAlpha(20),
                            blurRadius: 8.0,
                            spreadRadius: 0.0,
                            offset: Offset(
                              0.0,
                              3.0,
                            ),
                          ),
                        ],
                        border: Border.all(
                            color: Colors.white.withOpacity(0.7), width: 4),
                        shape: BoxShape.circle),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: 250,
                  child: Slider(
                    inactiveColor: Colors.grey.shade400,
                    activeColor: Colors.white.withOpacity(0.4),
                    min: 70,
                    max: 150,
                    value: myVal,
                    // onChanged: (value) {

                    // },
                    onChanged: (value) {
                      setState(() {
                        myVal = value;
                        height = value;
                        width = value;
                        isVisible = false;
                        // opacity++;

                        print(value);
                      });
                      // double ringsize = 2 * 3.142 * width.ceil();
                    },
                  ),
                ),
                // Text(height.ceil().toString()),
                // Text(width.ceil().toString()),

                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        backgroundColor: Colors.white.withOpacity(0.2)),
                    onPressed: () {
                      setState(() {
                        isVisible = isVisible == true ? false : true;
                      });
                    },
                    child: Text("Measure your ring size")),
                SizedBox(
                  height: 25,
                ),
                Visibility(
                  visible: isVisible,
                  child: Text(
                    "Your Ring size is: ${(((2 * 3.142 * width.ceil() * 0.02645833) * 10)).ceil()} millimeters",
                    style: TextStyle(
                        color: Colors.grey.shade300,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
