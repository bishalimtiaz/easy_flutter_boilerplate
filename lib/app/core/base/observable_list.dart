import 'package:easy_flutter_boilerplate/app/core/base/notifier.dart';
import 'package:collection/collection.dart';

/// Class representing an observable list that notifies listeners about changes.
interface class ObservableList<T extends Object?> extends Notifier<List<T>> {
  final _equality = IterableEquality<T>();

  ObservableList._(this._value);

  factory ObservableList.filled(int length, T fill, {bool growable = false}) {
    return ObservableList<T>._(
      List<T>.filled(length, fill, growable: growable),
    );
  }

  factory ObservableList.empty({bool growable = false}) {
    return ObservableList<T>._(List<T>.empty(growable: growable));
  }

  factory ObservableList.from(Iterable<T> elements, {bool growable = true}) {
    return ObservableList<T>._(List<T>.from(elements, growable: growable));
  }

  factory ObservableList.of(Iterable<T> elements, {bool growable = true}) {
    return ObservableList<T>._(List<T>.of(elements, growable: growable));
  }

  factory ObservableList.generate(
    int length,
    T Function(int index) generator, {
    bool growable = true,
  }) {
    return ObservableList<T>._(
      List<T>.generate(
        length,
        generator,
        growable: growable,
      ),
    );
  }

  factory ObservableList.unmodifiable(Iterable<T> elements) {
    return ObservableList<T>._(List<T>.unmodifiable(elements));
  }

  /// The internal list that stores the data.
  List<T> _value;

  @override
  List<T> get value => List<T>.unmodifiable(_value);

  set value(List<T> newValue) {
    if (!_equality.equals(_value, newValue)) {
      _value = List<T>.from(newValue);
      notifyListeners();
    }
  }

  /// Adds an item to the list and notifies listeners.
  void add(T item) {
    _value.add(item);
    notifyListeners();
  }

  /// Adds a list of items to the end of the list and notifies listeners.
  void addAll(Iterable<T> items) {
    _value.addAll(items);
    notifyListeners();
  }

  ///Removes the first occurrence of an item from the list
  ///and notifies listeners.
  /// Returns true if the item was found and removed, false otherwise.
  bool remove(T item) {
    final result = _value.remove(item);
    if (result) {
      notifyListeners();
    }
    return result;
  }

  /// Removes the item at the specified index from the list and notifies
  /// listeners.
  /// Throws a RangeError if the index is out of bounds.
  T removeAt(int index) {
    _validateIndex(index);
    final item = _value.removeAt(index);
    notifyListeners();
    return item;
  }

  /// Clears the list of all items and notifies listeners.
  void clear() {
    _value.clear();
    notifyListeners();
  }

  /// Replaces the item at the specified index with a new item and notifies
  /// listeners.
  /// Throws a RangeError if the index is out of bounds.
  void replaceAt(int index, T newItem) {
    _validateIndex(index);
    _value[index] = newItem;
    notifyListeners();
  }

  /// Updates a member of the item object at the specified index.
  /// Throws a RangeError if the index is out of bounds.
  void updateAt(int index, void Function(T?) updateFn) {
    _validateIndex(index);
    updateFn(_value[index]);
    notifyListeners();
  }

  /// Performs a batch of updates on the list and notifies listeners once at
  /// the end.
  void batchUpdate(void Function(List<T>) updates) {
    updates(_value);
    notifyListeners();
  }

  void _validateIndex(int index) {
    if (index < 0 || index >= _value.length) {
      throw RangeError('Index ($index) out of bounds!');
    }
  }

  /// Compares this list with another object for equality.
  /// Returns true if the other object is also an ObservableList with the same
  /// elements in the same order.
  /// enable accurate comparison of ObservableList instances, ensuring they are
  /// considered equal only
  /// when they contain the same elements in the same order, regardless of their
  /// memory address. Deep Comparison.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ObservableList<T> && _equality.equals(_value, other._value);

  /// Calculates the hash code for this list based on the hash codes of its
  /// elements.
  @override
  int get hashCode => _equality.hash(_value);
}
