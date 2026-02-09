import 'package:flutter_test/flutter_test.dart';
import 'package:fly_cargo/core/design_system/widgets/deeplink_parser.dart';

void main() {
  late DeepLinkParser parser;

  setUp(() {
    parser = const DeepLinkParser(domain: 'sapsano.kz');
  });

  group('DeepLinkParser - OrderPaymentLink', () {
    test('должен парсить успешный payment link', () {
      final url =
          'https://sapsano.kz/hooks/order/payment/171/action/back/success';
      final result = parser.parse(url);

      expect(result, isA<OrderPaymentLink>());
      final paymentLink = result as OrderPaymentLink;
      expect(paymentLink.orderId, 171);
      expect(paymentLink.status, PaymentStatus.success);
    });

    test('должен парсить failed payment link', () {
      final url =
          'https://sapsano.kz/hooks/order/payment/999/action/back/failure';
      final result = parser.parse(url);

      expect(result, isA<OrderPaymentLink>());
      final paymentLink = result as OrderPaymentLink;
      expect(paymentLink.orderId, 999);
      expect(paymentLink.status, PaymentStatus.failure);
    });

    test('должен парсить unknown status как PaymentStatus.unknown', () {
      final url =
          'https://sapsano.kz/hooks/order/payment/100/action/back/cancelled';
      final result = parser.parse(url);

      expect(result, isA<OrderPaymentLink>());
      final paymentLink = result as OrderPaymentLink;
      expect(paymentLink.orderId, 100);
      expect(paymentLink.status, PaymentStatus.unknown);
    });

    test('должен вернуть null для невалидного orderId', () {
      final url =
          'https://sapsano.kz/hooks/order/payment/abc/action/back/success';
      final result = parser.parse(url);

      expect(result, isNull);
    });

    test('должен вернуть UnknownDeepLink для неполного payment пути', () {
      final url = 'https://sapsano.kz/hooks/order/payment/171/action';
      final result = parser.parse(url);

      expect(result, isA<UnknownDeepLink>());
    });

    test('должен игнорировать неправильные сегменты в payment пути', () {
      final url =
          'https://sapsano.kz/hooks/order/payment/171/wrong/back/success';
      final result = parser.parse(url);

      // Парсер не проверяет содержимое сегментов 'action' и 'back'
      // он просто берет сегменты по индексам [3] и [6]
      // Поэтому этот URL всё равно успешно парсится
      expect(result, isA<OrderPaymentLink>());
      final paymentLink = result as OrderPaymentLink;
      expect(paymentLink.orderId, 171);
      expect(paymentLink.status, PaymentStatus.success);
    });
  });

  group('DeepLinkParser - OrderProcessingDirectionLink', () {
    test('должен парсить direction link с валидными city IDs', () {
      final url =
          'https://sapsano.kz/hooks/order/processing/direction/cities/22/74';
      final result = parser.parse(url);

      expect(result, isA<OrderProcessingDirectionLink>());
      final directionLink = result as OrderProcessingDirectionLink;
      expect(directionLink.fromCityId, 22);
      expect(directionLink.toCityId, 74);
    });

    test('должен парсить direction link с другими city IDs', () {
      final url =
          'https://sapsano.kz/hooks/order/processing/direction/cities/1/999';
      final result = parser.parse(url);

      expect(result, isA<OrderProcessingDirectionLink>());
      final directionLink = result as OrderProcessingDirectionLink;
      expect(directionLink.fromCityId, 1);
      expect(directionLink.toCityId, 999);
    });

    test('должен вернуть null для невалидного fromCityId', () {
      final url =
          'https://sapsano.kz/hooks/order/processing/direction/cities/abc/74';
      final result = parser.parse(url);

      expect(result, isNull);
    });

    test('должен вернуть null для невалидного toCityId', () {
      final url =
          'https://sapsano.kz/hooks/order/processing/direction/cities/22/xyz';
      final result = parser.parse(url);

      expect(result, isNull);
    });

    test('должен вернуть UnknownDeepLink для неполного direction пути', () {
      final url =
          'https://sapsano.kz/hooks/order/processing/direction/cities/22';
      final result = parser.parse(url);

      expect(result, isA<UnknownDeepLink>());
    });

    test('должен вернуть null для слишком длинного direction пути', () {
      final url =
          'https://sapsano.kz/hooks/order/processing/direction/cities/22/74/extra';
      final result = parser.parse(url);

      // Парсер ожидает точно 7 сегментов, поэтому возвращает null
      expect(result, isNull);
    });
  });

  group('DeepLinkParser - OrderAccumulatorIdentificationLink', () {
    test('должен парсить accumulator identification link', () {
      final url = 'https://sapsano.kz/hooks/order/accumulator/identification/9';
      final result = parser.parse(url);

      expect(result, isA<OrderAccumulatorIdentificationLink>());
      final accumulatorLink = result as OrderAccumulatorIdentificationLink;
      expect(accumulatorLink.accumulatorId, 9);
    });

    test('должен парсить accumulator link с большим ID', () {
      final url =
          'https://sapsano.kz/hooks/order/accumulator/identification/12345';
      final result = parser.parse(url);

      expect(result, isA<OrderAccumulatorIdentificationLink>());
      final accumulatorLink = result as OrderAccumulatorIdentificationLink;
      expect(accumulatorLink.accumulatorId, 12345);
    });

    test('должен вернуть null для невалидного accumulatorId', () {
      final url =
          'https://sapsano.kz/hooks/order/accumulator/identification/abc';
      final result = parser.parse(url);

      expect(result, isNull);
    });

    test('должен вернуть UnknownDeepLink для неполного accumulator пути', () {
      final url = 'https://sapsano.kz/hooks/order/accumulator/identification';
      final result = parser.parse(url);

      expect(result, isA<UnknownDeepLink>());
    });

    test('должен вернуть null для слишком длинного accumulator пути', () {
      final url =
          'https://sapsano.kz/hooks/order/accumulator/identification/9/extra';
      final result = parser.parse(url);

      // Парсер ожидает точно 5 сегментов, поэтому возвращает null
      expect(result, isNull);
    });

    test(
      'должен вернуть UnknownDeepLink для пути с неправильной структурой',
      () {
        final url = 'https://sapsano.kz/hooks/order/accumulator/wrong/9';
        final result = parser.parse(url);

        // Этот путь не соответствует ни одному из известных паттернов
        expect(result, isA<UnknownDeepLink>());
      },
    );
  });

  group('DeepLinkParser - OrderIdentificationLink', () {
    test('должен парсить order identification link с буквенно-цифровым ID', () {
      final url = 'https://sapsano.kz/hooks/order/identification/ABC123XYZ';
      final result = parser.parse(url);

      expect(result, isA<OrderIdentificationLink>());
      final identificationLink = result as OrderIdentificationLink;
      expect(identificationLink.identification, 'ABC123XYZ');
    });

    test('должен парсить order identification link с дефисами', () {
      final url =
          'https://sapsano.kz/hooks/order/identification/order-2024-001';
      final result = parser.parse(url);

      expect(result, isA<OrderIdentificationLink>());
      final identificationLink = result as OrderIdentificationLink;
      expect(identificationLink.identification, 'order-2024-001');
    });

    test('должен парсить order identification link с цифрами', () {
      final url = 'https://sapsano.kz/hooks/order/identification/123456';
      final result = parser.parse(url);

      expect(result, isA<OrderIdentificationLink>());
      final identificationLink = result as OrderIdentificationLink;
      expect(identificationLink.identification, '123456');
    });

    test('должен парсить order identification link с underscores', () {
      final url = 'https://sapsano.kz/hooks/order/identification/order_id_123';
      final result = parser.parse(url);

      expect(result, isA<OrderIdentificationLink>());
      final identificationLink = result as OrderIdentificationLink;
      expect(identificationLink.identification, 'order_id_123');
    });

    test(
      'должен вернуть UnknownDeepLink для неполного identification пути',
      () {
        final url = 'https://sapsano.kz/hooks/order/identification';
        final result = parser.parse(url);

        expect(result, isA<UnknownDeepLink>());
      },
    );

    test('должен вернуть null для слишком длинного identification пути', () {
      final url = 'https://sapsano.kz/hooks/order/identification/ABC123/extra';
      final result = parser.parse(url);

      // Парсер ожидает точно 4 сегмента, поэтому возвращает null
      expect(result, isNull);
    });
  });

  group('DeepLinkParser - Валидация домена', () {
    test('должен вернуть null для неправильного домена', () {
      final url =
          'https://other-domain.kz/hooks/order/payment/171/action/back/success';
      final result = parser.parse(url);

      expect(result, isNull);
    });

    test('должен вернуть null для домена с www', () {
      final url =
          'https://www.sapsano.kz/hooks/order/payment/171/action/back/success';
      final result = parser.parse(url);

      expect(result, isNull);
    });

    test('должен корректно работать с правильным доменом', () {
      final url =
          'https://sapsano.kz/hooks/order/payment/171/action/back/success';
      final result = parser.parse(url);

      expect(result, isNotNull);
      expect(result, isA<OrderPaymentLink>());
    });

    test('должен различать поддомены', () {
      final url =
          'https://api.sapsano.kz/hooks/order/payment/171/action/back/success';
      final result = parser.parse(url);

      expect(result, isNull);
    });
  });

  group('DeepLinkParser - Валидация пути', () {
    test('должен вернуть null для пути без /hooks', () {
      final url = 'https://sapsano.kz/regular/path';
      final result = parser.parse(url);

      expect(result, isNull);
    });

    test('должен вернуть null для пустого пути', () {
      final url = 'https://sapsano.kz/';
      final result = parser.parse(url);

      expect(result, isNull);
    });

    test('должен вернуть UnknownDeepLink для неизвестного типа deep link', () {
      final url = 'https://sapsano.kz/hooks/order/unknown/path';
      final result = parser.parse(url);

      expect(result, isA<UnknownDeepLink>());
    });

    test('должен вернуть UnknownDeepLink для пути только с /hooks', () {
      final url = 'https://sapsano.kz/hooks';
      final result = parser.parse(url);

      expect(result, isA<UnknownDeepLink>());
    });

    test('должен вернуть UnknownDeepLink для пути /hooks/order', () {
      final url = 'https://sapsano.kz/hooks/order';
      final result = parser.parse(url);

      expect(result, isA<UnknownDeepLink>());
    });
  });

  group('DeepLinkParser - Edge cases', () {
    test('должен обработать некорректный URL', () {
      final url = 'not-a-valid-url';
      final result = parser.parse(url);

      expect(result, isNull);
    });

    test('должен обработать пустую строку', () {
      final url = '';
      final result = parser.parse(url);

      expect(result, isNull);
    });

    test('должен обработать URL без протокола', () {
      final url = 'sapsano.kz/hooks/order/payment/171/action/back/success';
      final result = parser.parse(url);

      expect(result, isNull);
    });

    test('должен обработать URL с query параметрами', () {
      final url =
          'https://sapsano.kz/hooks/order/payment/171/action/back/success?param=value';
      final result = parser.parse(url);

      expect(result, isA<OrderPaymentLink>());
      final paymentLink = result as OrderPaymentLink;
      expect(paymentLink.orderId, 171);
      expect(paymentLink.status, PaymentStatus.success);
    });

    test('должен обработать URL с fragment', () {
      final url =
          'https://sapsano.kz/hooks/order/payment/171/action/back/success#section';
      final result = parser.parse(url);

      expect(result, isA<OrderPaymentLink>());
      final paymentLink = result as OrderPaymentLink;
      expect(paymentLink.orderId, 171);
      expect(paymentLink.status, PaymentStatus.success);
    });

    test('должен обработать URL с query параметрами и fragment', () {
      final url =
          'https://sapsano.kz/hooks/order/identification/ABC123?foo=bar#section';
      final result = parser.parse(url);

      expect(result, isA<OrderIdentificationLink>());
      final identificationLink = result as OrderIdentificationLink;
      expect(identificationLink.identification, 'ABC123');
    });

    test('должен обработать URL с trailing slash', () {
      final url = 'https://sapsano.kz/hooks/order/identification/ABC123/';
      final result = parser.parse(url);

      // Фактическое поведение: Uri.parse создает дополнительный пустой сегмент
      // segments будет ['hooks', 'order', 'identification', 'ABC123', '']
      // length = 5, а парсер ожидает 4, поэтому вернет null
      expect(result, isNull);
    });

    test('должен обработать URL с encoded символами', () {
      final url = 'https://sapsano.kz/hooks/order/identification/order%2D123';
      final result = parser.parse(url);

      expect(result, isA<OrderIdentificationLink>());
      final identificationLink = result as OrderIdentificationLink;
      expect(identificationLink.identification, 'order-123');
    });
  });

  group('DeepLinkParser - Порядок проверки типов', () {
    test(
      'должен правильно определить OrderIdentificationLink перед другими типами',
      () {
        // OrderIdentificationLink имеет более короткий путь и должен проверяться первым
        final url = 'https://sapsano.kz/hooks/order/identification/test';
        final result = parser.parse(url);

        expect(result, isA<OrderIdentificationLink>());
      },
    );

    test('должен правильно определить OrderAccumulatorIdentificationLink', () {
      final url =
          'https://sapsano.kz/hooks/order/accumulator/identification/123';
      final result = parser.parse(url);

      expect(result, isA<OrderAccumulatorIdentificationLink>());
      expect(result, isNot(isA<OrderIdentificationLink>()));
    });
  });

  group('PaymentStatus.fromString', () {
    test('должен вернуть success для "success"', () {
      expect(PaymentStatus.fromString('success'), PaymentStatus.success);
    });

    test('должен вернуть success для "SUCCESS" (case-insensitive)', () {
      expect(PaymentStatus.fromString('SUCCESS'), PaymentStatus.success);
    });

    test('должен вернуть success для "SuCcEsS" (mixed case)', () {
      expect(PaymentStatus.fromString('SuCcEsS'), PaymentStatus.success);
    });

    test('должен вернуть failure для "failure"', () {
      expect(PaymentStatus.fromString('failure'), PaymentStatus.failure);
    });

    test('должен вернуть failure для "FAILURE" (case-insensitive)', () {
      expect(PaymentStatus.fromString('FAILURE'), PaymentStatus.failure);
    });

    test('должен вернуть unknown для неизвестного статуса', () {
      expect(PaymentStatus.fromString('cancelled'), PaymentStatus.unknown);
      expect(PaymentStatus.fromString('pending'), PaymentStatus.unknown);
      expect(PaymentStatus.fromString(''), PaymentStatus.unknown);
      expect(PaymentStatus.fromString('random'), PaymentStatus.unknown);
    });
  });

  group('DeepLinkParser - toString методы', () {
    test('OrderPaymentLink.toString должен корректно форматироваться', () {
      const link = OrderPaymentLink(
        orderId: 123,
        status: PaymentStatus.success,
      );
      expect(
        link.toString(),
        'OrderPaymentLink(orderId: 123, status: PaymentStatus.success)',
      );
    });

    test(
      'OrderProcessingDirectionLink.toString должен корректно форматироваться',
      () {
        const link = OrderProcessingDirectionLink(fromCityId: 10, toCityId: 20);
        expect(
          link.toString(),
          'OrderProcessingDirectionLink(fromCityId: 10, toCityId: 20)',
        );
      },
    );

    test(
      'OrderAccumulatorIdentificationLink.toString должен корректно форматироваться',
      () {
        const link = OrderAccumulatorIdentificationLink(accumulatorId: '5');
        expect(
          link.toString(),
          'OrderAccumulatorIdentificationLink(accumulatorId: 5)',
        );
      },
    );

    test(
      'OrderIdentificationLink.toString должен корректно форматироваться',
      () {
        const link = OrderIdentificationLink(identification: 'ABC123');
        expect(
          link.toString(),
          'OrderIdentificationLink(identification: ABC123)',
        );
      },
    );

    test('UnknownDeepLink.toString должен корректно форматироваться', () {
      const link = UnknownDeepLink('https://example.com/unknown');
      expect(
        link.toString(),
        'UnknownDeepLink(url: https://example.com/unknown)',
      );
    });
  });

  group('DeepLinkParser - Интеграционные тесты', () {
    test('должен корректно парсить все типы deep links', () {
      final testCases = {
        'https://sapsano.kz/hooks/order/payment/171/action/back/success':
            OrderPaymentLink,
        'https://sapsano.kz/hooks/order/processing/direction/cities/22/74':
            OrderProcessingDirectionLink,
        'https://sapsano.kz/hooks/order/accumulator/identification/9':
            OrderAccumulatorIdentificationLink,
        'https://sapsano.kz/hooks/order/identification/ABC123':
            OrderIdentificationLink,
      };

      for (final entry in testCases.entries) {
        final result = parser.parse(entry.key);
        expect(
          result.runtimeType,
          entry.value,
          reason: 'Failed for URL: ${entry.key}',
        );
      }
    });

    test('должен вернуть null для всех невалидных доменов', () {
      final invalidUrls = [
        'https://wrong-domain.kz/hooks/order/payment/171/action/back/success',
        'https://www.sapsano.kz/hooks/order/payment/171/action/back/success',
        'http://sapsano.com/hooks/order/payment/171/action/back/success',
      ];

      for (final url in invalidUrls) {
        expect(parser.parse(url), isNull, reason: 'Failed for URL: $url');
      }
    });

    test('должен вернуть UnknownDeepLink для неизвестных путей', () {
      final unknownUrls = [
        'https://sapsano.kz/hooks/order/unknown',
        'https://sapsano.kz/hooks/something/else',
        'https://sapsano.kz/hooks/order/payment/171',
      ];

      for (final url in unknownUrls) {
        expect(
          parser.parse(url),
          isA<UnknownDeepLink>(),
          reason: 'Failed for URL: $url',
        );
      }
    });
  });
}
