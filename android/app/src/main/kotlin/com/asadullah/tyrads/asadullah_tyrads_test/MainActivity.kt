package com.asadullah.tyrads.asadullah_tyrads_test

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        val messenger = flutterEngine.dartExecutor.binaryMessenger
        MethodChannel(messenger, "going.native.for.userdata")
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "getData" -> {
                        val data = listOf(
                            StepperDataItem(
                                "Select campaign settings",
                                null,
                                "For each ad campaign that you create, you can control how much you're willing to spend on clicks and conversions, which networks and geographical locations you want your ads to show on, and more."
                            ),
                            StepperDataItem(
                                "Create an ad group",
                                null,
                                "Here you need to understand that you need to create an ad group in order to move further. Without creating an ad group, you can't go to next step."
                            ),
                            StepperDataItem(
                                "Create an ad",
                                "Last Step",
                                "Try out different ad text to see what brings in the most customers, and learn how to enhance your ads using features like ad extensions. If you run into any problems with your ads, find out how to tell if they're running and how to resolve approval issues."
                            )
                        )

                        result.success("[${data.joinToString()}]")
                    }
                    else -> result.notImplemented()
                }
            }
    }

    data class StepperDataItem(
        val title: String, val subtitle: String?, val description: String
    ) {
        override fun toString(): String {
            return "{" +
                    "\"title\":\"$title\"," +
                    "\"subtitle\":\"$subtitle\"," +
                    "\"description\":\"$description\"" +
            "}"
        }
    }
}
