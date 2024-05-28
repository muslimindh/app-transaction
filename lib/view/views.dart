import 'dart:async';
import 'dart:convert';
import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import '../model/transaction_model.dart';
import '../view_model/viewmodels.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;

part 'styles/color.dart';
part 'styles/font.dart';
part 'styles/mixin_ui.dart';
part 'styles/utility.dart';

part 'pages/splash_page.dart';
part 'pages/onboarding/onboard_page.dart';
part 'pages/onboarding/slide_page.dart';
part 'pages/home/home_page.dart';
part 'pages/home/add_transaction_page.dart';
part 'pages/home/detail_transaction_page.dart';
part 'pages/home/consumer/add_trans_consumer.dart';
part 'pages/home/consumer/list_trans_consumer.dart';
part 'pages/home/consumer/button_add_trans_consumer.dart';

part 'widgets/custom_button.dart';
part 'widgets/custom_form_field.dart';
part 'widgets/custom_dropdown.dart';
part 'widgets/shimmering.dart';
part 'widgets/skelton.dart';
