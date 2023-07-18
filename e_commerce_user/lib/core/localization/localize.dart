import 'package:get/get.dart';

class MyTranslations extends Translations {
  Map<String, String> s = {'s': 's'};
  @override
  Map<String, Map<String, String>> get keys => {
        'ar': {
          'Choose Language': 'اختر اللغة',
          'letsgo': 'فلنبدء',
          'continue': 'أكمل',
          'onBoarding_title_1': 'اختر المنتج',
          'onBoarding_title_2': 'دفع سهل & سريع',
          'onBoarding_title_3': 'تتتبع طلبك',
          'onBoarding_title_4': 'توصيل سريع',
          'onBoarding_body_1':
              'لدينا اكتر من 100 ألف منتج .\n اختر منتجك من متجرنا',
          'onBoarding_body_2':
              'دفع سهل وطرق دفع آمنة.\n موثوقين من قبل عملائنا حول العالم',
          'onBoarding_body_3':
              'أفضل طرق لتتبع لمنتجك.\n ستتكمن من معرفة مكان منتجك',
          'onBoarding_body_4':
              'توصيل سريع .\n نحن نوصل منتجك بأسرع الطرق الممكنة',
          'login_title_0': 'تسجيل الدخول',
          'login_title_1': 'أهلاََ بعودتك',
          'login_body_0':
              'سجل الدخول بإستخدام بريدك اللإلكتروني وكلمة السر \n أو استمر بحسابك في مواقع التواصل اللإجتماعي',
          'email': 'البريد اللإلكتروني',
          'email_hint': 'أدخل بريدك اللإلكتروني',
          'email_valid_0': "من فضلك أدخل البريد اللإلكتروني",
          'email_valid_1': "من فضلك أدخل بريد إلكتروني صالح",
          'pass': 'كلمة السر',
          'pass_hint': 'أدخل كلمة السر',
          'pass_valid_0': "من فضلك أدخل كلمة السر",
          'pass_valid_1': "من فضلك أدخل كلمة سر صالحة",
          'remember': 'تذكرني',
          'forgot': 'نسيت كلمة المرور',
          'donthaveacc': 'ليس لديك حساب ؟',
          'signup': 'أنشأ حساب',
          'signup_title': 'مرحباََ',
          'user_valid_0': 'إسم المستخدم لا يجب أن يكون فارغ',
          'user_valid_1': 'إسم المستخدم لا يجب أن يكون أقصر من 4 أحرف',
          'user_label': 'إسم المستخدم',
          'user_hint': 'أدخل إسم المستخدم',
          'tele_label': 'رقم الهاتف',
          'tele_hint': 'أدخل رقم الهاتف',
          'tele_valid': 'رقم الهاتف غير صحيح',
          //
          'forgot_title': 'تغيير كلمة المرور',
          'send_code': 'أرسل الرمز',
          //
          'verify_appbar': 'رقم التحقق',
          'verify_title': 'أدخل رقم التحقق',
          'verify_code': 'تحقق',
          //
          'reset_appBar': 'إعادة تعيين كلمة المرور',
          'reset_title': 'أدخل كلمة سر جديدة',
          'reset_button': 'تأكيد',
          //
          're_pass_valid': 'كلمات المرور غير متشابهة',
          're_pass_hint': "أدخل كلمة السر مجدداََ",
          //
          'success': 'نجحت العملية',
          //
          'exit_alert_title': 'تنبيه',
          'exit_alert_body': 'هل تريد الخروج ؟',
          'yes': 'نعم',
          'no': 'لا',
          //
          'faliure': 'فشل',
          'alreadyExists': 'موجود مسبقاً',
          'wrongcode': 'رقم التحقق غير صحيح',
          //
          'verifyEmailSent': 'تم إرسال بريد التحقق',
          'checkYourEmail': 'تحقق من بريدك',
          'alert': 'تنبيه',
          'emailNotExists': 'البريد الإلكتروني غير موجود',
          'wrongPassword': 'كلمة السر غير صحيحة',
          'oldPassword': 'لا يجب إدخال كلمة سر مستخدمة من قبل',
          //
          'search_hint': 'أبحث عن منتج',
          'offer_tile': 'الكثير من العروض',
          'home_text_0': 'مقترحة لك',
          'cat_text': 'الأقسام',
          //
          'home_page': 'الصفحة الرئيسية',
          'favourite_page': 'المفضلة',
          'settings_page': 'الإعدادات',
          'orders_page': 'الطلبات',
          //
          'about': 'حولنا',
          'addresses': 'العناوين',
          'address': 'العنوان',
          'contact': 'تواصل معنا',
          'changelang': 'تغيير اللغة',
          'logout': 'تسحيل خروج',
          //
          'cart_title': 'سلة المشتريات',
          'coupon': 'كود الخصم',
          'price': 'السعر',
          'shipping': 'رسوم للتوصيل',
          'total': 'إجمالي السعر',
          'order': 'أكمل الطلب',
          //
          'add': 'أضف',
          'addaddress': 'أضف عنوان',
          'name': 'إسم العنوان',
          'phone': 'رقم الهاتف',
          'city': 'المدينة',
          'street': 'الشارع',
          'empty': 'لا يمكن أن يكون فارغ',
          'confirm': 'تأكيد',
          'editaddress': 'تعديل العنوان',
          'location_alert_1': 'الرجاء تفعيل خدمة تحديد الموقع',
          'location_alert_2': 'الرجاء السماح للتطبيق بالوصول لصلاحية الموقع',
          'location_alert_3': 'الخريطة لن تعمل بكفاءة',
          'address_not_allowed':
              'تعديل او ازالة هذا العنوان غير مسموح بها حالياً',
          //
          'checkout_title': 'الحساب',
          'paymentmethod': 'طريقة الدفع',
          'cash': 'نقداََ',
          'visa': 'بطاقة إئتمان',
          'chooseaddress': 'اختر العنوان',
          'add_address_alert': 'يجب عليك إضافة عنوان',
          //
          'goto_home': 'إذهب للصفجة الرئيسية',
          //
          'productname': 'إسم المنتج',
          'productcolor': 'لون المنتج',
          'productquantity': 'عدد المنتجات المطلوبة',
          'order.no': 'رقم الطلب',
          'order_status': 'حالة الطلب',
          'pending': 'قيد الإنتظار',
          'canceled': 'ملغى',
          'approved': 'تم القبول',
          'in prepration': 'قيد التحضير',
          'prepared': 'تم التحضير',
          'out for delivery': 'خرج للتوصيل',
          'cancel_order_alert': 'هل تريد تأكيد إلغاء هذا الطلب ؟',
          'show_item': 'عرض المنتج',
          'done': 'تم التسليم',
          //
          'notifications_title': 'الإشعارات',
          'details': 'التفاصيل',
          'default': 'الإفتراضي',
          'archive': 'أرشيف الطلبات',
          'indelivery': 'في التوصيل',
          'map': 'الخريطة',
          'tracking': 'التتبع',
        },
        'en': {
          'Choose Language': 'Choose Language',
          //////////////
          'letsgo': 'Let\'s Go',
          'continue': 'Continue',
          //
          'onBoarding_title_1': 'Choose Product',
          'onBoarding_title_2': 'Easy & Safe Payment',
          'onBoarding_title_3': 'Track Your Order',
          'onBoarding_title_4': 'Fast Delivery',
          //
          'onBoarding_body_1':
              'We Have a 100k+ Products Choose \nYour product from our\n E-commerce shop',
          'onBoarding_body_2':
              'Easy Checkout & Safe PaymentMethod.\n Trusted by our Customers\n from all over the world',
          'onBoarding_body_3':
              'Best Tracker has been Used For\n Track your order. You\'ll know where\n your product is at the moment',
          'onBoarding_body_4':
              'Reliable And Fast Delivery. We\n Deliver your product the fastest\n way possible',
          //////////////
          'login_title_0': 'Sign In',
          'login_title_1': 'Welcome Back',
          'login_body_0':
              'Sign In With Your Email And Password \n Or Continue With Your Social Media',
          'email': 'Email',
          'email_hint': "Enter Your Email",
          'email_valid_0': "Please Type The Email",
          'email_valid_1': "Please Type Valid Email",
          'pass': 'Password',
          'pass_hint': "Enter Your Password",
          'pass_valid_0': "Please Type The Password",
          'pass_valid_1': "Please Type Valid Password",
          'remember': 'Remember me',
          'forgot': 'Forgot Password',
          'donthaveacc': 'Don\'t Have An Account ?',
          'signup': 'Sign Up',
          'signup_title': 'Welcome',
          'user_valid_0': 'Username Shouldn\'t Be Empty',
          'user_valid_1': 'Username Shouldn\'t Be Shroter Than 4',
          'user_label': 'Username',
          'user_hint': 'Enter Your Username',
          'tele_label': 'Phone Number',
          'tele_hint': 'Enter Your Phone Number',
          'tele_valid': 'Phone Number Is Incorrect',
          //
          'forgot_title': 'Reset Your Password',
          'send_code': 'Send Code',
          //
          'verify_appbar': 'Verification Code',
          'verify_title': 'Enter Verification Code',
          'verify_code': 'Verify',
          //
          'reset_appBar': 'Reset Password',
          'reset_title': 'Enter New Password',
          'reset_button': 'Confirm',
          //
          're_pass_valid': 'Passwords Are Not The Same',
          're_pass_hint': "Enter Your Password Again",
          //
          'success': 'Success',
          //
          'exit_alert_title': 'Exit Alert',
          'exit_alert_body': 'Do You Want To Exit ?',
          'yes': 'Yes',
          'no': 'No',
          'faliure': 'Faliure',
          'alreadyExists': 'Already Exists',
          'wrongcode': 'Incorrect Verify Code',
          //
          'verifyEmailSent': 'Verify Email Sent',
          'checkYourEmail': 'Check Your Email',
          'alert': 'Alert',
          'emailNotExists': 'Email Doesn\'t Exists',
          'wrongPassword': 'Wrong Password',
          'oldPassword': 'You User This Password Before',
          //
          'search_hint': 'Found Product',
          'offer_tile': 'Many Offers',
          'home_text_0': 'Recommended For You',
          'cat_text': 'Categories',
          //
          'home_page': 'Home',
          'favourite_page': 'Favourites',
          'settings_page': 'Settings',
          'orders_page': 'Orders',
          //
          'about': 'About Us',
          'addresses': 'Addresses',
          'address': 'Address',

          'contact': 'Contact Us',
          'changelang': 'Change Language',
          'logout': 'Logout',
          //
          'cart_title': 'My Cart',
          'coupon': 'Coupon',
          'price': 'Price',
          'shipping': 'Shipping',
          'total': 'Total Price',
          'order': 'Place Order',
          //
          'add': 'Add',
          'addaddress': 'Add Address',
          'name': 'Address Name',
          'phone': 'Phone Number',
          'city': 'City',
          'street': 'Street',
          'empty': 'Can\'t Be Empty',
          'confirm': 'Confirm',
          'editaddress': 'Edit Address',
          'location_alert_1': 'Please Enable Location Permission',
          'location_alert_2': 'Please Give Location Permission To App',
          'location_alert_3': 'Map Can\'t Work Correctly',
          'address_not_allowed':
              'You Are Not Allowed To Edit This Address Right Now',
          //
          'checkout_title': 'Checkout',
          'paymentmethod': 'Payment Method',
          'cash': 'Cash',
          'visa': 'Visa',
          'chooseaddress': 'Choose Address',
          'add_address_alert': 'You Should Add Address',
          //
          'goto_home': 'Go To Home',
          //
          'productname': 'Product Name',
          'productcolor': 'Product Color',
          'productquantity': 'Product Quantity',
          'order.no': 'Order Number',
          'order_status': 'Order Status',
          'pending': 'Pending',
          'canceled': 'Canceled',
          'out for delivery': 'Out For Delivery',
          'approved': 'Approved',
          'in prepration': 'In Prepration',
          'prepared': 'Prepared',
          'cancel_order_alert': 'Do You Want To Confirm Canceling This Order ?',
          'show_item': 'Show Item',
          'done': 'Delivered',
          //
          'notifications_title': 'Notifications',
          'details': 'Details',
          'default': 'Default',
          'archive': 'Orders Archive',
          'indelivery': 'In Delivery',
          'map': 'Map',
          'tracking': 'Tracking',
        },
      };
}
