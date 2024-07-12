// ignore: unused_import
import 'package:campmart/core/failure/failure.dart';
import 'package:campmart/features/auth/domain/entity/auth_entity.dart';
import 'package:campmart/features/auth/domain/usecases/auth_usecase.dart';
import 'package:campmart/features/auth/presentation/navigator/login_navigator.dart';

import 'package:campmart/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<AuthUseCase>(),
  MockSpec<LoginViewNavigator>(),
  // MockSpec<RegisterViewNavigator>(),
])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late AuthUseCase mockAuthUsecase;
  late LoginViewNavigator mockLoginNavigator;
  // late RegisterViewNavigator mockRegisterNavigator;

  late ProviderContainer container;

  setUp(() {
    mockAuthUsecase = MockAuthUseCase();
    mockLoginNavigator = MockLoginViewNavigator();
    //mockRegisterNavigator = MockRegisterViewNavigator();
    container = ProviderContainer(overrides: [
      authViewModelProvider.overrideWith(
          (ref) => AuthViewModel(mockLoginNavigator, mockAuthUsecase))
    ]);
  });

  test('check for the inital state in Auth state', () {
    final authState = container.read(authViewModelProvider);
    expect(authState.isLoading, false);
    expect(authState.error, isNull);
  });

  group("Login tests", () {
    test('login test with valid username and password', () async {
      // Arrange
      const correctUsername = 'aayushman';
      const correctPassword = 'aayushman123';

      when(mockAuthUsecase.loginStudent(any, any)).thenAnswer((invocation) {
        final username = invocation.positionalArguments[0] as String;
        final password = invocation.positionalArguments[1] as String;
        return Future.value(
            username == correctUsername && password == correctPassword
                ? const Right(true)
                : Left(Failure(error: 'Invalid Credentails')));
      });
      // Act
      await container
          .read(authViewModelProvider.notifier)
          .loginStudent('aayushman', 'aayushman123');
      final authState = container.read(authViewModelProvider);
      // Assert
      expect(authState.error, isNull);
    });
    