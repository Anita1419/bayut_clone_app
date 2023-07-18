class NumberToWord {
  String convertNumberToWord(int number) {
    final List<String> units = [
      'zero',
      'one',
      'two',
      'three',
      'four',
      'five',
      'six',
      'seven',
      'eight',
      'nine',
      'ten',
      'eleven',
      'twelve',
      'thirteen',
      'fourteen',
      'fifteen',
      'sixteen',
      'seventeen',
      'eighteen',
      'nineteen'
    ];

    final List<String> tens = [
      '',
      '',
      'twenty',
      'thirty',
      'forty',
      'fifty',
      'sixty',
      'seventy',
      'eighty',
      'ninety'
    ];

    if (number < 20) {
      return units[number];
    }

    if (number < 100) {
      if (number % 10 == 0) {
        return tens[number ~/ 10];
      } else {
        return tens[number ~/ 10] + ' ' + units[number % 10];
      }
    }

    if (number < 1000) {
      if (number % 100 == 0) {
        return units[number ~/ 100] + ' hundred';
      } else {
        return units[number ~/ 100] +
            ' hundred ' +
            convertNumberToWord(number % 100);
      }
    }

    if (number < 1000000) {
      if (number % 1000 == 0) {
        return convertNumberToWord(number ~/ 1000) + ' thousand';
      } else {
        return convertNumberToWord(number ~/ 1000) +
            ' thousand ' +
            convertNumberToWord(number % 1000);
      }
    }

    return '';
  }
}
