import 'dart:math' as math;

class CustomPoint<T extends num> extends math.Point<T> {
  const CustomPoint(T x, T y) : super(x, y);

  CustomPoint<T> operator /(num /*T|int*/ factor) {
    return CustomPoint(x / factor as T, y / factor as T);
  }

  CustomPoint<T> ceil() {
    return CustomPoint(x.ceil() as T, y.ceil() as T);
  }

  CustomPoint<T> floor() {
    return CustomPoint(x.floor() as T, y.floor() as T);
  }

  CustomPoint<T> unscaleBy(CustomPoint<T> point) {
    return CustomPoint(x / point.x as T, y / point.y as T);
  }

  @override
  CustomPoint<T> operator +(math.Point<T> other) {
    return CustomPoint<T>(x + other.x as T, y + other.y as T);
  }

  @override
  CustomPoint<T> operator -(math.Point<T> other) {
    return CustomPoint<T>(x - other.x as T, y - other.y as T);
  }

  @override
  CustomPoint<T> operator *(num /*T|int*/ factor) {
    return CustomPoint<T>((x * factor as T), (y * factor) as T);
  }

  CustomPoint scaleBy(CustomPoint point) {
    return CustomPoint(x * point.x as T, y * point.y as T);
  }

  CustomPoint round() {
    final x = this.x is double ? this.x.round() : this.x;
    final y = this.y is double ? this.y.round() : this.y;
    return CustomPoint(x, y);
  }

  CustomPoint multiplyBy(num n) {
    return CustomPoint(x * n, y * n);
  }

  // Clockwise rotation
  CustomPoint rotate(num radians) {
    if (radians != 0.0) {
      final cos = math.cos(radians);
      final sin = math.sin(radians);
      final nx = (cos * x) + (sin * y);
      final ny = (cos * y) - (sin * x);

      return CustomPoint(nx, ny);
    }

    return this;
  }

  @override
  String toString() => 'CustomPoint ($x, $y)';
}
