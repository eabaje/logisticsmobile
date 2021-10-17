import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:logisticsmobile/data/models/vehicle.dart';
import 'package:logisticsmobile/presentation/screens/vehicle/vehicle_detail_arguments.dart';

import '../../../common/constants/route_constants.dart';
import '../../../common/constants/size_constants.dart';
import '../../../common/extensions/size_extensions.dart';
import '../../../data/core/api_constants.dart';
import '../../themes/theme_text.dart';


class SearchVehicleCard extends StatelessWidget {
  final Vehicle vehicle;

  const SearchVehicleCard({
    Key? key,
    required this.vehicle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          RouteList.vehicleDetail,
          arguments: VehicleDetailArguments(vehicle.vehicleId),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Sizes.dimen_16.w,
          vertical: Sizes.dimen_2.h,
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(Sizes.dimen_8.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Sizes.dimen_4.w),
                child: CachedNetworkImage(
                  imageUrl: '${ApiConstants.BASE_IMAGE_URL}${vehicle.picUrl}',
                  width: Sizes.dimen_80.w,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    vehicle.vehicleType,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                   Text(
                    vehicle.vehicleMake,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(
                    vehicle.vehicleNotes ?? '',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.greyCaption,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
