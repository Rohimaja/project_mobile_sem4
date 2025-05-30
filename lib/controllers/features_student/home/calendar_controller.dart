import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:stipres/models/calendar_model.dart';
import 'package:stipres/services/academic_calendar_service.dart';

class CalendarController extends GetxController {
  final _box = GetStorage();
  final Logger log = Logger();
  final AcademicCalendarService academicCalendarService =
      AcademicCalendarService();
  var calenderList = <EventCalendar>[].obs;
  final RxMap<DateTime, List<Map<String, String>>> eventsMap =
      <DateTime, List<Map<String, String>>>{}.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCalendar();
  }

  void fetchCalendar() async {
    try {
      final result = await academicCalendarService.fetchCalendar();

      if (result.status == 'success') {
        final calendar = result.data ?? []; // default empty list
        calenderList.assignAll(calendar);
        log.d(result.data);
        eventsMap.assignAll(_generateEventMap(calendar));
      } else {
        log.w("Fetch calendar failed: ${result.message}");
      }
    } catch (e) {
      log.f("Error: $e");
    }
  }

  Map<DateTime, List<Map<String, String>>> _generateEventMap(
      List<EventCalendar> calendarList) {
    final Map<DateTime, List<Map<String, String>>> eventMap = {};

    for (var event in calendarList) {
      final DateTime startDate = event.tanggalMulai;
      final DateTime? endDate =
          event.tanggalSelesai != null ? event.tanggalSelesai : null;

      final String type = event.status == 1 ? 'Kegiatan' : 'Libur';

      // loop dari startDate ke endDate jika endDate ada, kalau tidak, hanya 1 hari
      DateTime currentDate = startDate;
      while (true) {
        final dateKey =
            DateTime.utc(currentDate.year, currentDate.month, currentDate.day);
        eventMap.putIfAbsent(dateKey, () => []);
        eventMap[dateKey]!.add({'title': event.judul, 'type': type});

        if (endDate == null || currentDate.isAtSameMomentAs(endDate)) break;

        currentDate = currentDate.add(const Duration(days: 1));
      }
    }

    return eventMap;
  }

  List<Map<String, String>> getEventsForDay(DateTime day) {
    final key = DateTime.utc(day.year, day.month, day.day);
    return eventsMap[key] ?? [];
  }
}
