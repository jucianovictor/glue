part of glue_core;

class Pair<T1, T2> {
  final T1 first;
  final T2 second;

  const Pair(this.first, this.second);

  @override
  String toString() => '($first, $second)';
}
