// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reco_is_here/data/models/CalendarEventsProvider%20.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:reco_is_here/presentation/screens/calender/calender_strapi_event.dart';
import 'package:reco_is_here/presentation/screens/calender/event_stuff.dart';

class CalendarViewPage extends StatefulWidget {
  const CalendarViewPage({Key? key}) : super(key: key);

  @override
  State<CalendarViewPage> createState() => _CalendarViewPageState();
}

class _CalendarViewPageState extends State<CalendarViewPage> {
  late final CalendarFormat _calendarFormat = CalendarFormat.month;
  late DateTime _focusedDay = DateTime.now();
  late DateTime _selectedDay = DateTime.now();
  late ValueNotifier<List<Event>> _selectedEvents;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay));

    // Fetch events when the widget is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final eventsProvider =
          Provider.of<CalendarEventsProvider>(context, listen: false);
      if (!eventsProvider.isLoaded && !eventsProvider.isLoading) {
        eventsProvider.fetchAndFormatStrapiEvents();
      }
    });
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    final eventsProvider =
        Provider.of<CalendarEventsProvider>(context, listen: false);
    return eventsProvider.getEventsForDay(day);
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar Events'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              final eventsProvider =
                  Provider.of<CalendarEventsProvider>(context, listen: false);
              eventsProvider.clearEvents();
              eventsProvider.fetchAndFormatStrapiEvents();
            },
          ),
          // Debug action to add test event for the selected day
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              final eventsProvider =
                  Provider.of<CalendarEventsProvider>(context, listen: false);
              eventsProvider.addTestEvent(_selectedDay);
              _selectedEvents.value = _getEventsForDay(_selectedDay);
            },
          ),
        ],
      ),
      body: Consumer<CalendarEventsProvider>(
        builder: (context, eventsProvider, child) {
          if (eventsProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            children: [
              // Calendar widget
              TableCalendar<Event>(
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                eventLoader: _getEventsForDay,
                startingDayOfWeek: StartingDayOfWeek.monday,
                onDaySelected: _onDaySelected,
                calendarStyle: const CalendarStyle(
                  markersMaxCount: 3,
                  markerSize: 6.0,
                ),
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                ),
              ),

              // Events for selected day
              Expanded(
                child: ValueListenableBuilder<List<Event>>(
                  valueListenable: _selectedEvents,
                  builder: (context, events, _) {
                    if (events.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('No events on this date'),
                            const SizedBox(height: 16),
                            Text(
                              DateFormat('EEEE, MMMM d, yyyy')
                                  .format(_selectedDay),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      );
                    }

                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Events for ${DateFormat('EEEE, MMMM d, yyyy').format(_selectedDay)}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: events.length,
                            itemBuilder: (context, index) {
                              return CalendarEventCard(event: events[index]);
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
      // This button will force fetch event data
      floatingActionButton: Consumer<CalendarEventsProvider>(
        builder: (context, eventsProvider, _) {
          if (eventsProvider.errorMessage != null) {
            return FloatingActionButton(
              backgroundColor: Colors.red,
              child: const Icon(Icons.refresh),
              onPressed: () {
                eventsProvider.fetchAndFormatStrapiEvents();
              },
            );
          }
          return Container(); // No FAB if there's no error
        },
      ),
    );
  }
}
