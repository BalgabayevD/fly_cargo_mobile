package kz.flycargo.app.fly_cargo

import io.flutter.embedding.android.FlutterActivity
import com.yandex.mapkit.MapKitFactory

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: android.os.Bundle?) {
        super.onCreate(savedInstanceState)
        MapKitFactory.setApiKey("58894ad5-9031-4696-9c4e-4d62ebd8e3cc")
        MapKitFactory.setLocale("ru-RU")
    }
}
