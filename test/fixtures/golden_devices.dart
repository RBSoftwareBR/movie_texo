
import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

List<Device> devices = const [
  //iOS devices
  Device(name:"iPhone 13 Pro",size:Size(1170 , 2532)),
  Device(name:"iPhone XR",size:Size(828 , 1792)),
  Device(name:"iPhone XS, iPhone X",size:Size(1125 , 2436)),
  Device(name:"iPhone XS Max",size:Size(1242 , 2688)),
  Device(name:"iPhone 8 Plus, iPhone 7 Plus, iPhone 6 Plus/6S Plus",size:Size(1080 , 1920)),
  Device(name:"iPhone 8, iPhone 7, iPhone 6/6S",size:Size(750 , 1334)),
  Device(name:"iPhone 5, iPod Touch",size:Size(640 , 1136)),
  Device(name:"iPad Pro",size:Size(2048 , 2732)),
  Device(name:"iPad Third & Fourth Generation, iPad Air 1 & 2, iPad Mini 2 & 3",size:Size(1536 , 2048)),
  Device(name:"iPad Mini",size:Size(768 , 1024)),
  Device(name:"Nexus 6P, Google Pixel 2 XL, Google Pixel XL",size:Size(1440 , 2560)),
  Device(name:"Nexus 5X, Google Pixel",size:Size(1080 , 1920)),
  Device(name:"Google Pixel 7 Pro",size:Size(1440 , 3120)),
  Device(name:"Google Pixel 4 XL",size:Size(1440 , 869)),
  Device(name:"Google Pixel 4",size:Size(1080 , 2280)),
  Device(name:"Google Pixel 3a XL, Google Pixel 3",size:Size(1080 , 2160)),
  Device(name:"Google Pixel 3a",size:Size(1080 , 2220)),
  Device(name:"Google Pixel 3 XL",size:Size(1440 , 2960)),

  //Android devices
  Device(name:"Samsung Galaxy Note 10+",size:Size(1440 , 3040)),
  Device(name:"Samsung Galaxy Note 10",size:Size(1080 , 2280)),
  Device(name:"Samsung Galaxy Note 9",size:Size(1440 , 2960)),
  Device(name:"Samsung Galaxy Note 5, LG G5",size:Size(1440 , 2560)),
  Device(name:"One Plus 3",size:Size(1080 , 1920)),
  Device(name:"Samsung Galaxy S9+, Samsung Galaxy S9, Samsung Galaxy S8+, Samsung Galaxy S8",size:Size(1440 , 2960)),
  Device(name:"Samsung Galaxy S7 Edge, Samsung Galaxy S7",size:Size(1440 , 2560)),
  Device(name:"Nexus 9",size:Size(1536 , 2048)),
  Device(name:"Nexus 7 (2013)",size:Size(1200 , 1920)),
  Device(name:"Pixel C",size:Size(1800 , 2560)),
  Device(name:"Samsung Galaxy Tab 10",size:Size(800 , 1280)),
  Device(name:"Chromebook Pixel",size:Size(2560 , 1700)),

  // Monitores Comuns
  Device(name: "Monitor 1080p (Full HD)", size: Size(1920, 1080)),
  Device(name: "Monitor 1440p (Quad HD)", size: Size(2560, 1440)),
  Device(name: "Monitor 4K (Ultra HD)", size: Size(3840, 2160)),

  // Monitores Ultrawide
  Device(name: "Monitor Ultrawide 1080p", size: Size(2560, 1080)),
  Device(name: "Monitor Ultrawide 1440p", size: Size(3440, 1440)),

  // Monitores para Laptops
  Device(name: "Laptop 720p", size: Size(1366, 768)),
  Device(name: "Laptop 1080p", size: Size(1920, 1080)),
  Device(name: "Laptop 4K", size: Size(3840, 2160)),

  // Outros Tamanhos
  Device(name: "Monitor 5K", size: Size(5120, 2880)),
  Device(name: "Monitor 8K", size: Size(7680, 4320)),
];