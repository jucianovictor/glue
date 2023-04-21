import 'package:glue_core/glue_core.dart';
import 'package:test/test.dart';

import '../../../../../util/mock/generic/datasource_mock.dart';
import '../../../../../util/mock/generic/entity_mock.dart';
import '../../../../../util/mock/generic/repository_mock.dart';

void main() {
  late Repository repository;
  late PersistenceRepositoryImplementationError error;

  setUpAll(() {
    repository = RepositoryMock(DatasourceMock());
    error = PersistenceRepositoryImplementationError<EntityMock>(
        repository: repository,
        domain: EntityMock(id: IntID(1)),
        detail: 'Example detail.');
  });
  test('should return the correct detail.', () {
    expect(error.detail, 'Example detail.');
  });

  test('should return the correct message', () {
    expect(error.message,
        'EntityMock: {id: IntID{id: 1}, createdAt: null, updateAt: null} persistence failed on RepositoryMock.');
  });

  test('should return the correct toString()', () {
    expect(error.toString(),
        'PersistenceRepositoryImplementationError<EntityMock>: EntityMock: {id: IntID{id: 1}, createdAt: null, updateAt: null} persistence failed on RepositoryMock. Example detail.');
  });

  test('should throw the correct error', () {
    expect(() => throw error,
        throwsA(isA<PersistenceRepositoryImplementationError<EntityMock>>()));
  });
}
