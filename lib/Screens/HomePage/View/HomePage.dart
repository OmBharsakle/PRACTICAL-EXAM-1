import 'package:adv_exam_1/Provider/HomePageProvider.dart';
import 'package:adv_exam_1/Screens/LikePage/View/LikePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageProvider homePageProvider = Provider.of<HomePageProvider>(context);
    HomePageProvider homePageProviderFalse =
        Provider.of<HomePageProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Text(
          'Quotes',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => LikePage(),));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: badges.Badge(
                badgeContent: Text(homePageProvider.likedQuotes.length.toString()),
                child: Icon(Icons.favorite_border),
              ),
            ),
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body:homePageProvider.isLoding?SingleChildScrollView(
        child: Column(
            children: [
              ...List.generate(
                  homePageProvider.quotesModal.quotes.length,
                      (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Card(
                      child: ListTile(
                        leading: CircleAvatar(child: Text('${index + 1}')),
                        title: Text(
                            homePageProvider.quotesModal.quotes[index].quote),
                        subtitle: Text(homePageProvider
                            .quotesModal.quotes[index].author),
                        trailing: IconButton(
                          icon: homePageProvider.isLike? Icon(Icons.favorite) :Icon(Icons.favorite_border) ,
                          onPressed: () {
                            homePageProviderFalse.likeSave(index);
                            homePageProviderFalse.likeGet();
                            print(homePageProvider.likedQuotes);
                          },
                        ),
                      ),
                    ),
                  ))
            ],
          ),
      ):Center(child: CircularProgressIndicator(),
      ),
    );
  }
}
