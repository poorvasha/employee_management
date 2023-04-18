import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sqfentity/sqfentity.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';

part 'employees_local_db_model.g.dart';

const SqfEntityTable employeesTable = SqfEntityTable(
    tableName: 'employees',
    primaryKeyName: 'id',
    primaryKeyType: PrimaryKeyType.integer_auto_incremental,
    useSoftDeleting: true,
    fields: [
      SqfEntityField('name', DbType.text),
      SqfEntityField('designation', DbType.text),
      SqfEntityField('fromPeriod', DbType.datetimeUtc),
      SqfEntityField('toPeriod', DbType.datetimeUtc)
    ]);

const seqIdentity = SqfEntitySequence(
  sequenceName: 'identity',
);

@SqfEntityBuilder(employeesModel)
const employeesModel = SqfEntityModel(
  modelName: 'employeesModel',
  databaseName: 'employeeManagement-db.db',
  password: null,
  sequences: [seqIdentity],
  databaseTables: [employeesTable],
);
