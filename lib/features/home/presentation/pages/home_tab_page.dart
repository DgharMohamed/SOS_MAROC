import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/widgets/emergency_button.dart';
import '../../../../common/widgets/service_card.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/router/app_router.dart';
import '../../../../models/service_item.dart';
import '../providers/home_nav_provider.dart';

class HomeTabPage extends ConsumerWidget {
  const HomeTabPage({super.key});

  static const List<ServiceItem> _services = [
    ServiceItem(
      name: 'Police',
      icon: Icons.local_police,
      color: AppColors.accentBlue,
    ),
    ServiceItem(
      name: 'Ambulance',
      icon: Icons.medical_services,
      color: AppColors.emergencyRed,
    ),
    ServiceItem(
      name: 'Firefighters',
      icon: Icons.local_fire_department,
      color: Color(0xFFF57C00),
    ),
    ServiceItem(
      name: 'Hospitals',
      icon: Icons.local_hospital,
      color: Color(0xFF00897B),
    ),
    ServiceItem(
      name: 'Pharmacies',
      icon: Icons.local_pharmacy,
      color: Color(0xFF43A047),
    ),
    ServiceItem(
      name: 'Electricity',
      icon: Icons.flash_on,
      color: Color(0xFFFFB300),
    ),
    ServiceItem(
      name: 'Water',
      icon: Icons.water_drop,
      color: Color(0xFF1E88E5),
    ),
    ServiceItem(
      name: 'Telecom',
      icon: Icons.wifi,
      color: Color(0xFF6D4C41),
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current location',
              style: textTheme.bodyMedium,
            ),
            const SizedBox(height: AppSpacing.sm),
            Row(
              children: [
                const Icon(
                  Icons.place,
                  color: AppColors.emergencyRed,
                ),
                const SizedBox(width: AppSpacing.sm),
                Text(
                  'Tangier, Morocco',
                  style: textTheme.titleLarge,
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xl),
            Center(
              child: EmergencyButton(
                label: 'EMERGENCY',
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRouter.panic);
                },
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            Text(
              'Services',
              style: textTheme.titleLarge,
            ),
            const SizedBox(height: AppSpacing.md),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _services.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: AppSpacing.md,
                crossAxisSpacing: AppSpacing.md,
                childAspectRatio: 1.15,
              ),
              itemBuilder: (context, index) {
                final item = _services[index];
                return ServiceCard(
                  item: item,
                  onTap: () {
                    ref.read(bottomNavIndexProvider.notifier).state = 1;
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
