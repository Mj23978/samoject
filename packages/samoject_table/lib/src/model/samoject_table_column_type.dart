import 'package:intl/intl.dart' as intl;

abstract class SamojectTableColumnType {
  dynamic get defaultValue;

  /// Set as a string column.
  factory SamojectTableColumnType.text({
    dynamic defaultValue = '',
  }) {
    return SamojectTableColumnTypeText(
      defaultValue: defaultValue,
    );
  }

  /// Set to numeric column.
  ///
  /// [format]
  /// '#,###' (Comma every three digits)
  /// '#,###.###' (Allow three decimal places)
  ///
  /// [negative] Allow negative numbers
  ///
  /// [applyFormatOnInit] When the editor loads, it resets the value to [format].
  ///
  /// [allowFirstDot] When accepting negative numbers, a dot is allowed at the beginning.
  /// This option is required on devices where the .- symbol works with one button.
  ///
  /// [locale] Specifies the numeric locale of the column.
  /// If not specified, the default locale is used.
  factory SamojectTableColumnType.number({
    dynamic defaultValue = 0,
    bool negative = true,
    String format = '#,###',
    bool applyFormatOnInit = true,
    bool allowFirstDot = false,
    String? locale,
  }) {
    return SamojectTableColumnTypeNumber(
      defaultValue: defaultValue,
      format: format,
      negative: negative,
      applyFormatOnInit: applyFormatOnInit,
      allowFirstDot: allowFirstDot,
      locale: locale,
    );
  }

  /// Set to currency column.
  ///
  /// [format]
  /// '#,###' (Comma every three digits)
  /// '#,###.###' (Allow three decimal places)
  ///
  /// [negative] Allow negative numbers
  ///
  /// [applyFormatOnInit] When the editor loads, it resets the value to [format].
  ///
  /// [allowFirstDot] When accepting negative numbers, a dot is allowed at the beginning.
  /// This option is required on devices where the .- symbol works with one button.
  ///
  /// [locale] Specifies the currency locale of the column.
  /// If not specified, the default locale is used.
  factory SamojectTableColumnType.currency({
    dynamic defaultValue = 0,
    bool negative = true,
    String? format,
    bool applyFormatOnInit = true,
    bool allowFirstDot = false,
    String? locale,
    String? name,
    String? symbol,
    int? decimalDigits,
  }) {
    return SamojectTableColumnTypeCurrency(
      defaultValue: defaultValue,
      format: format,
      negative: negative,
      applyFormatOnInit: applyFormatOnInit,
      allowFirstDot: allowFirstDot,
      locale: locale,
      name: name,
      symbol: symbol,
      decimalDigits: decimalDigits,
    );
  }

  /// Provides a selection list and sets it as a selection column.
  factory SamojectTableColumnType.select(
    List<dynamic> items, {
    dynamic defaultValue = '',
    bool enableColumnFilter = false,
  }) {
    return SamojectTableColumnTypeSelect(
      defaultValue: defaultValue,
      items: items,
      enableColumnFilter: enableColumnFilter,
    );
  }

  /// Set as a date column.
  ///
  /// [startDate] Range start date (If there is no value, Can select the date without limit)
  ///
  /// [endDate] Range end date
  ///
  /// [format] 'yyyy-MM-dd' (2020-01-01)
  ///
  /// [headerFormat] 'yyyy-MM' (2020-01)
  /// Display year and month in header in date picker popup.
  ///
  /// [applyFormatOnInit] When the editor loads, it resets the value to [format].
  factory SamojectTableColumnType.date({
    dynamic defaultValue = '',
    DateTime? startDate,
    DateTime? endDate,
    String format = 'yyyy-MM-dd',
    String headerFormat = 'yyyy-MM',
    bool applyFormatOnInit = true,
  }) {
    return SamojectTableColumnTypeDate(
      defaultValue: defaultValue,
      startDate: startDate,
      endDate: endDate,
      format: format,
      headerFormat: headerFormat,
      applyFormatOnInit: applyFormatOnInit,
    );
  }

  factory SamojectTableColumnType.time({
    dynamic defaultValue = '00:00',
  }) {
    return SamojectTableColumnTypeTime(
      defaultValue: defaultValue,
    );
  }

  bool isValid(dynamic value);

  int compare(dynamic a, dynamic b);

  dynamic makeCompareValue(dynamic v);
}

extension SamojectTableColumnTypeExtension on SamojectTableColumnType {
  bool get isText => this is SamojectTableColumnTypeText;

  bool get isNumber => this is SamojectTableColumnTypeNumber;

  bool get isCurrency => this is SamojectTableColumnTypeCurrency;

  bool get isSelect => this is SamojectTableColumnTypeSelect;

  bool get isDate => this is SamojectTableColumnTypeDate;

  bool get isTime => this is SamojectTableColumnTypeTime;

  SamojectTableColumnTypeText get text {
    if (this is! SamojectTableColumnTypeText) {
      throw TypeError();
    }

    return this as SamojectTableColumnTypeText;
  }

