abstract class Repository {
  Future<int> getSquare(int number);
  Stream<int> getCountStream(int initialValue);
}

class RepositoryImplementation implements Repository {
  @override
  Future<int> getSquare(int number) async {
    await Future.delayed(const Duration(seconds: 1));
    return number * number;
  }

  @override
  Stream<int> getCountStream(int initialValue) async* {
    for (int i = initialValue; i <= initialValue + 10; i++) {
      yield i;
      await Future.delayed(const Duration(seconds: 1));
    }
  }
}
