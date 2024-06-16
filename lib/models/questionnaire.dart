class QuestionList{
  const QuestionList(this.text,this.options);
  final String text;
  final List<String> options;

  List<String>getShuffled(){
    final shuffledList=List.of(options);
    shuffledList.shuffle();
    return shuffledList;
  }
}