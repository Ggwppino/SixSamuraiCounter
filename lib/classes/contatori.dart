class Contatori {
  String _name;
  int _counter;
  int _add;
  bool _defaultGateway;

  counterSub() {
    if (this._counter != 0) _counter--;
  }

  counterAdd() {
    _counter += _add;
  }

  int compareTo(Contatori other) {
    if (this._defaultGateway)
      return -1;
    else if (other._defaultGateway)
      return 1;
    else if(this.add >= other.add) return -1;
    else return 1;
  }

  Contatori(name, counter, add, defaultGateway) {
    this._name = name;
    this._counter = counter;
    this._add = add;
    this._defaultGateway = defaultGateway;
  }

  String get name => _name;

  bool get defaultGateway => _defaultGateway;

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
  int get hashCode => _name.hashCode ^ _counter.hashCode ^ _add.hashCode;
}