  SamojectTableColumnTypeNumber get number {
    if (this is! SamojectTableColumnTypeNumber) {
      throw TypeError();
    }

    return this as SamojectTableColumnTypeNumber;
  }

  SamojectTableColumnTypeCurrency get currency {
    if (this is! SamojectTableColumnTypeCurrency) {
      throw TypeError();
    }

    return this as SamojectTableColumnTypeCurrency;
  }

  SamojectTableColumnTypeSelect get select {
    if (this is! SamojectTableColumnTypeSelect) {
      throw TypeError();
    }

    return this as SamojectTableColumnTypeSelect;
  }

  SamojectTableColumnTypeDate get date {
    if (this is! SamojectTableColumnTypeDate) {
      throw TypeError();
    }

    return this as SamojectTableColumnTypeDate;
  }

  SamojectTableColumnTypeTime get time {
    if (this is! SamojectTableColumnTypeTime) {
      throw TypeError();
    }

    return this as SamojectTableColumnTypeTime;
  }

  bool get hasFormat => this is SamojectTableColumnTypeHasFormat;

  bool get applyFormatOnInit => hasFormat
      ? (this as SamojectTableColumnTypeHasFormat).applyFormatOnInit
      : false;

  dynamic applyFormat(dynamic value) => hasFormat
      ? (this as SamojectTableColumnTypeHasFormat).applyFormat(value)
      : value;
}

class SamojectTableColumnTypeText implements SamojectTableColumnType {
  @override
  final dynamic defaultValue;

  const SamojectTableColumnTypeText({
    this.defaultValue,
  });

  @override
  bool isValid(dynamic value) {
    return value is String || value is num;
  }

  @override
  int compare(dynamic a, dynamic b) {
    return _compareWithNull(a, b, () => a.toString().compareTo(b.toString()));
  }

  @override
  dynamic makeCompareValue(dynamic v) {
    return v.toString();
  }
}

class SamojectTableColumnTypeNumber
    with SamojectTableColumnTypeWithNumberFormat
    implements
        SamojectTableColumnType,
        SamojectTableColumnTypeHasFormat<String> {
  @override
  final dynamic defaultValue;

  @override
  final bool negative;

  @override
  final String format;

  @override
  final bool applyFormatOnInit;

  @override
  final bool allowFirstDot;

  @override
  final String? locale;

  SamojectTableColumnTypeNumber({
    this.defaultValue,
    required this.negative,
    required this.format,
    required this.applyFormatOnInit,
    required this.allowFirstDot,
    required this.locale,
  })  : numberFormat = intl.NumberFormat(format, locale),
        decimalPoint = _getDecimalPoint(format);

  @override
  final intl.NumberFormat numberFormat;

  @override
  final int decimalPoint;

  static int _getDecimalPoint(String format) {
    final int dotIndex = format.indexOf('.');

    return dotIndex < 0 ? 0 : format.substring(dotIndex).length - 1;
  }
}

class SamojectTableColumnTypeCurrency
    with SamojectTableColumnTypeWithNumberFormat
    implements
        SamojectTableColumnType,
        SamojectTableColumnTypeHasFormat<String?> {
  @override
  final dynamic defaultValue;

  @override
  final bool negative;

  @override
  final bool applyFormatOnInit;

  @override
  final bool allowFirstDot;

  @override
  final String? format;

  @override
  final String? locale;

  final String? name;

  final String? symbol;

  SamojectTableColumnTypeCurrency({
    this.defaultValue,
    required this.negative,
    required this.format,
    required this.applyFormatOnInit,
    required this.allowFirstDot,
    required this.locale,
    this.name,
    this.symbol,
    int? decimalDigits,
  }) : numberFormat = intl.NumberFormat.currency(
          locale: locale,
          name: name,
          symbol: symbol,
          decimalDigits: decimalDigits,
          customPattern: format,
        ) {
    decimalPoint = numberFormat.decimalDigits ?? 0;
  }

  @override
  final intl.NumberFormat numberFormat;

  @override
  late final int decimalPoint;
}

class SamojectTableColumnTypeSelect implements SamojectTableColumnType {
  @override
  final dynamic defaultValue;

  final List<dynamic> items;

  final bool enableColumnFilter;

  const SamojectTableColumnTypeSelect({
    this.defaultValue,
    required this.items,
    required this.enableColumnFilter,
  });

  @override
  bool isValid(dynamic value) => items.contains(value) == true;

  @override
  int compare(dynamic a, dynamic b) {
    return _compareWithNull(a, b, () {
      return items.indexOf(a).compareTo(items.indexOf(b));
    });
  }

  @override
  dynamic makeCompareValue(dynamic v) {
    return v;
  }
}

