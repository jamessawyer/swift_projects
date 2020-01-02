//  ViewController.swift
//  Chapter01 AdpativeUI
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

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

