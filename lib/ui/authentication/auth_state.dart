import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:new_digitendance/app/apis/dbapi.dart';
import 'package:new_digitendance/app/authapi.dart';
import 'package:new_digitendance/app/base_app_state.dart';
import 'package:new_digitendance/app/models/app_user.dart';
import 'package:new_digitendance/app/models/institution.dart';

import '../../app/contants.dart';
import '../authentication/auth_state.dart';

///[authApiProvider]] provides  the [AuthApi] to the system
final authApiProvider = Provider<AuthApi>(
  (ref) => AuthApi(
    FirebaseAuth.instance,
  ),
);

///[authStateNotifierProvider]] provides the [StateNotifier] of type [AuthState] .[AuthStateNotifier] uses [AuthApi] calls to
/// perform db Tasks
final authStateNotifierProvider =
    StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
  return AuthStateNotifier(AuthState, ref,);
});

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier(state, this.thisref, ) : super(AuthState());
  // final AppUser appUser;
  // User? user;
  // AuthApi? authApi;
  StateNotifierProviderRef<AuthStateNotifier, AuthState> thisref;

  // Future<void> login({
  //   required LoginProviderType loginProvider,
  //   required String email,
  //   required String password,
  // }) async {
  //   authApi = thisref.watch(authApiProvider);
  //   user = await authApi?.login(
  //     loginProvider: LoginProviderType.EmailPassword,
  //     email: email,
  //     password: password,
  //   );
  //   if (user != null) await setUserInAuthState(user);
  // }

  Future signUpWithEmailPassword(
      {required String email,
      required String password,
      required Institution institution,
      required LoginProviderType login_serviceProvider}) async {
    final dbApi = thisref.read(dbApiProvider);
    final AuthApi = thisref.read(authApiProvider);
    // final dbApi = thisref.read(dbApiProvider);
  // dbApi.

    throw UnimplementedError();

    ///TODO  implement function
  }

  // setUserInAuthState(User? user) async {
  //   //TODO transform to AppUser and set then set state
  //   final dbApi = thisref.watch(dbApiProvider);
  //   var data = await DbApi.getAppUserDoc(userId: user!.email, refBase: thisref);
  //   AppUser appUser = AppUser.fromJson(data.docs[0].data(), user.email);
  //   // appUser = AppUser.fromFirebaseUser(user!);
  //   // final authstate = thisref.watch(authStateProvider);
  //   // var newState = AuthState().initializeFrom(state);
  //   // newstate.
  //   AuthState newState = AuthState().cloneFrom(state);
  //   newState.authenticatedUser = appUser;
  //   // newState.authenticatedUser!.additionalAppUserInfo!.email = user.email;
  //   newState.hasAuthenticatedUser = true;
  //   newState.isBusy = false;
  //   newState.selectedRole = newState.authenticatedUser!.roles[0];
  //   // Utilities.log(''''
  //   //   AuthState equals
  //   //   ${state.toString()}
  //   //   ''');
  //   state = newState;
  //   Utils.log(''''
  //     AuthState has been updated . new state equals  
  //     ${newState.toString()}
  //     ''');
  // }
}

class AuthState extends AppStateBase with EquatableMixin {
   AppUser? authenticatedUser;
  UserRole? selectedRole;
  AuthState({
    this.authenticatedUser,
    this.selectedRole,
  });


  @override
  // TODO: implement props
  List<Object?> get props => [];


  AuthState copyWith({
    AppUser? authenticatedUser,
    UserRole? selectedRole,
  }) {
    return AuthState(
      authenticatedUser: authenticatedUser ?? this.authenticatedUser,
      selectedRole: selectedRole ?? this.selectedRole,
    );
  }


  

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(authenticatedUser != null){
      result.addAll({'authenticatedUser': authenticatedUser!.toMap()});
    }
    if(selectedRole != null){
      result.addAll({'selectedRole': selectedRole!.toMap()});
    }
  
    return result;
  }

  factory AuthState.fromMap(Map<String, dynamic> map) {
    return AuthState(
      authenticatedUser: map['authenticatedUser'] != null ? AppUser.fromMap(map['authenticatedUser']) : null,
      selectedRole: map['selectedRole'] != null ? UserRole.fromMap(map['selectedRole']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthState.fromJson(String source) => AuthState.fromMap(json.decode(source));
}
