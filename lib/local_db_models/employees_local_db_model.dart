import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sqfentity/sqfentity.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';
import 'package:http/http.dart';
part 'employees_local_db_model.g.dart';

const SqfEntityTable employeesTable = SqfEntityTable(
    tableName: 'employees',
    primaryKeyName: 'id',
    primaryKeyType: PrimaryKeyType.integer_auto_incremental,
    useSoftDeleting: true,
    fields: [
      SqfEntityField('name', DbType.text),
      SqfEntityField('designation', DbType.text),
      SqfEntityField('period', DbType.text)
    ]);

const seqIdentity = SqfEntitySequence(
  sequenceName: 'identity',
);

@SqfEntityBuilder(employeesModel)
const employeesModel = SqfEntityModel(
  modelName: 'employeesModel', // optional
  databaseName: 'employeeManagement-db.db',
  password: null,

  // put defined sequences into the sequences list.
  sequences: [seqIdentity],

  // put defined tables into the tables list.
  databaseTables: [employeesTable],
);
