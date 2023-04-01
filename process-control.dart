
void main(List<String> args) {

  var list = [1, 2, 3, 4, 5];
  for(int i = 0; i < list.length; i++) {
    print(list[i]);
  }

  var callbacks = [];

  for (int i = 0; i < 2; i++) {
    callbacks.add(() => print(i));
  }

  for (var func in callbacks) {
    func();
  }

  callbacks.forEach((element) {
    element();
  });


  var command = 'OPEN';
  switch(command) {
    case 'OPEN':
    print('打开');
    break;

    case 'CLOSE': 
    print('关闭');
    break;

    default:
      print('默认情况');
  }

}