import 'package:fly_cargo/core/entities/box_entity.dart';

extension BoxParameters on BoxEntity {
  double get height {
    switch (id) {
      case 'small':
        return 20.0;
      case 'medium':
        return 30.0;
      case 'big':
        return 40.0;
      default:
        return 30.0;
    }
  }
  
  double get length {
    switch (id) {
      case 'small':
        return 15.0;
      case 'medium':
        return 20.0;
      case 'big':
        return 30.0;
      default:
        return 20.0;
    }
  }
  
  double get width {
    switch (id) {
      case 'small':
        return 10.0;
      case 'medium':
        return 20.0;
      case 'big':
        return 30.0;
      default:
        return 20.0;
    }
  }
  
  double get weight {
    switch (id) {
      case 'small':
        return 0.5;
      case 'medium':
        return 1.0;
      case 'big':
        return 2.0;
      default:
        return 1.0;
    }
  }
  
  double get volumetricWeight {
    return length * width * height / 5000;
  }
  
  int get tariffId {
    switch (id) {
      case 'small':
        return 1;
      case 'medium':
        return 2;
      case 'big':
        return 3;
      default:
        return 2;
    }
  }
}
