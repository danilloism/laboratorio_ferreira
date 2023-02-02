import 'package:flutter_test/flutter_test.dart';
import 'package:laboratorio_ferreira_desktop/app/app.dart';
import 'package:laboratorio_ferreira_desktop/counter/counter.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
