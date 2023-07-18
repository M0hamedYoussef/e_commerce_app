import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({
    super.key,
    required this.fst,
    required this.children,
  });

  final List<Widget> children;
  final GlobalKey<FormState> fst;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.disabled,
      key: fst,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          physics: const BouncingScrollPhysics(
            parent: PageScrollPhysics(),
          ),
          children: children,
        ),
      ),
    );
  }
}
