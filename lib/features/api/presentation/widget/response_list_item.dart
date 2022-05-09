import 'package:flutter/material.dart';
import 'package:theme_notif_challange/core/service_locator.dart';
import 'package:theme_notif_challange/features/api/data/model/response_item.dart';
import 'package:theme_notif_challange/features/api/presentation/controller/api_controller.dart';

class ResponseListItem extends StatefulWidget {
  final ResponseItem city;

  const ResponseListItem({
    Key? key,
    required this.city,
  }) : super(key: key);

  @override
  State<ResponseListItem> createState() => _ResponseListItemState();
}

class _ResponseListItemState extends State<ResponseListItem> {
  final ApiController apiController = sl();
  bool isSelected = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSelected = widget.city.isSelected;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.green : null,
        borderRadius: isSelected ? BorderRadius.circular(12) : null
      ),
      child: ListTile(
        onTap: () {
          if (widget.city.isSelected) {
            apiController.unselectCity(widget.city.id);
            isSelected = false;
          } else {
            apiController.selectCity(widget.city.id);
            isSelected = true;
          }
          setState(() {});
        },
        leading: Text(widget.city.id),
        title: Text(widget.city.name),
        subtitle: Text(widget.city.province_id),
        trailing: isSelected ? const Icon(Icons.check) : null,
      ),
    );
  }
}
