# ChangeLanguageDynamic
动态设置app语言
![ChangeLanguageDynamic Demo](http://7xljbp.com1.z0.glb.clouddn.com/changeLanguageDynamic.gif)
## Install

```
import "LocalizationManager.h"
```

## Usage

```
首先按照需求设置Localizable.strings中不同语言的翻译文本

//设置语言,其中zh-Hans为文件夹zh-Hans.lproj的名称,其他的语言可以对应设置
setLanguage(@"zh-Hans");

//获取当前语言对应key的string
getString(key);

//获取指定语言对应key的string
getStringWithLanguage(key,lang)

```

## Author
**FengJun** e-mail:<fengarenas@126.com> Blog:[DevFeng](http://devfeng.com/)
