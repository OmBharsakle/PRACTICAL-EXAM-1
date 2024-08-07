import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Provider/HomePageProvider.dart';

class LikePage extends StatelessWidget {
  const LikePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageProvider homePageProvider = Provider.of<HomePageProvider>(context);
    HomePageProvider homePageProviderFalse =
    Provider.of<HomePageProvider>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Quotes',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          actions: [
            SizedBox(
              width: 15,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            ...List.generate(
              homePageProvider.likedQuotes.length,
                  (index) {
                String quote = homePageProvider.likedQuotes[index]
                    .split('-')
                    .sublist(0, 1)
                    .join(' ');
                String author = homePageProvider.likedQuotes[index]
                    .split('-')
                    .sublist(1,2)
                    .join(' ');
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(child: Text('${index + 1}')),
                      title: Text(quote),
                      subtitle: Text(author),
                      trailing: IconButton(
                        icon: Icon(Icons.highlight_remove),
                        onPressed: () {
                          homePageProviderFalse.likedQuotesRemove(index);
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ]),
        ));
  }
}
