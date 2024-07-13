import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;
  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().getChapter();
    context.read<HomeProvider>().getData();
  }
  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("|| भगवद गीता ||",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                providerR!.setThemeData();
              },
              icon: Icon(providerW!.theme == true
                  ? Icons.light_mode
                  : Icons.dark_mode)),
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: providerW!.chapterList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.orangeAccent
                  ),
                  child: ListTile(
                    onTap: () {
                      providerR!.getSelectedVerse(providerR!.chapterList[index].chapter_number!);
                      Navigator.pushNamed(context, 'detail');
                      providerR!.setIndex(index);
                    },
                    leading: Text("${providerW!.chapterList[index].chapter_number}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),),
                    title: Text("${providerW!.chapterList[index].name}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),),
                    subtitle: Text("${providerW!.chapterList[index].verses_count} verses",style: const TextStyle(fontSize: 15),),
                  ),
                ),
              );
            },),
        ],
      ),
    );
  }
}
