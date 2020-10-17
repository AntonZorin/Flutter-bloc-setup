abstract class Mapper<FROM, TO> {
  TO map(FROM from);

  List<TO> mapList(List<FROM> from) {
    List<TO> resultList = [];
    from.forEach((element) {
      resultList.add(map(element));
    });
    return resultList;
  }
}
