import 'package:art_exhibition/constants/constant_backround_color.dart';
import 'package:art_exhibition/utilities/todo.dart';
import 'package:flutter/material.dart';

class MultiContentPage extends StatefulWidget {
  const MultiContentPage({super.key});

  @override
  State<MultiContentPage> createState() => _MultiContentPageState();
}

@Todo('''
ui: yellow page indicator widget
    *appbar
    *yellow page indicator
    *page content (page view)
    *like button

actions: like, dislike, slide

logic: *get all datas from db to a list according to selected category.
       *generate content pages from the list.
       *controll like-saved logic.
       *


''')
@Todo('''

bu sayfa ilgili içeriği parametre alsin
(
  büyük verileri parametre olarak girmek problem olacaktir
  bunun önüne geçmek için lazy update widgetler kullanilabilir
  ancak ben bu  kucuk capli uygulama icin simdilik  parametre olarak
  girebilecegim.  
)

parametreler: icerik(heading, image path, text, id-list-)

''')
class _MultiContentPageState extends State<MultiContentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantBackroundColors.colorLogin.getColor,
      appBar: AppBar(),
      body: const Center(
        child: Text("Multi Content Page"),
      ),
    );
  }
}
