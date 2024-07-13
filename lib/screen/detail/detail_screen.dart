import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../home/provider/home_provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;

  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().getData();
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: context
            .read<HomeProvider>()
            .language == "Sanskrit"
            ? Text(
          "${providerR!.chapterList[providerW!.index].name_sanskrit}",
          style:TextStyle(fontWeight: FontWeight.bold)
        )
            : context
            .read<HomeProvider>()
            .language == "English"
            ? Text(
          "${providerR!.chapterList[providerW!.index].name_translation}",
          style: Theme
              .of(context)
              .textTheme
              .titleLarge,
        )
            : Text(
          "${providerR!.chapterList[providerW!.index].name}",
          style: Theme
              .of(context)
              .textTheme
              .titleLarge,
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                    onTap: () {
                      showWebDialog();
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.language),
                        SizedBox(width: 10,),
                        Text("Language"),
                      ],
                    )
                ),
                PopupMenuItem(
                    onTap: () {
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.favorite),
                        SizedBox(width: 10,),
                        Text("favorite"),

                      ],
                    )
                ),
              ];
            },
          )
        ],
      ),
      body: Stack(
        children: [
          Image.network(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXXlLfDzO3wnhQXrkTB_lsK5mq_hXwSa8fGQ&s",
            width: MediaQuery
                .sizeOf(context)
                .width,
            height: MediaQuery
                .sizeOf(context)
                .height,
            fit: BoxFit.cover,
            opacity: const AlwaysStoppedAnimation(0.5),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 280,
                    width: 400,
                    child: Image.network(
                      "${providerR!.chapterList[providerW!.index].imageUrl}",
                      height: 200,
                      width: MediaQuery
                          .sizeOf(context)
                          .width,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                // Text("${providerW!.chapterList[providerR!.index].name_sanskrit}"),
                const Text(
                  "જય શ્રી કૃષ્ણ ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: providerW!.filterList.length,
                  itemBuilder: (context, index) {
                    return Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(10),
                        child: Center(
                        child: providerW!.language == "Sanskrit"
                        ? Text(
                        "${providerR!.filterList[index].text}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),)
                            : providerW!.language == "English"
                                            ? Text(
                                            "${providerR!.filterList[index].transliteration}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)): Text(
                                            "${providerR!.filterList[providerW!.index].hindi_meaning}",style: TextStyle(fontWeight: FontWeight.bold,fontSize:20)),
                                            ),
                    );
                    },
                ),
              ],
            ),
          ),
        ],
      ),
    );

    // return Scaffold(
    //   appBar: AppBar(
    //     title:Scaffold(
    //       appBar: AppBar(
    //         title: Text("${providerR!.chapterList[providerW!.index].name_sanskrit}"),
    //         centerTitle: true,
    //         backgroundColor: Colors.orangeAccent,
    //       ),
    //       body: Stack(
    //         children: [
    //           Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXXlLfDzO3wnhQXrkTB_lsK5mq_hXwSa8fGQ&s",
    //             width: MediaQuery.sizeOf(context).width,
    //             height: MediaQuery.sizeOf(context).height,
    //             fit: BoxFit.cover,
    //             opacity: AlwaysStoppedAnimation(0.5),
    //           ),
    //           Column(
    //             children: [
    //               Padding(
    //                 padding: const EdgeInsets.all(8.0),
    //                 child: Image.network(
    //                   "${providerR!.chapterList[providerW!.index].imageUrl}",
    //                   height: 200,
    //                   width: MediaQuery.sizeOf(context).width,
    //                   fit: BoxFit.fill,
    //                 ),
    //               ),
    //               // Text("${providerW!.chapterList[providerR!.index].name_sanskrit}"),
    //               Padding(
    //                 padding: const EdgeInsets.all(8.0),
    //                 child: Text("${providerW!.chapterList[providerR!.index].chapter_summary}",style: const TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),),
    //               ),
    //               Expanded(
    //                 child: ListView.builder(
    //                   itemCount: providerW!.verseList.length,
    //                   itemBuilder: (context, index) {
    //                     return Container(
    //                         margin: const EdgeInsets.all(10),
    //                         padding: const EdgeInsets.all(10),
    //                         child: Center(
    //                             child: Text(
    //                               "${providerW!.verseList[index].text}",
    //                               style: const TextStyle(
    //                                   fontWeight: FontWeight.bold, fontSize: 18),
    //                             )));
    //                   },
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //     );
    //         Text("${providerR!.chapterList[providerW!.index].name_sanskrit}"),
    //     centerTitle: true,
    //     backgroundColor: Colors.orangeAccent,
    //   ),
    //   body: Column(
    //     children: [
    //       Stack(
    //         children: [
    //           Image.network(
    //             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXXlLfDzO3wnhQXrkTB_lsK5mq_hXwSa8fGQ&s",
    //             width: MediaQuery.sizeOf(context).width,
    //             height: MediaQuery.sizeOf(context).height,
    //             fit: BoxFit.cover,
    //             opacity: AlwaysStoppedAnimation(0.5),
    //           ),
    //           Expanded(
    //             child: CustomScrollView(
    //               slivers: [
    //                 SliverToBoxAdapter(
    //                   child: Padding(
    //                     padding: const EdgeInsets.all(8.0),
    //                     child: Image.network(
    //                       "${providerR!.chapterList[providerW!.index].imageUrl}",
    //                       height: 200,
    //                       width: MediaQuery.sizeOf(context).width,
    //                       fit: BoxFit.fill,
    //                     ),
    //                   ),
    //                   // Text("${providerW!.chapterList[providerR!.index].name_sanskrit}"),
    //                 ),
    //                 SliverToBoxAdapter(
    //                   child: Padding(
    //                     padding: const EdgeInsets.all(8.0),
    //                     child: Text(
    //                       "${providerW!.chapterList[providerR!.index].chapter_summary}",
    //                       style: const TextStyle(
    //                           fontSize: 15,
    //                           color: Colors.black,
    //                           fontWeight: FontWeight.bold),
    //                     ),
    //                   ),
    //                 ),
    //                 // SliverToBoxAdapter(
    //                 //   child: ListView.builder(
    //                 //     itemCount: providerW!.verseList.length,
    //                 //     itemBuilder: (context, index) {
    //                 //       return Container(
    //                 //           margin: const EdgeInsets.all(10),
    //                 //           padding: const EdgeInsets.all(10),
    //                 //           child: Center(
    //                 //               child: Text(
    //                 //             "${providerW!.verseList[index].text}",
    //                 //             style: const TextStyle(
    //                 //                 fontWeight: FontWeight.bold, fontSize: 18),
    //                 //           )));
    //                 //     },
    //                 //   ),
    //                 // ),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
  }

  void showWebDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            Column(
              children: [
                RadioListTile(
                  value: "Sanskrit",
                  groupValue: providerW!.language,
                  onChanged: (value) {
                    providerW!.setLanguage(value.toString());
                    Navigator.pop(context);
                  }, title: const Text("Sanskrit"),),
                RadioListTile(
                  value: "Hindi",
                  groupValue: providerW!.language,
                  onChanged: (value) {
                    providerW!.setLanguage(value.toString());
                    Navigator.pop(context);
                  }, title: const Text("Hindi"),),
                RadioListTile(
                  value: "English",
                  groupValue: providerW!.language,
                  onChanged: (value) {
                    providerW!.setLanguage(value.toString());
                    Navigator.pop(context);
                  }, title: const Text("English"),),
              ],
            )
          ],
        );
      },);
  }
}
