import 'package:art_exhibition/utilities/extension_layout.dart';
import 'package:art_exhibition/utilities/todo.dart';
import 'package:art_exhibition/widgets/home/bottom_bar.dart';
import 'package:art_exhibition/widgets/home/categories.dart';
import 'package:art_exhibition/widgets/home/slider.dart';
import 'package:art_exhibition/widgets/home/tittle.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({super.key});
  final PageController _pageController = PageController();

  @override
  State<Home> createState() => _HomeState();
}

@Todo("fade in-out animation will be added to backround image")
@Todo(
  "the text content will change verticaly via pageview. Simultanesly with backround",
)
@Todo("db side of this page will be codded.")
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 13, 13, 13),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.network(
                "https://upload.wikimedia.org/wikipedia/commons/thumb/c/ce/Girl_with_a_Pearl_Earring.jpg/1200px-Girl_with_a_Pearl_Earring.jpg",
              ).image),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.lowRateWidth * 2),
          child: Column(
            children: [
              tittle(context),
              slider(
                context,
                content(context),
              ),
              categories(context, widget._pageController),
              bottomBar(context),
              const Spacer(
                flex: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @Todo("Create an content model and connect it to db. Then call here asnycly")
  Padding content(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.lowRateWidth),
      child: SingleChildScrollView(
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
            elevation: MaterialStateProperty.all<double>(0),
            backgroundColor: MaterialStateProperty.all<Color>(
              Colors.transparent,
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
          child: Column(
            children: [
              Text(
                "İnci Küpeli Karı",
                style: TextStyle(
                    color: Colors.white.withOpacity(0.8), fontSize: 40),
              ),
              Text(
                '''
        Resim, Hollandalıların 17. yüzyılda portre olması amaçlanmayan bir 'baş' tanımıdır. Egzotik bir elbise, oryantal bir türban ve küpe olarak çok büyük bir inci olduğu düşünülen şey giyen Avrupalı bir kızı tasvir ediyor.[1] 2014'te Hollandalı astrofizikçi Vincent Icke, küpenin malzemesiyle ilgili şüphelerini dile getirdi ve aynasal yansıma, armut şekli ve küpenin büyük boyutu nedeniyle inciden çok cilalı kalay gibi göründüğünü savundu.[4][5]
                                      
        İş tuval üzerine yağlı boyadır ve 44,5 cm (17,5 inç) yüksekliğinde ve 39 cm (15 inç) genişliğindedir. Üzerinde "IVMeer" imzası var ama tarih bulunmamaktadır. 1665 yılı civarında boyandığı tahmin edilmektedir.[6]
                                      
        Resmin 1994 yılındaki en son restorasyonundan sonra, ince renk şeması ve kızın bakışlarının izleyiciye olan yakınlığı büyük ölçüde geliştirildi.[7] Restorasyon sırasında, bugün biraz alacalı olan koyu arka planın, orijinal olarak derin emaye benzeri bir yeşil olduğu ortaya çıktı.
                                    
        Resim, Hollandalıların 17. yüzyılda portre olması amaçlanmayan bir 'baş' tanımıdır. Egzotik bir elbise, oryantal bir türban ve küpe olarak çok büyük bir inci olduğu düşünülen şey giyen Avrupalı bir kızı tasvir ediyor.[1] 2014'te Hollandalı astrofizikçi Vincent Icke, küpenin malzemesiyle ilgili şüphelerini dile getirdi ve aynasal yansıma, armut şekli ve küpenin büyük boyutu nedeniyle inciden çok cilalı kalay gibi göründüğünü savundu.[4][5]
                                      
        İş tuval üzerine yağlı boyadır ve 44,5 cm (17,5 inç) yüksekliğinde ve 39 cm (15 inç) genişliğindedir. Üzerinde "IVMeer" imzası var ama tarih bulunmamaktadır. 1665 yılı civarında boyandığı tahmin edilmektedir.[6]
                                      
        Resmin 1994 yılındaki en son restorasyonundan sonra, ince renk şeması ve kızın bakışlarının izleyiciye olan yakınlığı büyük ölçüde geliştirildi.[7] Restorasyon sırasında, bugün biraz alacalı olan koyu arka planın, orijinal olarak derin emaye benzeri bir yeşil olduğu ortaya çıktı.
        ''',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                ),
                textDirection: TextDirection.ltr,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
