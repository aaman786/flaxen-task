import 'package:auth_flaxen/model/user_model.dart';
import 'package:auth_flaxen/services/repository/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final alluserDataProvider = StreamProvider((ref) {
  final userController = ref.watch(userControllerProvider.notifier);
  return userController.getAllUserData();
});

final userControllerProvider =
    StateNotifierProvider<UserController, bool>((ref) {
  final userRepository = ref.watch(userRepositoryProvider);
  return UserController(userRepository: userRepository, ref: ref);
});

class UserController extends StateNotifier<bool> {
  final UserRepository _userRepository;
  final Ref _ref;

  UserController({required UserRepository userRepository, required Ref ref})
      : _userRepository = userRepository,
        _ref = ref,
        super(false);

  Stream<List<UserModel>> getAllUserData() {
    return _userRepository.getAllUserData();
  }
}
