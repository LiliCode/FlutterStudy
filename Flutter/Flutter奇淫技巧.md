# 奇淫技巧

## 获取手势点击的坐标

使用 `GestureDetector` 手指组件包裹，实现 `onTapDown` 回调函数就可以获得点击的坐标。

```dart
GestureDetector(
  onTapDown: (details){
    final tapPosition = details.globalPosition;
    final x = tapPosition.dx;
    final y = tapPosition.dy;
    // do something with x & y
  },
  child: Scaffold(/* ...*/)
)
```