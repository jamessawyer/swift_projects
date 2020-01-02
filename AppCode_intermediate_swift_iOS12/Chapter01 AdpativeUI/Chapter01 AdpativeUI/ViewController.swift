// Size Classes for Adaptive Layout
// 第一章 1-48页 使用IB完成响应式布局
// ViewController.swift
//  Chapter01 AdpativeUI
/// 如果使用XCode一开始使用的Target 是13.0 则需要做一下步骤
/// 1. 删除 Info.plist 文件中 "Application Scene Manifest"
/// 2. 在AppDelegate 中定义 var window: UIWindow?  避免黑屏, 并且删除Scene相关的代码
/// 3. 删除 SceneDelegate.swift 文件
///

/// 知识点
///  1
/// Content Hugging priority
/// 值越大，表明越想紧凑的在一起 比如ViewA 的content hugging priority 为 251， 而ViewB 的 content hugging priority 为 250
/// 如果它们所在的容器有剩余的空间，则都会被ViewB 占据， 因为ViewA更想紧凑一点
/// 相当于给值小的View 添加了一个 flexGrow: 1

/// 2
/// 可以设置font size 的 auto shrink 为 "Minimium Font Size" 这样在小的屏幕将使用更小的字号

/// 3 Size class 是水平和垂直方向尺寸的相对空间量
/// iOS有2种size class: regular & compact
/// regular: 表示大量的屏幕空间；compact: 表示较小的屏幕空间
/// 可以分为4种类型：(Landscape: 横屏， Portrait：竖屏)
/// Regular width-Regular height:     iPad Protrait & iPad Landscape (ipad 横屏竖屏水平和垂直方向都是 Regular)
/// Regular width-Compact height:   iPhone6/7/8 Plus Landscape （大尺寸的iphone横屏时， 水平是Regular，垂直是Compact）
/// Compact width-Regular height:   iPhone Portrait (所有的iphone竖屏的时候都是这种Size class)
/// Compact width-Compact height: iPhone5/6/7/8 Landscape （小屏的iphone横屏时 2个方向都是Compact
/// !! 左右：可以根据这些差异给不同尺寸的屏幕设置不同的属性，比如给iPad的标题添加更大尺寸的字体

/// 4 为不同Size class 创建不同布局的步骤（比如横屏时的布局和竖屏时的布局不一样）
///  4.1 选择不同类型的设备 比如 竖屏为 Compact width-Regular height 的iphone8
///  4.2 点击 "vary for Traits" 按钮 选择 Height | Width | Height & Width
///  4.3 选中所有的约束，选择Size Inspector, 点击installed旁边的 + 添加一种 variation
///  4.4 以竖屏iphone8为例，只选择了 Height, 此时会出现 "hR Installed", 将原先的 "Installed" 取消选中
///  4.5 点击 "Done Varying" 对当前操作保存
///  -----------------
///  4.6 选择一个横屏为Regular width 的手机（所有的iphone横屏都是Regular）
///  4.7 点击 "vary for Traits" 按钮 选择 Height
///  4.8 然后重新进行布局， 此时的布局则只对横屏模式Regular width 的手机有效
///  4.9 完成上面的操作后，点击 "Done Varying" 对当前操作保存
///  完成操作
///  -----------------
///  4.10 如果还想对不同的Size class设置的布局添加差异，则可以重复上面的步骤

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

