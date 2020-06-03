# StarRating-Dart

```Dart
WFStarRating({
  @required this.rating,//分数
  this.maxRating = 10,//满分
  this.count = 5,//星星总数
  this.size = 30,//星星大小
  this.textSize = 25,//文字大小
  this.unselectedColor = const Color(0xffbbbbbb),//未选中的颜色
  this.selectedColor = const Color(0xffe0aa46),//选中的颜色
  this.textColor = const Color(0xffbbbbbb),//文字颜色
  Widget unselectedImage,//未选中图片
  Widget selectedImage,//选中的图片
}): unselectedImage = unselectedImage ?? Icon(Icons.star, size: size, color: unselectedColor,),
    selectedImage = selectedImage ?? Icon(Icons.star, size: size, color: selectedColor,);
```
