import 'package:flutter/material.dart';
import 'package:heeramyst/core/extensions/context_ext.dart';
import 'package:heeramyst/core/theme/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  final List<Tab> tabs = const [
    Tab(text: "HOW TO USE"),
    Tab(text: "EXPERT TIPS"),
    Tab(text: "WHATS IN IT"),
    Tab(text: "FAQs"),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: appbarWidget(context),
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return Center(
            child: SizedBox(
              width: context.isMobile
                  ? constraints.maxWidth
                  : constraints.maxWidth * 0.7,
              child: Scrollbar(
                trackVisibility: false,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product Section
                      SizedBox(
                        height: 300,
                        child: Row(
                          children: [
                            Expanded(flex: 2, child: shadesWidget(context)),
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                spacing: 10,
                                children: [
                                  Expanded(
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            width: double.infinity,
                                            height: double.infinity,
                                            padding: const EdgeInsets.all(8.0),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.grey.shade200,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                            child: Image.asset(
                                                "assets/images/lipstick.png")),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "Lip Solution Lipstick",
                                    style:
                                        context.textTheme.titleMedium?.copyWith(
                                      color: AppColors.textPrimary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Soft Matte Lipstick - Blush Rose (Pink Shade) | Long Lasting, Hydrating, Moisturising, Matte Finish Creamy Lipstick",
                                    style: context.textTheme.bodyLarge
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    "Its a soft matte lipstick for every occasion.",
                                    style: context.textTheme.labelSmall,
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    "₹ 8XXX only /-",
                                    style:
                                        context.textTheme.titleMedium?.copyWith(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primary,
                                      foregroundColor: AppColors.white,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 40, vertical: 20),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                    ),
                                    onPressed: () {},
                                    child: const Text("BUY NOW"),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Tabs
                      Center(
                        child: TabBar(
                          controller: _tabController,
                          tabs: tabs,
                          labelColor: AppColors.primary,
                          labelStyle: context.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          dividerColor: Colors.transparent,
                          unselectedLabelStyle: context.textTheme.bodyLarge,
                          unselectedLabelColor: AppColors.textSecondary,
                          indicatorColor: AppColors.primary,
                          isScrollable: true,
                        ),
                      ),

                      SizedBox(
                        height:
                            200, // Required to give TabBarView a fixed height
                        child: TabBarView(
                          controller: _tabController,
                          children: tabs.map((tab) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '1. If you have dry lips, apply a lip balm and let it set in. Then dab off the excess before applying the lipstick.',
                                    style: context.textTheme.bodyMedium
                                        ?.copyWith(
                                            color: AppColors.textPrimary),
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    '2. Line your lips with a lip liner and then apply the soft matte lipstick. Wait for 30 seconds before applying a second coat.',
                                    style: context.textTheme.bodyMedium
                                        ?.copyWith(
                                            color: AppColors.textPrimary),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  /// Shades Grid
  Column shadesWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            '12 Shades |',
            style:
                TextStyle(fontWeight: FontWeight.bold, fontFamily: "Raleway"),
          ),
        ),
        Expanded(
          child: GridView.builder(
            itemCount: AppColors.shadeColors.length,
            padding: const EdgeInsets.all(8.0),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 50,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: AppColors.shadeColors[index],
                  // borderRadius: BorderRadius.circular(4),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  /// AppBar Widget
  AppBar appbarWidget(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      backgroundColor: AppColors.surface,
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset("assets/images/brand_logo.png", height: 90, width: 90),

            // Right Side Buttons
            Flexible(
              child: Wrap(
                spacing: 8.0,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  TextButton.icon(
                    icon: const Icon(Icons.person, size: 24),
                    onPressed: () {},
                    label: const Text('MY ACCOUNT'),
                  ),
                  TextButton.icon(
                    icon: Image.asset("assets/images/coins.png", width: 30),
                    onPressed: () {},
                    label: const Text('REWARDS'),
                  ),
                  TextButton.icon(
                    icon: Image.asset("assets/images/whatsapp.png", width: 30),
                    onPressed: () {},
                    label: const Text('WHATSAPP'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      centerTitle: false,
    );
  }
}
