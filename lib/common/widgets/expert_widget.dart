import 'package:flutter/cupertino.dart';
import 'package:helpinghand/Utils/rating_mapper.dart';
import 'package:helpinghand/features/service/models/expert_list_model.dart';

import '../../core/app_style.dart';

class ExpertWidget extends StatelessWidget {
  final ExpertListModel expertListModel;
  const ExpertWidget({super.key,required this.expertListModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset("assets/profile.jpg",height: 50,width: 50,)),

        const SizedBox(width: 20,),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${expertListModel.firstname} ${expertListModel.lastname}"),
            Image.asset(RatingMapper(expertListModel.rating).assetPath,height: 40,width: 120,)
          ],
        ),
      ],
    );
  }
}
