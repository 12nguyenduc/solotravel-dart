package link.solotravel.android

import io.flutter.app.FlutterApplication
import io.flutter.plugin.common.PluginRegistry
import io.flutter.plugin.common.PluginRegistry.PluginRegistrantCallback
import io.flutter.plugins.firebasemessaging.FlutterFirebaseMessagingService
import io.flutter.plugins.GeneratedPluginRegistrant
import vn.hunghd.flutterdownloader.FlutterDownloaderPlugin

public class Application: FlutterApplication(), PluginRegistrantCallback {
    override fun onCreate() {
        super.onCreate()
        FlutterFirebaseMessagingService.setPluginRegistrant(this)
    }

    override fun registerWith(registry: PluginRegistry) {
        FirebaseCloudMessagingPluginRegistrant.registerWith(registry)
        GeneratedPluginRegistrant.registerWith(registry)
    }
}
