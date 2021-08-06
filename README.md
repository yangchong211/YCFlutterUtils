# YCFlutterUtils
#### 目录介绍
- 01.事件通知bus工具类
- 02.颜色Color工具类
- 03.日期转化工具类
- 04.File文件工具类
- 05.Sql数据库工具类
- 06.Json转化工具类
- 07.Log日志打印工具类
- 08.屏幕参数工具类
- 09.Sp轻量存储工具类
- 10.辅助计算工具类
- 11.加密和解密工具类
- 12.Num格式处理工具类
- 13.设备参数获取工具类
- 14.图片处理工具类
- 15.网络处理工具类
- 16.常用正则工具类
- 17.Object常用工具类
- 18.验证相关工具类
- 19.路由管理工具类
- 20.Bus事件工具类
- 21.Text文本工具类
- 22.i18拓展工具类
- 23.Time时间工具类
- 24.SPI帮助工具类
- 25.计时器辅助工具类
- 26.常见拓展工具类
- 27.内存缓存工具类
- 28.清除操作工具类
- 29.编解码相关工具类
- 30.反射相关工具类
- 31.资源相关工具类
- 32.Snackbar工具类
- 33.转化相关工具类
- 40.其他相关工具类

### 01.事件通知bus工具类
- 事件总线
    - 通常实现了订阅者模式，订阅者模式包含发布者和订阅者两种角色。
- 第一种方式：使用map集合存储key为事件eventName，value为EventCallback实现bus
    ``` dart
    //注册监听bus
    _subscription = EventBusService.instance.eventBus.on<EventMessage>().listen((event) {
          String name = event.eventName;
          //前后台切换发生了变化
          if (name == "eventBus1") {
            var busMessage = event.arguments["busMessage"];
            setState(() {
              message1 = busMessage;
            });
          }
        });
    
    //发送消息
    EventBusService.instance.eventBus.fire(EventMessage(
      "eventBus1",
      arguments: {"busMessage": "发送bus消息1"},
    ));
    
    //页面销毁清除bus
    if (_subscription != null) {
      _subscription.cancel();
      _subscription = null;
    }
    ```
- 第二种方式：使用StreamController实现bus事件通知
    ```
    //注册监听消息
    bus.on("eventBus2", (arg) {
      var busMessage = arg;
      setState(() {
        message2 = "接收消息：" + busMessage;
      });
    });
    
    //发送消息
    var arg = "发送bus消息1";
    bus.emit("eventBus2", arg);
    
    //移除消息
    bus.off("eventBus2", (arg) {
    
    });
    ```



### 02.颜色Color工具类
- 颜色Color工具类
    ```
    hexToColor                               : 将#A357D6颜色转化为16进制的Color
    toColor                                  : 将#FF6325颜色或者#50A357D6转化为16进制的Color
    colorString                              : 将color颜色转变为字符串
    colorString                              : 检查字符串是否为十六进制
    ```


### 03.日期转化工具类
- 日期转化工具类
    ```
    getNowDateMs                             : 将#获取当前毫秒值，返回int
    getNowDateString                         : 获取现在日期字符串，默认是：yyyy-MM-dd HH:mm:ss，返回字符串
    formatDate                               : 格式化时间，第一个字段是dateTime，第二个可选项表示格式
    formatDateString                         : 格式化日期字符串，第一个字段例如：'2021-07-18 16:03:10'，第二个字段例如："yyyy/M/d HH:mm:ss"
    formatDateMilliseconds                   : 格式化日期毫秒时间，第一个字段例如：1213423143312，第二个字段例如："yyyy/M/d HH:mm:ss"
    getWeekday                               : 获取dateTime是星期几
    getWeekdayByMilliseconds                 : 获取毫秒值对应是星期几
    isToday                                  : 根据时间戳判断是否是今天
    isYesterday                              : 根据时间判断是否是昨天
    ```


