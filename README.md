**FNReactionsView** is a customizable control (based on UIView) to give people a way to show floating emoji like facebook does during live stream, easy way.

<p align="center">
<img src="https://cloud.githubusercontent.com/assets/812037/24315458/7206c284-10e7-11e7-8b9a-fba5102d88c9.gif" alt="FNReactionsView">
</p>

<p align="center">
    <a href="#requirements">Requirements</a> • <a href="#usage">Usage</a> • <a href="#installation">Installation</a> • <a href="#contribution">Contribution</a> • <a href="#contact">Contact</a> • <a href="#license-mit">License</a>
</p>

## Requirements

- iOS 8.0+
- Xcode 8.0+
- Swift 3.0+

## Usage

### Reaction

A `FNReactionsView` object is a simple view

```swift
override func viewDidLoad() {
    super.viewDidLoad()
    reactionsView = FNReactionsView()
    if let reactionsView = reactionsView{
        reactionsView.backgroundColor = .clear
        view.addSubview(reactionsView)
        
        reactionsView.snp.makeConstraints({ (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(300)
        })
    }
}
```
(thanks to [SnapKit](https://github.com/SnapKit/SnapKit) for easy constraints handling)

For easy demonstration you can add a tap gesture to trigger the animation in you `viewDidLoad`

```swift
view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
```
and the the handler

``` swift
func handleTap(){
    let reactions = [#imageLiteral(resourceName: "love"), #imageLiteral(resourceName: "angry"), #imageLiteral(resourceName: "ill"), #imageLiteral(resourceName: "devil")]
    (0...10).forEach { (_) in
        let image = reactions[Int(arc4random_uniform(UInt32(reactions.count)))]
        reactionsView?.showReaction(image: image)
    }
}
```

## Installation

#### CocoaPods

Install CocoaPods if not already available:

``` bash
$ [sudo] gem install cocoapods
$ pod setup
```
Go to the directory of your Xcode project, and Create and Edit your *Podfile* and add _FNReactionsView_:

``` bash
$ cd /path/to/MyProject
$ touch Podfile
$ edit Podfile
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'

use_frameworks!
pod 'FNReactionsView'
```

Install into your project:

``` bash
$ pod install
```

Open your project in Xcode from the .xcworkspace file (not the usual project file):

``` bash
$ open MyProject.xcworkspace
```

You can now `import FNReactionsView` framework into your files.

#### Manually

[Download](https://github.com/fabiosoft/FNReactionsView/archive/master.zip) the project and copy the `FNReactionsView` folder into your project to use it in.

## Contribution

Contributions are welcome *♡*.

## Contact

Fabio Nisci • [fabionisci@gmail.com](mailto:fabionisci@gmail.com)


## License (MIT)

Copyright (c) 2017-present - Fabio Nisci

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
