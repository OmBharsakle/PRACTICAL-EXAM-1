class QuotesModal
{
  QuotesModal.f();
  late List<Quotes> quotes = [];

  QuotesModal({required this.quotes});

  factory QuotesModal.fromJson(Map json)
  {
    return QuotesModal(quotes: (json['quotes'] as List).map((e)=> Quotes.fromJson(e)).toList());
  }
}

class Quotes
{
  late int id;
  late String quote;
  late String author;

  Quotes({
    required this.id,
    required this.quote,
    required this.author,});

  factory Quotes.fromJson(Map json) {
    return Quotes(id: json['id'], quote: json['quote'], author: json['author']);
  }


}