### 04.File文件工具类
#### 4.1 文件存储工具类
- 文件存储工具类
    ```
    getTempDir                               : 获取一个临时目录(缓存)，系统可以随时清除
    getAppDocDir                             : 获取应用程序的目录，用于存储只有它可以访问的文件。只有当应用程序被删除时，系统才会清除目录。
    getAppFile                               : 初始化文件路径，默认选中应用程序的目录
    readStringDir                            : 获取存在文件中的数据，默认读到应用程序的目录
    writeJsonFileDir                         : 写入json文件，默认写到应用程序的目录
    writeStringDir                           : 利用文件存储字符串，默认写到应用程序的目录
    clearFileDataDir                         : 清除缓存数据
    deleteFileDataDir                        : 删除缓存文件
    writeJsonCustomFile                      : 写入json文件，自定义路径
    writeStringFile                          : 利用文件存储字符串，自定义路径
    readStringCustomFile                     : 获取自定义路径文件存中的数据
    ```


#### 4.2 文件管理工具类
- 文件管理工具类
    ```
    getTempPath                              : 获取设备上临时目录的路径，该目录没有备份，适合存储下载文件的缓存。
    getAppDocPath                            : 获取应用程序的目录，用于存储只有它可以访问的文件。只有当应用程序被删除时，系统才会清除目录。
    getStoragePath                           : 应用程序可以访问顶层存储的目录的路径
    createDirSync                            : 异步创建文件
    createDir                                : 同步创建文件
    createTempDir                            : 创建临时目录
    createAppDocDir                          : 创建获取应用程序的目录
    ```


### 05.Sql数据库工具类
- 待完善


### 06.Json转化工具类
- Json转化工具类
    ```
    printJson                                : 单纯的Json格式输出打印
    printJsonEncode                          : 单纯的Json格式输出打印
    encodeObj                                : 将对象[值]转换为JSON字符串
    getObj                                   : 转换JSON字符串到对象
    getObject                                : 转换JSON字符串或JSON映射[源]到对象
    getObjList                               : 转换JSON字符串列表[源]到对象列表
    getObjectList                            : 转换JSON字符串或JSON映射列表[源]到对象列表
    ```


### 07.Log日志打印工具类
- Log日志打印工具类
    ```
    init                                     : 初始化日志，自定义tag，是否是debug环境，日志最大长度，这几个字段都是非必选
    d                                        : 打印debug日志
    e                                        : 打印error日志
    v                                        : 打印v日志
    i                                        : 打印info日志
    w                                        : 打印ware警告日志
    ```



### 08.屏幕参数工具类
- 屏幕参数工具类
    ```
    screenWidthDp                            : 当前设备宽度 dp
    screenHeightDp                           : 当前设备高度 dp
    pixelRatio                               : 设备的像素密度
    screenWidth                              : 当前设备宽度 px = dp * 密度
    screenHeight                             : 当前设备高度 px = dp * 密度
    
    statusBarHeight                          : 状态栏高度 dp 刘海屏会更高
    bottomBarHeight                          : 底部安全区距离 dp
    textScaleFactory                         : 像素的字体像素数，字体的缩放比例
    ```



### 11.加密和解密工具类
- 加密和解密工具类
    ```
    encodeMd5                                : md5 加密字符串，这种是不可逆的
    encodeBase64                             : Base64加密字符串
    decodeBase64                             : Base64解密字符串
    xorBase64Encode                          : 异或对称 Base64 加密
    xorBase64Decode                          : 异或对称 Base64 解密
    ```


### 12.Num格式处理工具类
- 格式处理工具类
    ```
    isNum                                    : 检查字符串是int还是double
    getIntByValueString                      : 将数字字符串转int。如果字符串不是数字，则转化为0
    getDoubleByValueString                   : 数字字符串转double。如果字符串不是数字，则转化为0
    getNumByValueString                      : 将数字字符串转num，数字保留x位小数
    getNumByValueDouble                      : 浮点数字保留x位小数
    addNum                                   : 两个数相加（防止精度丢失）
    subtractNum                              : 两个数相减（防止精度丢失）
    multiplyNum                              : 两个数相乘（防止精度丢失）
    divideNum                                : 两个数相除（防止精度丢失）
    addDecString                             : 两个数相加（防止精度丢失）
    subtractDecString                        : 两个数相减（防止精度丢失）
    multiplyDecString                        : 两个数相乘（防止精度丢失）
    divideDecString                          : 两个数相除（防止精度丢失）
    ```


