class Deal{
  int? id;
  String? title;
  String? discription;
  Deal({this.id, this.title, this.discription});
}

List<Deal> deals = [
  Deal(
    id: 1,
    title: "Сходить в техникум",
    discription: "Сделать flutter, курсовую!!!",
  ),
  Deal(
    id: 2,
    title: "Начачать api маркетплейсов",
    discription: "ZZAP",
  ),
    Deal(
    id: 2,
    title: "Сдать на права",
    discription: "Обязательно",
  )
];