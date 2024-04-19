# fluttermvvmexample

## 插件描述

该插件是一个用于在VS Code中开发Flutter MVVM模式的示例插件。

    提示：仅用于基于view_model_provider 框架构建模版项目使用

#### view_model_provider

基于Provider实现MVVM框架，常用的方式是 ViewModel 继承 ChangeNotifier ，再通过 ChangeNotifierProvider 提供给子Widget，ViewModel数据刷新通过调用 notifyListeners() 来通知Widget进行刷新，Widget 通过 Provider.of 、Consumer、Selector 来监听数据变化重新 build 更新UI。这种方式存在的问题有：

* ViewModel数据刷新需要每次调用 notifyListeners()容易被遗漏
* notifyListeners()作用在整个ViewModel，不方便进行局部UI刷新控制
* Selector 虽然可以控制局部刷新，但需要需要自定义 shouldRebuild 要去了解Provider原理
* 缺少 ViewModel 和 Widget 生命周期的管理

ViewModelProvider 在兼容现有功能基础刷，实现最小改动、不需要每次调用notifyListeners()、支持局部刷新UI和生命周期管理的框架

#### 它提供了以下功能：

- 在指定目录下创建文件和文件夹结构
- 替换模板文件中的占位符

## 安装

1. 在VS Code中打开扩展面板（`Ctrl+Shift+X`）
2. 搜索并找到 "fluttermvvmexample" 插件
3. 点击安装按钮

## 使用

1. 安装

<img width="473" alt="1" src="https://github.com/BMWB/fluttermvvmexample/assets/17972497/5ef96453-4beb-4dc3-a8b0-308ccd0a2449">


2. 打开目标项目的工作区

<img width="1040" alt="2" src="https://github.com/BMWB/fluttermvvmexample/assets/17972497/ffd07a8c-21e0-41dd-856b-28e3dc13ff73">


2. 选择模版

<img width="1034" alt="3" src="https://github.com/BMWB/fluttermvvmexample/assets/17972497/e225cce3-01cc-439d-b1bf-f25e9c5b56b6">


3. 输入类名并按回车键
<img width="1164" alt="4" src="https://github.com/BMWB/fluttermvvmexample/assets/17972497/7e2ffe4f-9a5a-474d-ba30-511eed0efebd">


4. 插件将会在指定目录下创建文件和文件夹结构，并替换模板文件中的占位符

<img width="480" alt="5" src="https://github.com/BMWB/fluttermvvmexample/assets/17972497/2260b3f4-9770-4378-8aa0-766eb6b8ab57">
