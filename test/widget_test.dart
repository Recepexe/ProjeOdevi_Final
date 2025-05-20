import 'package:flutter_test/flutter_test.dart';
import 'package:bankaproje/main.dart';

void main() {
  testWidgets('App starts and shows YouTubeHomePage', (WidgetTester tester) async {
    // Uygulamayı başlat
    await tester.pumpWidget( MyApp());

    // YouTubeHomePage yüklendi mi kontrol et
    expect(find.byType(YouTubeHomePage), findsOneWidget);
  });
}
