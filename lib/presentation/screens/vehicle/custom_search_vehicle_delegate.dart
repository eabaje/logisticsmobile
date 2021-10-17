import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logisticsmobile/presentation/bloc/theme/theme_cubit.dart';
import 'package:logisticsmobile/presentation/bloc/vehicle/vehicle_cubit.dart';
import '../../../common/constants/size_constants.dart';
import '../../../common/constants/translation_constants.dart';
import '../../../common/extensions/size_extensions.dart';
import '../../../common/extensions/string_extensions.dart';

import '../../themes/theme_color.dart';
import '../../widgets/app_error_widget.dart';
import 'search_vehicle_card.dart';

class CustomSearchVehicleDelegate extends SearchDelegate {
  final VehicleCubit vehicleCubit;

  CustomSearchVehicleDelegate(this.vehicleCubit);

  @override
  ThemeData appBarTheme(BuildContext context) => Theme.of(context);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
          color: query.isEmpty ? Colors.grey : Theme.of(context).accentColor,
        ),
        onPressed: query.isEmpty ? null : () => query = '',
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return GestureDetector(
      onTap: () {
        close(context, null);
      },
      child: Icon(
        Icons.arrow_back_ios,
        color: context.read<ThemeCubit>().state == Themes.dark
            ? Colors.white
            : AppColor.vulcan,
        size: Sizes.dimen_12.h,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    vehicleCubit.getAllVehiclesByVehicleType(query);

    return BlocBuilder<VehicleCubit, VehicleState>(
      bloc: vehicleCubit,
      builder: (context, state) {
        if (state is VehicleError) {
          return AppErrorWidget(
            errorType: state.errorType,
            onPressed: () => vehicleCubit.getAllVehiclesByVehicleType(query),
          );
        } else if (state is SuccessLoadAllVehicleState) {
          final listvehicles = state.listVehicles;
          if (listvehicles.isEmpty) {
            return Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_64.w),
                child: Text(
                  TranslationConstants.noMoviesSearched.t(context),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          return ListView.builder(
            itemBuilder: (context, index) => SearchVehicleCard(
              vehicle: listvehicles[index],
            ),
            itemCount: listvehicles.length,
            scrollDirection: Axis.vertical,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SizedBox.shrink();
  }
}
