import 'package:assignment/view/home/home_screen/model/blog_post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/parser.dart' as htmlparser;
import 'package:html/dom.dart' as dom;

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  static const routeName = '/article';

  void addFavorite(int id) {
    // TODO: add to favorite
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as BlogPost;
    final size = MediaQuery.of(context).size;
    String htmlData = """${args.content}""";
    dom.Document document = htmlparser.parse(htmlData);
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 237, 235, 230),
          appBar: AppBar(
            title: const Text('Article Detail'),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: (() => addFavorite),
                icon: const Icon(Icons.favorite),
              ),
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: size.height * 0.35,
                decoration: BoxDecoration(),
                child: Stack(
                  children: [
                    Container(
                      height: size.height * 0.35 - 27,
                      width: size.width,
                      child: Image.network(
                        args.image!,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 20),
                        child: Row(
                          children: [
                            Text(
                              args.title!,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Html.fromDom(
                    document: document,
                    style: {
                      "p": Style(
                        fontSize: const FontSize(16),
                        color: const Color(0xFF000000),
                        fontFamily: "Poppins",
                        textAlign: TextAlign.justify,
                      ),
                    },
                  ),
                ),
              ),
              // Expanded(
              //   flex: 2,
              //   child: Container(
              //     // decoration: ,
              //     child: Image.network(
              //       blogPost.image!,
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
              // Expanded(
              //   flex: 3
              // ),
            ],
          )),
    );
  }
}
