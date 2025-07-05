import com.android.build.gradle.internal.cxx.configure.gradleLocalProperties

plugins {
    id("com.android.application")
    kotlin("android")
}

android {
    namespace = "com.example.location_tracker" // Replace with your actual package name
    compileSdk = 34

    defaultConfig {
        applicationId = "com.example.location_tracker" // Replace with your package name
        minSdk = 21
        targetSdk = 34
        versionCode = 1
        versionName = "1.0"

        ndkVersion = "27.0.12077973" // Ensure this matches your NDK version
    }

    buildTypes {
        release {
            isMinifyEnabled = false
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = "11"
    }
}

dependencies {
    implementation("org.jetbrains.kotlin:kotlin-stdlib:1.9.10")
}
