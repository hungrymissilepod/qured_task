import 'package:flutter_app_template/ui/views/home/home_view.dart';
import 'package:flutter_app_template/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter_app_template/services/dio_service.dart';
import 'package:flutter_app_template/services/post_service.dart';
import 'package:flutter_app_template/services/user_service.dart';
import 'package:flutter_app_template/services/post_detail_service.dart';
import 'package:flutter_app_template/ui/views/post_detail/post_detail_view.dart';
import 'package:flutter_app_template/services/comment_service.dart';
import 'package:flutter_app_template/services/image_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: PostDetailView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DioService),
    LazySingleton(classType: PostService),
    LazySingleton(classType: UserService),
    LazySingleton(classType: PostDetailService),
    LazySingleton(classType: CommentService),
    LazySingleton(classType: ImageService),
// @stacked-service
  ],
  logger: StackedLogger(),
)
class App {}