### 14.图片处理工具类
- 其他待完善，补充圆角，圆形切割图片，以及处理本地等图片的方法。
    ```
    base64ToImage                            : 将base64流转化为图片
    fileToBase64                             : 将图片file转化为base64
    networkImageToBase64                     : 将网络链接图片转化为base64
    assetImageToBase64                       : 将asset图片转化为base64
    showNetImageWh                           : 加载网络图片，并且指定宽高大小。使用默认预加载loading和错误视图
    showNetImageWhError                      : 加载网络图片，并且指定宽高大小。传入错误视图
    showNetImageWhPlaceError                 : 加载网络图片，并且指定宽高大小。传入预加载，错误视图
    showNetImageWhClip                       : 加载网络图片，并且指定宽高大小，切割圆角
    showNetImageCircle                       : 加载网络图片，切割圆形图片
    ```


### 16.常用正则工具类
- 常用正则表达式，借鉴AndroidUtils工具类，将java转为dart
    ```
    isMobileSimple                           : 简单验证手机号
    isMobileExact                            : 精确验证手机号
    isTel                                    : 验证电话号码
    isIDCard15                               : 验证身份证号码 15 位
    isIDCard18                               : 简单验证身份证号码 18 位
    isIDCard18Exact                          : 精确验证身份证号码 18 位
    isEmail                                  : 验证邮箱
    isURL                                    : 验证 URL
    isZh                                     : 验证汉字
    isUsername                               : 验证用户名
    isDate                                   : 验证 yyyy-MM-dd 格式的日期校验，已考虑平闰年
    isIP                                     : 验证 IP 地址
    match                                    : 判断是否匹配正则
    RegexConstants.REGEX_DOUBLE_BYTE_CHAR    : 双字节
    RegexConstants.REGEX_BLANK_LINE          : 空行
    RegexConstants.REGEX_QQ_NUM              : QQ 号
    RegexConstants.REGEX_CHINA_POSTAL_CODE   : 邮编
    RegexConstants.REGEX_INTEGER             : 整数
    RegexConstants.REGEX_POSITIVE_INTEGER    : 正整数
    RegexConstants.REGEX_NEGATIVE_INTEGER    : 负整数
    RegexConstants.REGEX_NOT_NEGATIVE_INTEGER: 非负整数
    RegexConstants.REGEX_NOT_POSITIVE_INTEGER: 非正整数
    RegexConstants.REGEX_FLOAT               : 浮点数
    RegexConstants.REGEX_POSITIVE_FLOAT      : 正浮点数
    RegexConstants.REGEX_NEGATIVE_FLOAT      : 负浮点数
    RegexConstants.REGEX_NOT_NEGATIVE_FLOAT  : 非负浮点数
    RegexConstants.REGEX_NOT_POSITIVE_FLOAT  : 非正浮点数
    ```


### 17.Object常用工具类
- Object相关工具类如下：
    ```
    isNull                                   : 判断对象是否为null
    isNullOrBlank                            : 检查数据是否为空或空(空或只包含空格)
    isEmptyString                            : 判断字符串是否为空
    isEmptyList                              : 判断集合是否为空
    isEmptyMap                               : 判断字典是否为空
    isEmpty                                  : 判断object对象是否为空
    isNotEmpty                               : 判断object是否不为空
    compareListIsEqual                       : 比较两个集合是否相同
    getLength                                : 获取object的长度
    ```


