import 'package:empolyee_management/local_db_models/employees_local_db_model.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';

class EmployeeManagementService {
  Employee employee = Employee();
  void getEmployees() {
    try {
      Future<List<Employee>> result = employee.select().toList();
    } catch (e) {
      Exception(e);
    }
  }

  void addEmployee(Employee employeeData) {
    try {
      Future<int?> result = employeeData.save();
    } catch (e) {
      Exception(e);
    }
  }

  void deleteEmployee(Employee employeeData) {
    try {
      Future<BoolResult> result = employeeData.delete();
    } catch (e) {
      Exception(e);
    }
  }

  void updateEmployee(Employee employeeData) {
    try {
      Future<int?> result = employeeData.upsert();
    } catch (e) {
      Exception(e);
    }
  }
}
