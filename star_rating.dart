import 'package:flutter/material.dart';

class WFStarRating extends StatefulWidget {

  final double rating;//分数
  final double maxRating;//满分
  final int count;//星星总数
  final double size;//星星大小
  final Widget unselectedImage;//未选中图片
  final Widget selectedImage;//选中的图片
  final Color unselectedColor;//未选中的颜色
  final Color selectedColor;//选中的颜色
  final Color textColor;//文字颜色
  final double textSize;//文字大小

  WFStarRating({
    @required this.rating,
    this.maxRating = 10,
    this.count = 5,
    this.size = 30,
    this.textSize = 25,
    this.unselectedColor = const Color(0xffbbbbbb),
    this.selectedColor = const Color(0xffe0aa46),
    this.textColor = const Color(0xffbbbbbb),
    Widget unselectedImage,
    Widget selectedImage,
  }): assert(rating != null),
        unselectedImage = unselectedImage ?? Icon(Icons.star, size: size, color: unselectedColor,),
      selectedImage = selectedImage ?? Icon(Icons.star, size: size, color: selectedColor,);

  @override
  _WFStarRatingState createState() => _WFStarRatingState();
}

class _WFStarRatingState extends State<WFStarRating> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        getStack(),
        SizedBox(width: 5,),
        Text("${widget.rating}", style: TextStyle(fontSize: widget.textSize, color: widget.textColor),)
      ],
    );
  }

  Widget getStack(){
    return Container(
      child: Stack(
        children: <Widget>[
          Row(children: getUnSelectImage(), mainAxisSize: MainAxisSize.min,),
          Row(children: getSelectImage(), mainAxisSize: MainAxisSize.min,),
        ],
      ),
    );
  }

  List<Widget> getUnSelectImage(){
    return List.generate(widget.count, (index) => widget.unselectedImage);
  }

  List<Widget> getSelectImage(){
    //1.计算完整的星星的个数
    double oneVlaue = widget.maxRating / widget.count;
    int entireCount = (widget.rating / oneVlaue).floor();

    //2.计算剩余不完整的星星占整个星星的范围
    double leftValue = widget.rating - entireCount * oneVlaue;
    double lettRatio = leftValue / oneVlaue;

    List<Widget> selectedImages = [];//装选中的星星。

    //3.添加完整的星星到selectedImage数组中。
    for (int i = 0; i < entireCount; i++) {
      selectedImages.add(widget.selectedImage);
    }

    //4.将不完整的星星添加到selectedImage数组中。
    //对整个星星进行裁剪
    Widget leftStar = ClipRect(
      clipper: WFRctClipper(width: lettRatio * widget.size),
      child: widget.selectedImage,
    );
    selectedImages.add(leftStar);

    return selectedImages;
  }
}

class WFRctClipper extends CustomClipper<Rect> {
  final double width;

  WFRctClipper({
    this.width
  });

  @override
  Rect getClip(Size size) {
    // TODO: implement getClip
    return Rect.fromLTRB(0, 0, width, size.width);
  }

  @override
  bool shouldReclip(WFRctClipper oldClipper) {
    // TODO: implement shouldReclip
    return width != oldClipper.width;
  }
}