### 18.验证相关工具类
- 验证相关工具类
    ```
    isNumericOnly                            : 检查字符串是否只包含数字
    isAlphabetOnly                           : 检查字符串是否只包含字母。(没有空格)
    isBool                                   : 检查字符串是否为布尔值
    isVector                                 : 检查string是否为vector文件
    isImage                                  : 检查字符串是否为图像文件
    isAudio                                  : 检查字符串是否为音频文件
    isVideo                                  : 检查字符串是否为视频文件
    isTxt                                    : 检查字符串是否为txt文本文件
    isDocument                               : 检查字符串是否为doc文件
    isExcel                                  : 检查字符串是否为excel文件
    isPPT                                    : 检查字符串是否为ppt文件
    isAPK                                    : 检查字符串是否为apk文件
    isPDF                                    : 检查字符串是否为pdf文件
    isHTML                                   : 检查字符串是否为html文件
    isURL                                    : 检查字符串是否为url文件
    isEmail                                  : 检查字符串是否为email文件
    isDateTime                               : 检查字符串是否为时间
    isMD5                                    : 检查字符串是否为md5
    isSHA1                                   : 检查字符串是否为sha1
    isSHA256                                 : 检查字符串是否为sha256
    isIPv4                                   : 检查字符串是否为ipv4
    isIPv6                                   : 检查字符串是否为ipv6
    isPalindrome                             : 检查字符串是否为回文
    isCaseInsensitiveContains                : 检查a是否包含b(将大小写字母视为相同或解释)。
    isCaseInsensitiveContainsAny             : 检查a中是否包含b或b中是否包含a(将大小写字母视为相同)。
    isCamelCase                              : 检查字符串值是否驼峰大小写
    isCapitalize                             : 检查字符串值是否大写
    ```



### 21.Text文本工具类
- 文本相关工具类如下：
    ```
    isEmpty                                  : 判断文本内容是否为空
    startsWith                               : 判断字符串是以xx开头
    contains                                 : 判断字符串中是否包含xx
    abbreviate                               : 使用点缩写字符串
    compare                                  : 比较两个字符串是否相同
    hammingDistance                          : 比较两个长度一样的字符串有几个字符不同
    formatDigitPattern                       : 每隔 x位 加 pattern。比如用来格式化银行卡
    formatSpace4                             : 每隔4位加空格
    hideNumber                               : 隐藏手机号中间n位，比如隐藏手机号 13667225184 为 136****5184
    replace                                  : 替换字符串中的数据
    split                                    : 按照规则切割字符串，返回数组
    reverse                                  : 反转字符串
    ```


### 22.i18拓展工具类
- LocatizationExtensionState类中：String getString(String id)
    - 获取不同Locales渠道语言内容。举例：使用：var name = context.getString("name");
- LocatizationExtensionContext类中：String getString(String id)
    - 获取不同Locales渠道语言内容
- 如何添加不同渠道语言内容。写在 main 函数中 runApp 之前
    ``` dart
    AppLocalizations.supportedLocales = [
        const Locale('en', 'US'),
        const Locale('pt', 'BR'),
        const Locale('ja', 'JP'),
        const Locale('zh', 'CN'),
    ];
    ```


### 23.Time时间工具类


### 24.SPI帮助工具类
- spi简单介绍
    - Service Locator可以将接口（抽象基类）与具体实现分离和解耦合，同时允许通过接口从App中的任何位置访问具体实现。
    ```
    //第一步注册
    GetIt serviceLocator = GetIt.instance;
    getIt.registerSingleton<BusinessService>(new BusinessServiceImpl());
    
    //第二步使用
    BusinessService businessService = serviceLocator<BusinessService>();
    businessService.noneBusinessPattern();
    
    //第三步解绑
    serviceLocator.resetLazySingleton<BusinessService>();
    ```


