import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fly_cargo/core/design_system/components/button.dart';

// Импортируйте ваш файл с BeButton
// import 'package:your_app/be_button.dart';

void main() {
  group('BeButton - Базовый рендеринг', () {
    testWidgets('должен рендерить кнопку с текстом', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BeButton(
              text: 'Test Button',
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text('Test Button'), findsOneWidget);
      expect(find.byType(MaterialButton), findsOneWidget);
    });

    testWidgets('должен рендерить кнопку с child виджетом', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BeButton(
              child: const Icon(Icons.home),
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.home), findsOneWidget);
    });

    testWidgets('должен рендерить кнопку со startContent', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BeButton(
              text: 'Button',
              startContent: const Icon(Icons.add),
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.text('Button'), findsOneWidget);
    });

    testWidgets('должен рендерить кнопку с endContent', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BeButton(
              text: 'Button',
              endContent: const Icon(Icons.arrow_forward),
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.arrow_forward), findsOneWidget);
      expect(find.text('Button'), findsOneWidget);
    });

    testWidgets('должен рендерить кнопку с start и end content', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BeButton(
              text: 'Button',
              startContent: const Icon(Icons.add),
              endContent: const Icon(Icons.arrow_forward),
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.byIcon(Icons.arrow_forward), findsOneWidget);
      expect(find.text('Button'), findsOneWidget);
    });
  });

  group('BeButton - Размеры', () {
    testWidgets('должен иметь правильную высоту для lg размера', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BeButton(
              text: 'Large Button',
              size: BeButtonSize.lg,
              onPressed: () {},
            ),
          ),
        ),
      );

      final materialButton = tester.widget<MaterialButton>(
        find.byType(MaterialButton),
      );
      expect(materialButton.height, 56);
    });

    testWidgets('должен иметь правильную высоту для md размера', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BeButton(
              text: 'Medium Button',
              size: BeButtonSize.md,
              onPressed: () {},
            ),
          ),
        ),
      );

      final materialButton = tester.widget<MaterialButton>(
        find.byType(MaterialButton),
      );
      expect(materialButton.height, 46);
    });

    testWidgets('должен иметь правильную высоту для sm размера', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BeButton(
              text: 'Small Button',
              size: BeButtonSize.sm,
              onPressed: () {},
            ),
          ),
        ),
      );

      final materialButton = tester.widget<MaterialButton>(
        find.byType(MaterialButton),
      );
      expect(materialButton.height, 32);
    });
  });

  group('BeButton - Варианты (Variants)', () {
    testWidgets('должен рендерить solid variant', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BeButton(
              text: 'Solid Button',
              variant: BeButtonVariant.solid,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.byType(BeButton), findsOneWidget);
      expect(
        find.byType(Container),
        findsNothing,
      ); // Нет обертки Container для shadow
    });

    testWidgets('должен рендерить bordered variant', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BeButton(
              text: 'Bordered Button',
              variant: BeButtonVariant.bordered,
              onPressed: () {},
            ),
          ),
        ),
      );

      final materialButton = tester.widget<MaterialButton>(
        find.byType(MaterialButton),
      );
      final shape = materialButton.shape as RoundedRectangleBorder;
      expect(shape.side.width, 2);
    });

    testWidgets('должен рендерить faded variant с border', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BeButton(
              text: 'Faded Button',
              variant: BeButtonVariant.faded,
              onPressed: () {},
            ),
          ),
        ),
      );

      final materialButton = tester.widget<MaterialButton>(
        find.byType(MaterialButton),
      );
      final shape = materialButton.shape as RoundedRectangleBorder;
      expect(shape.side.width, 2);
    });

    testWidgets('должен рендерить ghost variant с border', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BeButton(
              text: 'Ghost Button',
              variant: BeButtonVariant.ghost,
              onPressed: () {},
            ),
          ),
        ),
      );

      final materialButton = tester.widget<MaterialButton>(
        find.byType(MaterialButton),
      );
      final shape = materialButton.shape as RoundedRectangleBorder;
      expect(shape.side.width, 2);
    });

    testWidgets('должен рендерить shadow variant с Container', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BeButton(
              text: 'Shadow Button',
              variant: BeButtonVariant.shadow,
              onPressed: () {},
            ),
          ),
        ),
      );

      // Shadow variant должен быть обернут в Container с BoxShadow
      final container = tester.widget<Container>(
        find.ancestor(
          of: find.byType(MaterialButton),
          matching: find.byType(Container),
        ),
      );

      final decoration = container.decoration as BoxDecoration;
      expect(decoration.boxShadow, isNotNull);
      expect(decoration.boxShadow!.isNotEmpty, true);
    });

    testWidgets('должен рендерить flat variant без border', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BeButton(
              text: 'Flat Button',
              variant: BeButtonVariant.flat,
              onPressed: () {},
            ),
          ),
        ),
      );

      final materialButton = tester.widget<MaterialButton>(
        find.byType(MaterialButton),
      );
      final shape = materialButton.shape as RoundedRectangleBorder;
      expect(shape.side.width, 0);
    });

    testWidgets('должен рендерить light variant без border', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BeButton(
              text: 'Light Button',
              variant: BeButtonVariant.light,
              onPressed: () {},
            ),
          ),
        ),
      );

      final materialButton = tester.widget<MaterialButton>(
        find.byType(MaterialButton),
      );
      final shape = materialButton.shape as RoundedRectangleBorder;
      expect(shape.side.width, 0);
    });
  });

  group('BeButton - Цвета', () {
    for (final color in BeButtonColor.values) {
      testWidgets('должен рендерить кнопку с цветом $color', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: BeButton(
                text: '${color.name} Button',
                color: color,
                onPressed: () {},
              ),
            ),
          ),
        );

        expect(find.text('${color.name} Button'), findsOneWidget);
      });
    }
  });

  group('BeButton - Состояния', () {
    testWidgets('должен вызывать onPressed при нажатии', (tester) async {
      var pressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BeButton(
              text: 'Clickable Button',
              onPressed: () {
                pressed = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(BeButton));
      await tester.pumpAndSettle();

      expect(pressed, true);
    });

    testWidgets('не должен вызывать onPressed когда isDisabled = true', (
      tester,
    ) async {
      var pressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BeButton(
              text: 'Disabled Button',
              isDisabled: true,
              onPressed: () {
                pressed = true;
              },
            ),
          ),
        ),
      );

      // Попытка нажать на кнопку
      await tester.tap(find.byType(BeButton));
      await tester.pump();

      // ВАЖНО: если этот тест падает (pressed == true),
      // это означает что BeButton НЕ учитывает isDisabled флаг
      // Нужно исправить BeButton, чтобы он проверял isDisabled в onPressed
      expect(
        pressed,
        false,
        reason: 'onPressed НЕ должен вызываться когда isDisabled = true',
      );
    });

    testWidgets('должен вызывать onPressed когда isDisabled = false', (
      tester,
    ) async {
      var pressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BeButton(
              text: 'Enabled Button',
              isDisabled: false,
              onPressed: () {
                pressed = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(BeButton));
      await tester.pumpAndSettle();

      expect(pressed, true);
    });

    testWidgets('не должен вызывать onPressed когда isLoading = true', (
      tester,
    ) async {
      var pressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BeButton(
              text: 'Loading Button',
              isLoading: true,
              onPressed: () {
                pressed = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(BeButton));
      // Используем pump() вместо pumpAndSettle() так как CircularProgressIndicator бесконечно анимируется
      await tester.pump();

      expect(pressed, false);
    });

    testWidgets(
      'должен показывать CircularProgressIndicator когда isLoading = true',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: BeButton(
                text: 'Loading Button',
                isLoading: true,
                onPressed: () {},
              ),
            ),
          ),
        );

        expect(find.byType(CircularProgressIndicator), findsOneWidget);

        final progress = tester.widget<CircularProgressIndicator>(
          find.byType(CircularProgressIndicator),
        );
        expect(progress.strokeWidth, 3);
        expect(progress.strokeCap, StrokeCap.round);
      },
    );

    testWidgets(
      'не должен показывать CircularProgressIndicator когда isLoading = false',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: BeButton(
                text: 'Normal Button',
                isLoading: false,
                onPressed: () {},
              ),
            ),
          ),
        );

        expect(find.byType(CircularProgressIndicator), findsNothing);
      },
    );

    testWidgets('не должен вызывать onPressed когда onPressed = null', (
      tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: BeButton(
              text: 'No Handler Button',
              onPressed: null,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(BeButton));
      await tester.pumpAndSettle();

      // Не должно быть ошибок
      expect(find.text('No Handler Button'), findsOneWidget);
    });
  });

  group('BeButton - Кастомные цвета', () {
    testWidgets('должен использовать кастомный backgroundColor', (
      tester,
    ) async {
      const customColor = Colors.purple;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BeButton(
              text: 'Custom BG',
              backgroundColor: customColor,
              onPressed: () {},
            ),
          ),
        ),
      );

      final materialButton = tester.widget<MaterialButton>(
        find.byType(MaterialButton),
      );
      expect(materialButton.color, customColor);
    });

    testWidgets('должен использовать кастомный textColor', (tester) async {
      const customColor = Colors.orange;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BeButton(
              text: 'Custom Text',
              textColor: customColor,
              onPressed: () {},
            ),
          ),
        ),
      );

      final materialButton = tester.widget<MaterialButton>(
        find.byType(MaterialButton),
      );
      expect(materialButton.textColor, customColor);
    });

    testWidgets('должен использовать оба кастомных цвета одновременно', (
      tester,
    ) async {
      const customBgColor = Colors.teal;
      const customTextColor = Colors.yellow;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BeButton(
              text: 'Custom Colors',
              backgroundColor: customBgColor,
              textColor: customTextColor,
              onPressed: () {},
            ),
          ),
        ),
      );

      final materialButton = tester.widget<MaterialButton>(
        find.byType(MaterialButton),
      );
      expect(materialButton.color, customBgColor);
      expect(materialButton.textColor, customTextColor);
    });
  });

  group('BeButton - Border Radius', () {
    testWidgets('должен иметь правильный border radius для lg размера', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BeButton(
              text: 'Large',
              size: BeButtonSize.lg,
              onPressed: () {},
            ),
          ),
        ),
      );

      final materialButton = tester.widget<MaterialButton>(
        find.byType(MaterialButton),
      );
      final shape = materialButton.shape as RoundedRectangleBorder;
      expect(shape.borderRadius, BorderRadius.circular(18));
    });

    testWidgets('должен иметь правильный border radius для md размера', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BeButton(
              text: 'Medium',
              size: BeButtonSize.md,
              onPressed: () {},
            ),
          ),
        ),
      );

      final materialButton = tester.widget<MaterialButton>(
        find.byType(MaterialButton),
      );
      final shape = materialButton.shape as RoundedRectangleBorder;
      expect(shape.borderRadius, BorderRadius.circular(18));
    });

    testWidgets('должен иметь правильный border radius для sm размера', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BeButton(
              text: 'Small',
              size: BeButtonSize.sm,
              onPressed: () {},
            ),
          ),
        ),
      );

      final materialButton = tester.widget<MaterialButton>(
        find.byType(MaterialButton),
      );
      final shape = materialButton.shape as RoundedRectangleBorder;
      expect(shape.borderRadius, BorderRadius.circular(12));
    });
  });

  group('BeButton - Комбинации вариантов и цветов', () {
    testWidgets('solid + primary должен работать корректно', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BeButton(
              text: 'Primary Solid',
              variant: BeButtonVariant.solid,
              color: BeButtonColor.primary,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text('Primary Solid'), findsOneWidget);
    });

    testWidgets('bordered + danger должен работать корректно', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BeButton(
              text: 'Danger Bordered',
              variant: BeButtonVariant.bordered,
              color: BeButtonColor.danger,
              onPressed: () {},
            ),
          ),
        ),
      );

      final materialButton = tester.widget<MaterialButton>(
        find.byType(MaterialButton),
      );
      final shape = materialButton.shape as RoundedRectangleBorder;
      expect(shape.side.width, 2);
    });

    testWidgets('shadow + success должен работать корректно', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BeButton(
              text: 'Success Shadow',
              variant: BeButtonVariant.shadow,
              color: BeButtonColor.success,
              onPressed: () {},
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find.ancestor(
          of: find.byType(MaterialButton),
          matching: find.byType(Container),
        ),
      );

      final decoration = container.decoration as BoxDecoration;
      expect(decoration.boxShadow, isNotNull);
    });
  });

  group('BeButton - Edge Cases', () {
    testWidgets('должен работать с пустым текстом', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BeButton(
              text: '',
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text(''), findsOneWidget);
    });

    testWidgets('должен работать с очень длинным текстом', (tester) async {
      const longText = 'This is a very long button text that might overflow';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BeButton(
              text: longText,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text(longText), findsOneWidget);

      // Текст должен быть в Flexible виджете для предотвращения overflow
      expect(
        find.ancestor(
          of: find.text(longText),
          matching: find.byType(Flexible),
        ),
        findsOneWidget,
      );
    });

    testWidgets('должен работать одновременно с isLoading и isDisabled', (
      tester,
    ) async {
      var pressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BeButton(
              text: 'Button',
              isLoading: true,
              isDisabled: true,
              onPressed: () {
                pressed = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(BeButton));
      // Используем pump() вместо pumpAndSettle() так как CircularProgressIndicator бесконечно анимируется
      await tester.pump();

      expect(pressed, false);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('должен работать со всеми параметрами одновременно', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BeButton(
              text: 'Full Button',
              startContent: const Icon(Icons.add),
              endContent: const Icon(Icons.arrow_forward),
              variant: BeButtonVariant.shadow,
              color: BeButtonColor.primary,
              size: BeButtonSize.lg,
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text('Full Button'), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.byIcon(Icons.arrow_forward), findsOneWidget);
    });
  });

  group('BeButton - MaterialButton properties', () {
    testWidgets('должен иметь правильные elevation значения', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BeButton(
              text: 'Button',
              onPressed: () {},
            ),
          ),
        ),
      );

      final materialButton = tester.widget<MaterialButton>(
        find.byType(MaterialButton),
      );
      expect(materialButton.elevation, 0);
      expect(materialButton.highlightElevation, 0);
      expect(materialButton.hoverElevation, 0);
      expect(materialButton.disabledElevation, 0);
      expect(materialButton.focusElevation, 0);
    });

    testWidgets('должен иметь minWidth = double.infinity', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BeButton(
              text: 'Button',
              onPressed: () {},
            ),
          ),
        ),
      );

      final materialButton = tester.widget<MaterialButton>(
        find.byType(MaterialButton),
      );
      expect(materialButton.minWidth, double.infinity);
    });
  });
}
