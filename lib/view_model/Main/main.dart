import 'package:flutter/material.dart';

import '../Home/home.dart' as home;
import '../About/about.dart' as about;
import '../Story/story.dart' as story;
import '../Blog/blog.dart' as blog;
import '../Credit/credit.dart' as credit;

class View extends StatefulWidget {
  const View({super.key});

  @override
  State<View> createState() => _ViewState();
}

class _ViewState extends State<View> {
  int currentTabIndex = 0;

  void setTab(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final tabs = ['Home', 'About', 'Story', 'Blog', 'Credit'];
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/assets/images/appbar_bg.jpg'),
              fit: BoxFit.cover,
            ),
            border: Border(
              bottom: BorderSide(
                color: Color.fromARGB(255, 102, 161, 237),
                width: 2,
              ),
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(tabs.length, (index) {
            final isSelected = currentTabIndex == index;
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    backgroundColor: isSelected
                        ? Color.fromARGB(255, 115, 102, 208)
                        : Colors.transparent,
                    foregroundColor: isSelected ? Colors.white : Colors.black,
                    elevation: isSelected ? 4 : 0,
                  ),
                  onPressed: () => setTab(index),
                  child: Text(tabs[index]),
                ),
              ),
            );
          }),
        ),
      ),

      body: IndexedStack(
        index: currentTabIndex,
        children: const [
          home.View(),
          about.View(),
          story.View(),
          blog.View(),
          credit.View(),
        ],
      ),
    );
  }
}
