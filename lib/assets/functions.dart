import 'package:flutter/material.dart';

goto({required BuildContext context, required Widget screen}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
}
