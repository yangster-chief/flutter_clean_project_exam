///
/// flutter_project_exam
/// File Name: usecase
/// Created by sujangmac
///
/// Description:
///
abstract class UseCase<Type, Params> {
  Future<void> call(
    Params params, {
    required ResultSuccessCallback<Type> onSuccess,
    required ResultErrorCallback onError,
  });
}

typedef ResultSuccessCallback<T> = void Function(T data);
typedef ResultErrorCallback = void Function(Exception error);
