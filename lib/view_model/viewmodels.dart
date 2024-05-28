import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/route_manager.dart';
import 'package:test_muslimin/view/views.dart';
import '../model/transaction_model.dart';
import 'package:http/http.dart' as http;

part 'riverpod/transaction_riverpod.dart';
part 'services/transaction_service.dart';
part 'services/base_service.dart';
