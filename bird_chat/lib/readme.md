screens — Contains the screens of your application. All files from here get imported into routes.dart
util — Contains the utilities/common functions of your application
widgets — Contains the common widgets for your applications. For example, Button , TextField etc.
routes.dart — Contains the routes of your application and imports all screens.
lib/
data - This folder would come into the picture once you integrate redux(or other) store into the application. Here you would put your reducers, actions etc.
services - This would handle all network and business logic of your application. For example, once you are authenticated with facebook/google you need to update backend with access tokens you can place that authentication in this folder.