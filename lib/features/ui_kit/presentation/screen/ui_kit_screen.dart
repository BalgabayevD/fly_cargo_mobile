import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/chip.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:fly_cargo/core/design_system/components/list_tile.dart';
import 'package:fly_cargo/core/design_system/components/page.dart';
import 'package:fly_cargo/core/design_system/components/space.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';

class UiKitScreen extends StatelessWidget {
  static String path = '/ui-kit';

  const UiKitScreen({super.key});

  static String location() => Uri(path: path).toString();

  static GoRoute route() {
    return GoRoute(
      path: path,
      builder: (context, state) => const UiKitScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BePage(
      title: 'Better Exp',
      child: ListView(
        children: [
          CheckListTile(
            isSelected: true,
            title: '3123 **** 23',
            description: 'Kaspi.kz',
            image: Image.network(
              'https://upload.wikimedia.org/wikipedia/ru/a/aa/Logo_of_Kaspi_bank.png',
            ),
            onTap: () {},
          ),
          BeSpace(size: .md),
          CheckListTile(
            isSelected: true,
            title: 'Быстрая доставка',
            onTap: () {},
          ),
          BeSpace(size: .md),
          FlatListTile(
            label: 'Куда',
            value: 'г. Алматы, ул Кошкарбаева, д. 421',
          ),
          BeSpace(size: .md),
          FieldListTile(
            label: 'Получатель',
            value: 'Дамир Т, +7 (777) 234-12-12',
          ),
          BeSpace(size: .md),
          CheckListTile(
            isSelected: true,
            child: Expanded(
              child: AgreementText(),
            ),
            onTap: () {},
          ),
          BeSpace(size: .md),
          LightListTile(
            title: 'Язык приложения',
            description: 'Русский',
          ),
          BeSpace(size: .md),
          LightListTile(
            title: 'Язык приложения',
            endContent: HeroIcon(
              HeroIcons.arrowTopRightOnSquare,
              size: 20,
              color: BeColors.surface4,
            ),
          ),
          BeSpace(size: .md),
          OrderListTile(
            title: 'Заказ 4',
            message: 'Трековый номер 123-456-789',
            trailing: '12.11.2025',
            statusLabel: 'На скаде в Алмате',
            color: .success,
            varinant: .ghost,
          ),
          BeSpace(size: .md),
          Text('OrderListTile'),
          OrderListTile(
            title: 'Заказ 4',
            message: 'Трековый номер 123-456-789',
            trailing: '12.11.2025',
            statusLabel: 'На скаде в Алмате',
            color: .danger,
            varinant: .ghost,
          ),
          BeSpace(size: .md),
          OrderListTile(
            title: 'Заказ 4',
            message: 'Трековый номер 123-456-789',
            trailing: '12.11.2025',
            statusLabel: 'На скаде в Алмате',
            color: .info,
            varinant: .ghost,
          ),
          BeSpace(size: .md),
          OrderListTile(
            title: 'Заказ 4',
            message: 'Трековый номер 123-456-789',
            trailing: '12.11.2025',
            statusLabel: 'На скаде в Алмате',
            color: .info,
            varinant: .bordered,
          ),
          BeSpace(size: .md),
          OrderListTile(
            title: 'Заказ 4',
            message: 'Трековый номер 123-456-789',
            trailing: '12.11.2025',
            statusLabel: 'На скаде в Алмате',
            color: .success,
            varinant: .bordered,
          ),
          BeSpace(size: .md),
          OrderListTile(
            title: 'Заказ 4',
            message: 'Трековый номер 123-456-789',
            trailing: '12.11.2025',
            statusLabel: 'На скаде в Алмате',
            color: .success,
            varinant: .flat,
          ),
          BeSpace(size: .md),
          OrderListTile(
            title: 'Заказ 4',
            message: 'Трековый номер 123-456-789',
            trailing: '12.11.2025',
            statusLabel: 'На скаде в Алмате',
            color: .normal,
            varinant: .ghost,
          ),
          BeSpace(size: .md),

          Text('BeChip'),
          Wrap(
            spacing: 12,
            children: [
              Padding(
                padding: EdgeInsetsGeometry.symmetric(vertical: 4),
                child: BeChip(
                  text: 'Заказа отправлен',
                ),
              ),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(vertical: 4),
                child: BeChip(
                  text: 'Заказа отправлен',
                  color: .info,
                ),
              ),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(vertical: 4),
                child: BeChip(
                  text: 'Заказа отправлен',
                  color: .success,
                ),
              ),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(vertical: 4),
                child: BeChip(
                  text: 'Заказа отправлен',
                  color: .warning,
                ),
              ),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(vertical: 4),
                child: BeChip(
                  text: 'Заказа отправлен',
                  color: .danger,
                ),
              ),

              //
              Padding(
                padding: EdgeInsetsGeometry.symmetric(vertical: 4),
                child: BeChip(
                  text: 'Заказа отправлен',
                  variant: .bordered,
                ),
              ),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(vertical: 4),
                child: BeChip(
                  text: 'Заказа отправлен',
                  color: .info,
                  variant: .bordered,
                ),
              ),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(vertical: 4),
                child: BeChip(
                  text: 'Заказа отправлен',
                  color: .success,
                  variant: .bordered,
                ),
              ),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(vertical: 4),
                child: BeChip(
                  text: 'Заказа отправлен',
                  color: .warning,
                  variant: .bordered,
                ),
              ),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(vertical: 4),
                child: BeChip(
                  text: 'Заказа отправлен',
                  color: .danger,
                  variant: .bordered,
                ),
              ),

              //
              Padding(
                padding: EdgeInsetsGeometry.symmetric(vertical: 4),
                child: BeChip(
                  text: 'Заказа отправлен',
                  variant: .flat,
                ),
              ),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(vertical: 4),
                child: BeChip(
                  text: 'Заказа отправлен',
                  color: .info,
                  variant: .flat,
                ),
              ),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(vertical: 4),
                child: BeChip(
                  text: 'Заказа отправлен',
                  color: .success,
                  variant: .flat,
                ),
              ),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(vertical: 4),
                child: BeChip(
                  text: 'Заказа отправлен',
                  color: .warning,
                  variant: .flat,
                ),
              ),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(vertical: 4),
                child: BeChip(
                  text: 'Заказа отправлен',
                  color: .danger,
                  variant: .flat,
                ),
              ),
            ],
          ),
          BeSpace(size: .md),
          Wrap(
            spacing: 12,
            children: [
              Padding(
                padding: EdgeInsetsGeometry.symmetric(vertical: 4),
                child: BeChip(
                  text: 'Успех',
                  color: .success,
                  size: .sm,
                  variant: .flat,
                ),
              ),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(vertical: 4),
                child: BeChip(
                  text: 'Требует внимания',
                  color: .warning,
                  size: .md,
                  variant: .flat,
                ),
              ),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(vertical: 4),
                child: BeChip(
                  text: 'Заказа отменен',
                  size: .lg,
                  color: .danger,
                  variant: .flat,
                ),
              ),

              Padding(
                padding: EdgeInsetsGeometry.symmetric(vertical: 4),
                child: BeChip(
                  text: 'Успех',
                  isLoading: true,
                  color: .success,
                  size: .sm,
                  variant: .flat,
                ),
              ),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(vertical: 4),
                child: BeChip(
                  text: 'Требует внимания',
                  isLoading: true,
                  color: .warning,
                  size: .md,
                  variant: .flat,
                ),
              ),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(vertical: 4),
                child: BeChip(
                  text: 'Заказа отменен',
                  isLoading: true,
                  size: .lg,
                  color: .danger,
                  variant: .flat,
                ),
              ),
            ],
          ),
          BeSpace(size: .md),
        ],
      ),
    );
  }
}

class AgreementText extends StatelessWidget {
  const AgreementText({super.key});

  TextStyle get _linkStyle => TextStyle(
    color: BeColors.info,
  );
  TextStyle get _textStyle => GoogleFonts.montserrat(
    color: BeColors.surface5,
    fontSize: 13,
    fontWeight: .w600,
  );

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: _textStyle,
        children: [
          const TextSpan(text: 'Я ознакомился и согласен с '),
          TextSpan(
            text: 'политикой использования',
            style: _linkStyle,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                debugPrint('Политика использования');
              },
          ),
          const TextSpan(text: ' и '),
          TextSpan(
            text: 'условиями оферты',
            style: _linkStyle,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                debugPrint('Условия оферты');
              },
          ),
        ],
      ),
    );
  }
}
