import 'package:empolyee_management/local_db_models/employees_local_db_model.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';

class EmployeeManagementService {
  static Employee employee = Employee();
  static Future<List<Employee>> getEmployees() async {
    try {
      List<Employee> result = await employee.select().toList();
      return result;
    } catch (e) {
      Log(msg: "Get employees got failed", error: e);
      return List.empty();
    }
  }

  static Future<void> addEmployee(Employee employeeData) async {
    try {
      await employeeData.save();
    } catch (e) {
      Log(msg: "Adding employees got failed", error: e);
    }
  }

  static Future<void> deleteEmployee(Employee employeeData) async {
    try {
      await employeeData.delete();
    } catch (e) {
      Log(msg: "Deleting employees got failed", error: e);
    }
  }
}
