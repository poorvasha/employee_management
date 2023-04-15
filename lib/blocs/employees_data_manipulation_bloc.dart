import 'package:empolyee_management/local_db_models/employees_local_db_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class EmployeeDataManipulation {}

class CounterIncrementPressed extends EmployeeDataManipulation {}

class CounterDecrementPressed extends EmployeeDataManipulation {}

class EmployeeDataManipulationBloc
    extends Bloc<EmployeeDataManipulation, Employee> {
  EmployeeDataManipulationBloc() : super(Employee()) {
    on<CounterIncrementPressed>((event, emit) => {emit(state)});
    on<CounterDecrementPressed>((event, emit) => {emit(state)});
  }

  @override
  void onChange(Change<Employee> change) {
    super.onChange(change);
  }

  @override
  void onTransition(Transition<EmployeeDataManipulation, Employee> transition) {
    super.onTransition(transition);
  }
}
