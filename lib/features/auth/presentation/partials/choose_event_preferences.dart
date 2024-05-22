import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/colors/app_color.dart';
import '../../../../core/utils/constants/routes.dart';
import '../../../../shared/components/buttons/custom_elevated_button.dart';
import '../components/preferences.dart';

class ChooseEventPreferences extends StatefulWidget {
  const ChooseEventPreferences({super.key});

  @override
  State<ChooseEventPreferences> createState() => _ChooseEventPreferencesState();
}

class _ChooseEventPreferencesState extends State<ChooseEventPreferences> {
  static const events = ['Musique', 'Sport', 'Formation'];
  static const eventsType = ['Jazz', 'RapTrap', 'Slow'];
  static const departments = ['Paris', 'Nice', 'Marseille'];
  String _selectedEvent = '';
  String _selectedDepartment = '';
  String _selectedType = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Evènement ',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              TextSpan(
                  text: 'préféré',
                  style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
        const Align(
          alignment: Alignment.topRight,
          child: Wrap(
            spacing: 10,
            children: [
              CircleAvatar(
                radius: 17,
                backgroundColor: AppColor.pink1,
                child: CircleAvatar(
                  radius: 15,
                  child: Icon(Icons.arrow_back),
                ),
              ),
              CircleAvatar(
                radius: 17,
                backgroundColor: AppColor.pink1,
                child: CircleAvatar(
                  radius: 15,
                  child: Icon(Icons.arrow_forward),
                ),
              ),
            ],
          ),
        ),
        Wrap(
          spacing: 15,
          children: events
              .map(
                (event) => Preferences(
                  label: event,
                  onTap: () => setState(() => _selectedEvent = event),
                  isSelected: _selectedEvent == event,
                ),
              )
              .toList(),
        ),
        Visibility(
          visible: _selectedEvent.isNotEmpty,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(15),
              const Divider(color: AppColor.blue2,),
              const Gap(15),
              Wrap(
                spacing: 15,
                children: eventsType
                    .map(
                      (type) => Preferences(
                    label: type,
                    onTap: () => setState(() => _selectedType = type),
                    isSelected: _selectedType == type,
                  ),
                )
                    .toList(),
              ),
            ],
          ),
        ),
        const Gap(40),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Département ',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              TextSpan(
                  text: 'favoris',
                  style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
        const Gap(20),
        const Align(
          alignment: Alignment.topRight,
          child: Wrap(
            spacing: 10,
            children: [
              CircleAvatar(
                radius: 17,
                backgroundColor: AppColor.pink1,
                child: CircleAvatar(
                  radius: 15,
                  child: Icon(Icons.arrow_back),
                ),
              ),
              CircleAvatar(
                radius: 17,
                backgroundColor: AppColor.pink1,
                child: CircleAvatar(
                  radius: 15,
                  child: Icon(Icons.arrow_forward),
                ),
              ),
            ],
          ),
        ),
        const Gap(15),
        Wrap(
          spacing: 15,
          children: departments
              .map(
                (department) => Preferences(
                  label: department,
                  onTap: () => setState(() => _selectedDepartment = department),
                  isSelected: _selectedDepartment == department,
                ),
              )
              .toList(),
        ),
        const Gap(60),
        Center(
          child: FractionallySizedBox(
            widthFactor: 0.4,
            child: CustomElevatedButton(
              onPressed: () => context.push(Routes.subscriptionThirdStep),
              borderRadius: 35,
              child: Text(
                'Enregistrer',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColor.green1,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
