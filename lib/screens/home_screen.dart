import 'package:empolyee_management/configs/resouces.dart';
import 'package:empolyee_management/local_db_models/employees_local_db_model.dart';
import 'package:empolyee_management/models/button_model.dart';
import 'package:empolyee_management/widgets/employee_not_found.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_detector/focus_detector.dart';

import '../blocs/employees_data_manipulation_bloc.dart';
import '../models/async_wrapper.dart';
import '../widgets/button.dart';
import '../widgets/employees_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    void onAddButtonPressed() {
      Navigator.pushNamed(context, '/EmployeeFormScreen');
    }

    onItemDelete(Employee element) {
      BlocProvider.of<EmployeeDataManipulationBloc>(context)
          .add(DeleteEmployee(element));
      BlocProvider.of<EmployeeDataManipulationBloc>(context)
          .add(GetEmployees());

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: const Text("Employee data has been deleted"),
            action: SnackBarAction(
                label: "Undo",
                onPressed: () {
                  BlocProvider.of<EmployeeDataManipulationBloc>(context)
                      .add(AddEmployee(element));
                  BlocProvider.of<EmployeeDataManipulationBloc>(context)
                      .add(GetEmployees());
                })),
      );
    }

    return FocusDetector(
      onFocusGained: () {
        BlocProvider.of<EmployeeDataManipulationBloc>(context)
            .add(GetEmployees());
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            title,
            style: AppTextStyles.mediumRoboto18,
          ),
        ),
        body: BlocBuilder<EmployeeDataManipulationBloc,
                AsyncWrapper<List<Employee>>>(
            builder: (context, state) => state.isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                      strokeWidth: 5,
                    ),
                  )
                : state.data!.length == 0
                    ? Container(
                        color: AppColors.extraLightgray,
                        child: const EmployeesNotFoundWidget())
                    : Column(
                        children: [
                          Expanded(
                              child: EmployeesListWidgets(
                                  employees: state.data!,
                                  onItemDelete: onItemDelete)),
                          Container(
                            height: 96,
                            width: double.infinity,
                            color: AppColors.extraLightgray,
                            padding: const EdgeInsets.only(top: 12, left: 16),
                            child: Text(
                              "Swipe left to delete",
                              style: AppTextStyles.regularRoboto15
                                  .copyWith(color: AppColors.gray),
                            ),
                          )
                        ],
                      )),
        floatingActionButton: ButtonWidget(
            buttonProps: ButtonDataModel(
                size: const Size(50, 50),
                buttonColor: AppColors.primaryColor,
                buttonTappedFunction: onAddButtonPressed,
                buttonType: ButtonType.iconButton,
                textColor: null,
                text: null,
                icon: AppIcons.add)),
      ),
    );
  }
}
