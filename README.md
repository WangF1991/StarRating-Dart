# StarRating-Dart

```Dart
WFStarRating({
  @required this.rating,
  this.maxRating = 10,
  this.count = 5,
  this.size = 30,
  this.unselectedColor = const Color(0xffbbbbbb),
  this.selectedColor = const Color(0xffe0aa46),
  Widget unselectedImage,
  Widget selectedImage,
}): unselectedImage = unselectedImage ?? Icon(Icons.star, size: size, color: unselectedColor,),
    selectedImage = selectedImage ?? Icon(Icons.star, size: size, color: selectedColor,);
```
