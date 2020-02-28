class Contatori {
  String _name;
  int _counter;
  int _add;

  counterSub() {
    _counter--;
  }

  counterAdd() {
    _counter += _add;
  }

  Contatori(name, counter, add) {
    this._name = name;
    this._counter = counter;
    this._add = add;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  int get counter => _counter;

  set counter(int value) {
    _counter = value;
  }

  int get add => _add;

  set add(int value) {
    _add = value;
  }


  @override
  String toString() {
    return 'Contatori{_name: $_name, _counter: $_counter, _add: $_add}';
  }


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Contatori &&
              runtimeType == other.runtimeType &&
              _name == other._name &&
              _counter == other._counter &&
              _add == other._add;

  @override
  int get hashCode =>
      _name.hashCode ^
      _counter.hashCode ^
      _add.hashCode;
}