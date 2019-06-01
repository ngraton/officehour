/// local custom cache area
final String fileStoreCacheIndexName = '_index.json';
final String sqlDatabaseName = 'officehour.db';
final String participantTable = 'participants';
final String appointmentTable = 'appointments';

enum CacheAction {
  read,
  write,
  remove,
  clear,
}

const Map<int, String> monthNames = {
  1: 'Jan',
  2: "Feb",
  3: 'Mar',
  4: 'Apr',
  5: 'May',
  6: 'Jun',
  7: 'Jul',
  8: 'Aug',
  9: 'Sep',
  10: 'Oct',
  11: 'Nov',
  12: 'Dec'
};

const Map<int, String> weekDayNames = {
  1: 'Mon',
  2: "Tue",
  3: 'Wed',
  4: 'Thu',
  5: 'Fri',
  6: 'Sat',
  7: 'Sun'
};
