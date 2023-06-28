import 'package:fluent_ui/fluent_ui.dart';

class CommandBarWidget extends StatelessWidget {
  const CommandBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CommandBarCard(
      child: Row(
        children: [
          Expanded(
            child: CommandBar(
              overflowBehavior: CommandBarOverflowBehavior.dynamicOverflow,
              overflowItemAlignment: MainAxisAlignment.end,
              primaryItems: [
                CommandBarButton(
                  icon: const Icon(FluentIcons.add),
                  label: const Text('New'),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
