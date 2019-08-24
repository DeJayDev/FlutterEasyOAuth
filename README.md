[![Words](https://img.shields.io/static/v1?style=flat-square&label=Fork+of&message=codeing-io/FlutterOAuth&color=informational&logo=Git)](https://github.com/codeing-io/FlutterOAuth/)

# Flutter OAuth

Another Flutter OAuth package for simplifying OAuth operations

Originally tested with small collection of services such as:
* [Strava](https://strava.com/)
* [Unsplash](https://unsplash.com)
* [GitHub](https://github.com/DeJayDev/FlutterOAuth)

If there is an issue with a specific service you are trying to work with, feel free to file an issue. :)

## Authorizing an application

Performing authorization for an API is pretty easy, in most cases you just need to do the following:

```dart
final OAuth flutterOAuth = new FlutterOAuth(
    new Config(
        "https://unsplash.com/oauth/authorize",
        "https://unsplash.com/oauth/token",
        "YOUR_CLIENT_ID",
        "YOUR_CLIENT_SECRET",
        "http://localhost:8080",
        "code"
    )
);
```

This allows you to pass in an Authorization URL, Token Request URL, Your Applications Client ID, Your Applications Client Secret, Redirect URL and the response type. 

This should satisfy most requests, but if not then you can pass
in other optional parameters for:

- `contentType` - This allows you to change the content type for the request. For example, when using the Spotify API you need to set the contentType to `application/x-www-form-urlencoded`

```dart
final OAuth flutterOAuth = new FlutterOAuth(
    new Config(
        ...,
        contentType: "application/x-www-form-urlencoded"
    )
);
```

- `parameters` - Add your own parameters that this library may not support (yet!). For example, when using the GitHub API you may send a state string and scopes to request authorization for.

```dart
Map<String, String> customParameters = {"state": "SOME_RANDOM_SECURE_STRING", "scope": "public_repo"};

final OAuth flutterOAuth = new FlutterOAuth(
    new Config(
        ...,
        parameters: customParameters
    )
);
```

- `headers` - Some services may require you to send a custom header, such as `Authorization`.

```dart
Map<String, String> headers = {"Authorization": "Basic SOME_BASE_64_STRING"};

final OAuth flutterOAuth = new FlutterOAuth)
    new Config(
        ...,
        headers: headers
    )
);
```

Then once you have an OAuth instance, you may simply call the `performAuthorization()` method like so to retrieve a Token:

```dart
Token token = await flutterOAuth.performAuthorization();
String accessToken = token.accessToken;
```
    
## Installing

Add the following you your pubspec.yaml dependancies:

```yaml
dependencies:
  flutter_oauth2: "^1.0.0"
```

## Thanks to

Kevin Seqaud for his [awesome blog post on Flutter OAuth](https://medium.com/@segaud.kevin/facebook-oauth-login-flow-with-flutter-9adb717c9f2e)

The [Flutter Webview plugin](https://github.com/dart-flitter/flutter_webview_plugin), which carrys this library on it's back.
