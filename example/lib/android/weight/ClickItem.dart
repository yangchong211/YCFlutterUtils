


import 'package:flutter/material.dart';
import 'package:yc_flutter_utils_example/android/res/TextStyles.dart';
import 'package:yc_flutter_utils_example/android/res/YcColors.dart';


/*
 * <pre>
 *     @author yangchong
 *     blog  : https://github.com/yangchong211
 *     time  : 2019/6/14
 *     desc  : 自定义view
 *     revise:
 * </pre>
 */
class ClickItem extends StatefulWidget {

  ///注意，必须传递title，还有icon（右边的）
  const ClickItem({
    Key key,
    this.onTap,
    @required this.title,
    this.content: "",
    this.textAlign: TextAlign.start,
    this.style: TextStyles.textGray14,
    this.maxLines: 1,
    @required this.icon,
  }): super(key: key);

  final GestureTapCallback onTap;
  final String title;
  final String content;
  final TextAlign textAlign;
  final TextStyle style;
  final int maxLines;
  final Widget icon;

  @override
  _ClickItemState createState() => _ClickItemState();
}

class _ClickItemState extends State<ClickItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 0.0),
        padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
        constraints: BoxConstraints(
            maxHeight: double.infinity,
            minHeight: 50.0
        ),
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border(
              bottom: Divider.createBorderSide(context, color: YcColors.line, width: 0.6),
            )
        ),
        child: Row(
          //为了数字类文字居中
          crossAxisAlignment: widget.maxLines == 1 ?
          CrossAxisAlignment.center : CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.title,
              style: TextStyles.textDark14,
            ),
            Spacer(),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 16.0),
                child: Text(
                  widget.content,
                  maxLines: widget.maxLines,
                  textAlign: widget.maxLines == 1 ? TextAlign.right : widget.textAlign,
                  overflow: TextOverflow.ellipsis,
                  style: widget.style ?? TextStyles.textDark14,
                ),
              ),
            ),
            Opacity(
              // 无点击事件时，隐藏箭头图标
              opacity: widget.onTap == null ? 0 : 1,
              child: Padding(
                padding: EdgeInsets.only(top: widget.maxLines == 1 ? 0.0 : 2.0),
                child: widget.icon,
              ),
            )
          ],
        ),
      ),
    );
  }
}