### 25.计时器辅助工具类
- 计时器辅助工具类
    ```
    TimerUtils                               : 创建倒计时器
    setTotalTime                             : 设置倒计时总时间
    setInterval                              : 设置Timer间隔
    startTimer                               : 启动定时Timer
    updateTotalTime                          : 重设倒计时总时间
    isActive                                 : 判断Timer是否启动
    pauseTimer                               : 暂停倒计时器
    cancel                                   : 取消计时器
    setOnTimerTickCallback                   : 设置倒计时器的监听
    ```


### 26.常见拓展工具类
#### 26.1 int拓展类：ExtensionInt
- ExtensionInt拓展类
    ```
    isPalindrome                             : 检查int是否为回文
    isOneAKind                               : 检查所有数据是否具有相同的值
    toBinary                                 : 转换int值为二进制
    toBinaryInt                              : 转换int值为二进制int
    fromBinary                               : 转换int值为二进制字符串
    ```


#### 26.2 List拓展类：ExtensionList
- ExtensionList拓展类
    ```
    toJsonString                             : 将list转化为json字符串
    getJsonPretty                            : 将list转化为json字符串，换行
    valueTotal                               : 获取num列表的总值(int/double)
    isNull                                   : 判断对象是否为null
    isNullOrBlank                            : 检查数据是否为空或空(空或只包含空格)
    ```


#### 26.3 Map拓展类：ExtensionMap
- ExtensionMap拓展类【set拓展类同理】
    ```
    toJsonString                             : 将map转化为json字符串
    getJsonPretty                            : 将map转化为json字符串换行
    isNull                                   : 判断对象是否为null
    isNullOrBlank                            : 检查数据是否为空或空(空或只包含空格)
    ```


#### 26.4 String拓展类：ExtensionString
- ExtensionString拓展类
    ```
    isNull                                   : 判断对象是否为null
    isNullOrBlank                            : 检查数据是否为空或空(空或只包含空格)
    isNumericOnly                            : 检查字符串是否只包含数字
    isAlphabetOnly                           : 检查字符串是否只包含字母。(没有空格)
    isBool                                   : 检查字符串是否为布尔值
    isVector                                 : 检查string是否为vector文件
    isImage                                  : 检查字符串是否为图像文件
    isAudio                                  : 检查字符串是否为音频文件
    isVideo                                  : 检查字符串是否为视频文件
    isTxt                                    : 检查字符串是否为txt文本文件
    isDocument                               : 检查字符串是否为doc文件
    isExcel                                  : 检查字符串是否为excel文件
    isPPT                                    : 检查字符串是否为ppt文件
    isAPK                                    : 检查字符串是否为apk文件
    isPDF                                    : 检查字符串是否为pdf文件
    isHTML                                   : 检查字符串是否为html文件
    isURL                                    : 检查字符串是否为url文件
    isEmail                                  : 检查字符串是否为email文件
    isDateTime                               : 检查字符串是否为时间
    isMD5                                    : 检查字符串是否为md5
    isSHA1                                   : 检查字符串是否为sha1
    isSHA256                                 : 检查字符串是否为sha256
    isIPv4                                   : 检查字符串是否为ipv4
    isIPv6                                   : 检查字符串是否为ipv6
    isPalindrome                             : 检查字符串是否为回文
    isCaseInsensitiveContains                : 检查a是否包含b(将大小写字母视为相同或解释)。
    isCaseInsensitiveContainsAny             : 检查a中是否包含b或b中是否包含a(将大小写字母视为相同)。
    isCamelCase                              : 检查字符串值是否驼峰大小写
    isCapitalize                             : 检查字符串值是否大写
    ```



### 33.转化相关工具类
- 转化相关的操作工具类
    ```
    toBinary                                 : 转换int值为二进制，比如：15 => 1111
    toBinaryInt                              : 转换int值为二进制
    fromBinary                               : 转换二进制为int值
    capitalize                               : 字符串内的每个单词都要大写
    capitalizeFirst                          : 字符串的首字母大写，其他字母小写
    removeAllWhitespace                      : 删除字符串内的所有空格
    numericOnly                              : 提取字符串的数值
    ```



### 40.其他相关工具类