class SamojectTableColumnTypeDate
    implements
        SamojectTableColumnType,
        SamojectTableColumnTypeHasFormat<String>,
        SamojectTableColumnTypeHasDateFormat {
  @override
  final dynamic defaultValue;

  final DateTime? startDate;

  final DateTime? endDate;

  @override
  final String format;

  @override
  final String headerFormat;

  @override
  final bool applyFormatOnInit;

  SamojectTableColumnTypeDate({
    this.defaultValue,
    this.startDate,
    this.endDate,
    required this.format,
    required this.headerFormat,
    required this.applyFormatOnInit,
  })  : dateFormat = intl.DateFormat(format),
        headerDateFormat = intl.DateFormat(headerFormat);

  @override
  final intl.DateFormat dateFormat;

  @override
  final intl.DateFormat headerDateFormat;

  @override
  bool isValid(dynamic value) {
    final parsedDate = DateTime.tryParse(value.toString());

    if (parsedDate == null) {
      return false;
    }

    if (startDate != null && parsedDate.isBefore(startDate!)) {
      return false;
    }

    if (endDate != null && parsedDate.isAfter(endDate!)) {
      return false;
    }

    return true;
  }

  @override
  int compare(dynamic a, dynamic b) {
    return _compareWithNull(a, b, () => a.toString().compareTo(b.toString()));
  }

  @override
  dynamic makeCompareValue(dynamic v) {
    DateTime? dateFormatValue;

    try {
      dateFormatValue = dateFormat.parse(v.toString());
    } catch (e) {
      dateFormatValue = null;
    }

    return dateFormatValue;
  }

  @override
  String applyFormat(dynamic value) {
    final parseValue = DateTime.tryParse(value.toString());

    if (parseValue == null) {
      return '';
    }

    return dateFormat.format(DateTime.parse(value.toString()));
  }
}

class SamojectTableColumnTypeTime implements SamojectTableColumnType {
  @override
  final dynamic defaultValue;

  const SamojectTableColumnTypeTime({
    this.defaultValue,
  });

  static final _timeFormat = RegExp(r'^([0-1]?\d|2[0-3]):[0-5]\d$');

  @override
  bool isValid(dynamic value) {
    return _timeFormat.hasMatch(value.toString());
  }

  @override
  int compare(dynamic a, dynamic b) {
    return _compareWithNull(a, b, () => a.toString().compareTo(b.toString()));
  }

  @override
  dynamic makeCompareValue(dynamic v) {
    return v;
  }
}

abstract class SamojectTableColumnTypeHasFormat<T> {
  const SamojectTableColumnTypeHasFormat({
    required this.format,
    required this.applyFormatOnInit,
  });

  final T format;

  final bool applyFormatOnInit;

  dynamic applyFormat(dynamic value);
}

abstract class SamojectTableColumnTypeHasDateFormat {
  const SamojectTableColumnTypeHasDateFormat({
    required this.dateFormat,
    required this.headerFormat,
    required this.headerDateFormat,
  });

  final intl.DateFormat dateFormat;

  final String headerFormat;

  final intl.DateFormat headerDateFormat;
}

mixin SamojectTableColumnTypeWithNumberFormat {
  intl.NumberFormat get numberFormat;

  bool get negative;

  int get decimalPoint;

  bool get allowFirstDot;

  String? get locale;

  bool isValid(dynamic value) {
    if (!isNumeric(value)) {
      return false;
    }

    if (negative == false && num.parse(value.toString()) < 0) {
      return false;
    }

    return true;
  }

  int compare(dynamic a, dynamic b) {
    return _compareWithNull(
      a,
      b,
      () => toNumber(a.toString()).compareTo(toNumber(b.toString())),
    );
  }

  dynamic makeCompareValue(dynamic v) {
    return v.runtimeType != num ? num.tryParse(v.toString()) ?? 0 : v;
  }

  String applyFormat(dynamic value) {
    num number = num.tryParse(
          value.toString().replaceAll(numberFormat.symbols.DECIMAL_SEP, '.'),
        ) ??
        0;

    if (negative == false && number < 0) {
      number = 0;
    }

    return numberFormat.format(number);
  }

  /// Convert [String] converted to [applyFormat] to [number].
  dynamic toNumber(String formatted) {
    String match = '0-9\\-${numberFormat.symbols.DECIMAL_SEP}';

    if (negative) {
      match += numberFormat.symbols.MINUS_SIGN;
    }

    formatted = formatted
        .replaceAll(RegExp('[^$match]'), '')
        .replaceFirst(numberFormat.symbols.DECIMAL_SEP, '.');

    final num formattedNumber = num.tryParse(formatted) ?? 0;

    return formattedNumber.isFinite ? formattedNumber : 0;
  }

  bool isNumeric(dynamic s) {
    if (s == null) {
      return false;
    }
    return num.tryParse(s.toString()) != null;
  }
}

int _compareWithNull(
  dynamic a,
  dynamic b,
  int Function() resolve,
) {
  if (a == null || b == null) {
    return a == b
        ? 0
        : a == null
            ? -1
            : 1;
  }

  return resolve();
}
