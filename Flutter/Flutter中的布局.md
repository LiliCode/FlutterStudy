# Flutter 中的布局

要点：

- `Widgets` 是用于构建 UI 的类
- `Widgets` 可以用于布局和展示 UI 元素
- 通过组合简单的　Widgets　来构建复杂的　Widgets

Flutter 布局的核心机制是 Widgets。在 Flutter 中，几乎所有东西都是 Widget，甚至布局模型都是 Widgets。在　Flutter　中看到的图像，图标和文本都是　Widgets。此外不能直接看到的也是　Widgets，例如排列，限制和对齐可见的　Widgets　的行、列和网络。

## 创建一个可见的 Widget

创建一个文本 Widget

```dart
Text('Hello world'),
```

创建一个图片 Widget

```dart
Image.asset('image/lake.jpg', fit: BoxFit.cover),
```

## 将可见的 Widget 添加到布局 Widget

所有的布局 WIdget 都具有以下任意一项：

- 一个 `child` 属性，他们值包含一个子项，例如 Center、Container
- 一个 `children` 属性，如果他们包含多个子项，例如 Row、Colunm、ListView、Stack

将 Text Widget 添加进 Center Widget

```dart
const Center(
  child: Text('Hello World'),
),
```

## 将布局 widget 添加到页面

一个 Flutter app 本身就是一个 Widget，大多数 widgets 都有一个 `build()` 方法，在 app 的 `build()` 方法中实例化和返回一个 widget 会让它显示出来。

对于 Material app，你可以使用 `Scaffold` widget，它提供默认的 banner 背景颜色，还有用于添加抽屉、提示条和底部列表弹窗的 API。你可以将 Center widget 直接添加到主页 body 的属性中。

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
```

> 注意：默认情况下，非 Material app 不包含 AppBar、标题和背景颜色。如果你希望在非 Material app 中使用这些功能，则必须自己构建它们。

## 横向和纵向布局多个 Widgets

最常见的布局模式之一是垂直或水平 widgets。你可以使用 `Row` widget 水平排列 widgets，使用 `Column` widget 垂直排列 widgets。

要点：

- Row 和 Column 是两种最常用的布局模式。
- Row 和 Column 每个都有一个子 widgets 列表（children 数组）。
- 可以指定 Row 或 Column 如何在垂直和水平方向上对齐其子项。
- 可以拉伸或限制特定的子 widgets。
- 可以指定子 widgets 如何占用 Row 或 Column 的可用空间。

要在 Flutter 中创建行或列，可以将子 widgets 列表添加到 Row 或 Column widget 中。反过来，每个子项本身可以是一行或一列，依此类推。

## 对齐 Widgets

你可以使用 `mainAxisAlignment` 和 `crossAxisAlignment` 属性控制行或者列如何对齐子项。

