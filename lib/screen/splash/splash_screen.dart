import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () =>
        Navigator.pushReplacementNamed(context, "home"));}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          // height: MediaQuery.sizeOf(context).height,
          //   width: MediaQuery.sizeOf(context).width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjg0cXkRbepqT3c9E1N1xeNLcWyY9Eu94B6pHlXJ8hhu6oU0Ipf7TgctRI5EP8mhd-9pw&usqp=CAU"),
              ),
            )
        )
    );
  }
}