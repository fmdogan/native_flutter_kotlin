package download_service

import android.content.Context
import android.os.Environment;
import androidx.annotation.NonNull
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class DownloadService {
    companion object {
        private const val channel = "samples.flutter.dev/download"

        private fun getDownloadsDirectory(context: Context): String? {
            return context.getExternalFilesDir(Environment.DIRECTORY_DOWNLOADS)?.absolutePath
        }

        fun methodChannelHandler(@NonNull applicationContext: Context, @NonNull flutterEngine: FlutterEngine) {
            MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channel).setMethodCallHandler { call, result ->
                if (call.method == "getDownloadsDirectory") {
                    val path = getDownloadsDirectory(applicationContext);

                    if (path != null) {
                        result.success(path)
                    } else {
                        result.error("UNAVAILABLE", "Downloads directory not found.", null)
                    }
                } else {
                    result.notImplemented()
                }
            }
        }
    }
}