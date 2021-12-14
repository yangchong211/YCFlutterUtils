/*
Copyright 2017 yangchong211（github.com/yangchong211）

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/
class BannerData {
  BannerData({
    this.title,
    this.category,
    this.imageUrl,
  });

  final String title;
  final String category;
  final String imageUrl;
}

final sampleItems = <BannerData>[
  new BannerData(title: '潇湘剑雨', category: '', imageUrl: 'assets/image/image1.jpg',),
  new BannerData(title: '小杨逗比', category: '', imageUrl: 'assets/image/image2.jpg',),
  new BannerData(title: '我的GitHub', category: '', imageUrl: 'assets/image/image3.jpg',),
  new BannerData(title: '掘金博客', category: '', imageUrl: 'assets/image/image4.jpg',),
  new BannerData(title: '技术博客', category: '', imageUrl: 'assets/image/image5.png',),
];