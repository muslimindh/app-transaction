import 'dart:async';
import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/transaction_model.dart';
import '../view_model/viewmodels.dart';

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

part 'widgets/custom_button.dart';
part 'widgets/custom_form_field.dart';
part 'widgets/custom_dropdown.dart';
