package kz.flycargo.app.fly_cargo

import io.flutter.embedding.android.FlutterActivity
import com.yandex.mapkit.MapKitFactory

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: android.os.Bundle?) {
        super.onCreate(savedInstanceState)
        MapKitFactory.setApiKey("59c25445-fa99-4ece-9e95-cb87746576c5")
        MapKitFactory.initialize(this)
    }
}
