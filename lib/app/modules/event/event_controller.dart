import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xticket/shared/utils/app_list.dart';

import '../home/events_model.dart';

class EventController extends GetxController {
  List<Map<String, dynamic>> categoryList = [];
  bool isLoading = false;

  Future<void> getEvents() async {
    isLoading = true;
    update();
    await Future.delayed(Duration(seconds: 2));
    isLoading = false;
    update();
  }

  @override
  Future<void> onInit() async {
    await getEvents();
    super.onInit();
  }

  EventController({required BuildContext context}) {
    categoryList = AppList.appEventCategoryList(context);
  }
  final List<EventDetails> events = [
    EventDetails(
      title: 'Summer Splash A Seasonal Celebration',
      rating: 4.0,
      about:
          "Join us for the annual Summer Splash, the premier event of the season that brings together music, water games, and summer festivities. Celebrate the sunny days with live performances from top-tier bands and DJs, indulge in delicious summer treats, and participate in a variety of water activities.",
      category: 'Concert',
      date: '18 Jun 2024',
      time: '09:00 AM',
      price: 'From: 300.00 SAR',
      whatsapp: '012048355',
      phone: '012048355',
      email: 'summer@gmail.com',
      location: 'Al Safa Park, Jeddah, Saudi Arabia',
      mapLink: 'https://www.google.com/maps?q=Al+Safa+Park,+Jeddah',
      socialLinks: ['Facebook', 'YouTube', 'LinkedIn'],
      images: [
        "https://img.freepik.com/free-psd/event-banner-template-design_23-2149231980.jpg",
      ],
      orgenagerLogo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyZZNA_M5Y0yJd_3RqgZKIJe_EDzQcnbL8MA&s",
    ),
    EventDetails(
      title: 'TechX 2024: Future of Innovation',
      rating: 4.8,
      about:
          "TechX is the leading annual technology conference in the region. Discover the latest advancements in AI, robotics, and innovation with global speakers, exhibitors, and immersive workshops.",
      category: 'Conference',
      date: '05 Sep 2024',
      time: '10:00 AM',
      price: 'From: 150.00 SAR',
      whatsapp: '0556789123',
      phone: '0556789123',
      email: 'info@techx.com',
      location: 'King Abdullah Convention Center, Riyadh, Saudi Arabia',
      mapLink:
          'https://www.google.com/maps?q=King+Abdullah+Convention+Center,+Riyadh',
      socialLinks: ['Facebook', 'Twitter', 'LinkedIn'],
      images: [
        "https://img.freepik.com/free-vector/technology-conference-banner_23-2148534866.jpg",
      ],
      orgenagerLogo: "https://cdn-icons-png.flaticon.com/512/2784/2784445.png",
    ),
    EventDetails(
      title: 'Desert Beats Music Festival',
      rating: 4.5,
      about:
          "Experience the rhythm in the heart of the desert! Desert Beats brings together top international DJs, desert camping, and fire shows for a weekend full of vibes.",
      category: 'Festival',
      date: '12 Oct 2024',
      time: '04:00 PM',
      price: 'From: 500.00 SAR',
      whatsapp: '0551234567',
      phone: '0551234567',
      email: 'contact@desertbeats.com',
      location: 'Al Ula Desert, Saudi Arabia',
      mapLink: 'https://www.google.com/maps?q=Al+Ula,+Saudi+Arabia',
      socialLinks: ['Instagram', 'YouTube'],
      images: [
        "https://img.freepik.com/free-vector/music-event-banner_23-2148531501.jpg",
      ],
      orgenagerLogo: "https://cdn-icons-png.flaticon.com/512/1828/1828884.png",
    ),
    EventDetails(
      title: 'Art & Culture Expo 2024',
      rating: 4.2,
      about:
          "Celebrate the richness of local and global art! From fine arts and photography to cultural performances, this expo brings the best of creativity under one roof.",
      category: 'Exhibition',
      date: '01 Nov 2024',
      time: '11:00 AM',
      price: 'Free Entry',
      whatsapp: '0509988776',
      phone: '0509988776',
      email: 'hello@artexpo.com',
      location: 'Cultural District, Dammam, Saudi Arabia',
      mapLink: 'https://www.google.com/maps?q=Cultural+District,+Dammam',
      socialLinks: ['Facebook', 'Pinterest'],
      images: [
        "https://img.freepik.com/free-vector/art-exhibition-banner-design_23-2148728392.jpg",
      ],
      orgenagerLogo: "https://cdn-icons-png.flaticon.com/512/685/685655.png",
    ),
  ];
}
