abstract class DeepLink {
  const DeepLink();
}

class OrderPaymentLink extends DeepLink {
  final int orderId;
  final PaymentStatus status;

  const OrderPaymentLink({required this.orderId, required this.status});

  @override
  String toString() => 'OrderPaymentLink(orderId: $orderId, status: $status)';
}

class OrderIdentificationLink extends DeepLink {
  final String identification;

  const OrderIdentificationLink({required this.identification});

  @override
  String toString() =>
      'OrderIdentificationLink(identification: $identification)';
}

class OrderProcessingDirectionLink extends DeepLink {
  final int fromCityId;
  final int toCityId;

  const OrderProcessingDirectionLink({
    required this.fromCityId,
    required this.toCityId,
  });

  @override
  String toString() =>
      'OrderProcessingDirectionLink(fromCityId: $fromCityId, toCityId: $toCityId)';
}

class OrderAccumulatorIdentificationLink extends DeepLink {
  final String accumulatorId;

  const OrderAccumulatorIdentificationLink({required this.accumulatorId});

  @override
  String toString() =>
      'OrderAccumulatorIdentificationLink(accumulatorId: $accumulatorId)';
}

enum PaymentStatus {
  success,
  failure,
  unknown
  ;

  static PaymentStatus fromString(String value) {
    switch (value.toLowerCase()) {
      case 'success':
        return PaymentStatus.success;
      case 'failure':
        return PaymentStatus.failure;
      default:
        return PaymentStatus.unknown;
    }
  }
}

class UserIdentificationLink extends DeepLink {
  final String userId;

  const UserIdentificationLink({required this.userId});

  @override
  String toString() => 'UserIdentificationLink(userId: $userId)';
}

class UserRoleIdentificationLink extends DeepLink {
  final String role;
  final String userId;

  const UserRoleIdentificationLink({required this.role, required this.userId});

  @override
  String toString() =>
      'UserRoleIdentificationLink(role: $role, userId: $userId)';
}

class UnknownDeepLink extends DeepLink {
  final String url;

  const UnknownDeepLink(this.url);

  @override
  String toString() => 'UnknownDeepLink(url: $url)';
}

class DeepLinkParser {
  final String domain;

  const DeepLinkParser({required this.domain});

  DeepLink? parse(String url) {
    try {
      final uri = Uri.parse(url);

      if (uri.host != domain) {
        return null;
      }

      if (!uri.path.startsWith('/hooks')) {
        return null;
      }

      final segments = uri.pathSegments;

      if (segments.length < 4) {
        return UnknownDeepLink(url);
      }

      if (segments.length >= 4 &&
          segments[1] == 'order' &&
          segments[2] == 'identification') {
        return _parseOrderIdentificationLink(segments, url);
      }

      if (segments.length >= 5 &&
          segments[1] == 'order' &&
          segments[2] == 'accumulator' &&
          segments[3] == 'identification') {
        return _parseOrderAccumulatorIdentificationLink(segments, url);
      }

      if (segments.length >= 7 &&
          segments[1] == 'order' &&
          segments[2] == 'processing' &&
          segments[3] == 'direction' &&
          segments[4] == 'cities') {
        return _parseOrderProcessingDirectionLink(segments, url);
      }

      if (segments.length >= 7 &&
          segments[1] == 'order' &&
          segments[2] == 'payment') {
        return _parseOrderPaymentLink(segments, url);
      }

      // hooks/users/identification/role/{role}/{userId}
      if (segments.length >= 6 &&
          segments[1] == 'users' &&
          segments[2] == 'identification' &&
          segments[3] == 'role') {
        return _parseUserRoleIdentificationLink(segments, url);
      }

      // hooks/users/identification/{userId}
      if (segments.length >= 4 &&
          segments[1] == 'users' &&
          segments[2] == 'identification') {
        return _parseUserIdentificationLink(segments, url);
      }

      return UnknownDeepLink(url);
    } catch (e) {
      return null;
    }
  }

  OrderPaymentLink? _parseOrderPaymentLink(List<String> segments, String url) {
    try {
      // Ожидаем структуру: hooks/order/payment/{id}/action/back/{status}
      if (segments.length != 7) {
        return null;
      }

      final orderId = int.tryParse(segments[3]);
      if (orderId == null) {
        return null;
      }

      final statusString = segments[6];
      final status = PaymentStatus.fromString(statusString);

      return OrderPaymentLink(orderId: orderId, status: status);
    } catch (e) {
      return null;
    }
  }

  OrderProcessingDirectionLink? _parseOrderProcessingDirectionLink(
    List<String> segments,
    String url,
  ) {
    try {
      // Ожидаем структуру: hooks/order/processing/direction/cities/{fromCityId}/{toCityId}
      if (segments.length != 7) {
        return null;
      }

      final fromCityId = int.tryParse(segments[5]);
      final toCityId = int.tryParse(segments[6]);

      if (fromCityId == null || toCityId == null) {
        return null;
      }

      return OrderProcessingDirectionLink(
        fromCityId: fromCityId,
        toCityId: toCityId,
      );
    } catch (e) {
      return null;
    }
  }

  OrderAccumulatorIdentificationLink? _parseOrderAccumulatorIdentificationLink(
    List<String> segments,
    String url,
  ) {
    try {
      // Ожидаем структуру: hooks/order/accumulator/identification/{accumulatorId}
      if (segments.length != 5) {
        return null;
      }

      final accumulatorId = segments[4];

      if (accumulatorId.isEmpty) {
        return null;
      }

      return OrderAccumulatorIdentificationLink(accumulatorId: accumulatorId);
    } catch (e) {
      return null;
    }
  }

  OrderIdentificationLink? _parseOrderIdentificationLink(
    List<String> segments,
    String url,
  ) {
    try {
      // Ожидаем структуру: hooks/order/identification/{identification}
      if (segments.length != 4) {
        return null;
      }

      final identification = segments[3];

      if (identification.isEmpty) {
        return null;
      }

      return OrderIdentificationLink(identification: identification);
    } catch (e) {
      return null;
    }
  }

  UserIdentificationLink? _parseUserIdentificationLink(
    List<String> segments,
    String url,
  ) {
    try {
      // hooks/users/identification/{userId}
      if (segments.length != 4) return null;

      final userId = segments[3];
      if (userId.isEmpty) return null;

      return UserIdentificationLink(userId: userId);
    } catch (e) {
      return null;
    }
  }

  UserRoleIdentificationLink? _parseUserRoleIdentificationLink(
    List<String> segments,
    String url,
  ) {
    try {
      // hooks/users/identification/role/{role}/{userId}
      if (segments.length != 6) return null;

      final role = segments[4];
      final userId = segments[5];

      if (role.isEmpty || userId.isEmpty) return null;

      return UserRoleIdentificationLink(role: role, userId: userId);
    } catch (e) {
      return null;
    }
  }
}
