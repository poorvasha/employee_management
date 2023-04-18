import 'package:empolyee_management/local_db_models/employees_local_db_model.dart';
import 'package:empolyee_management/models/async_wrapper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/employee_management_service.dart';

abstract class EmployeeDataManipulation {}

class GetEmployees extends EmployeeDataManipulation {
  List<Employee> employees = [];
  refreshEmployees() async {
    employees = await EmployeeManagementService.getEmployees();
  }
}

class AddEmployee extends EmployeeDataManipulation {
  final Employee employee;
  AddEmployee(this.employee);
}

class DeleteEmployee extends EmployeeDataManipulation {
  final Employee employee;
  DeleteEmployee(this.employee);
}

class EmployeeDataManipulationBloc
    extends Bloc<EmployeeDataManipulation, AsyncWrapper<List<Employee>>> {
  EmployeeDataManipulationBloc()
      : super(AsyncWrapper<List<Employee>>(true, [])) {
    on<AddEmployee>((event, emit) async {
      await EmployeeManagementService.addEmployee(event.employee);
    });

    on<GetEmployees>((event, emit) async {
      emit(AsyncWrapper<List<Employee>>(true, event.employees));
      await event.refreshEmployees();
      emit(AsyncWrapper<List<Employee>>(false, event.employees));
    });

    on<DeleteEmployee>((event, emit) async =>
        {await EmployeeManagementService.deleteEmployee(event.employee)});
  }
}
