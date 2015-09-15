v0.4.0
======

* Added some methods and data types to be up to date with API version 2015-09-07 (https://core.telegram.org/bots/api-changelog#september-7-2015).

v0.3.1
======

* Fixed bug in get_updates (an extra parameter used in the development of the HTTPClient migration).

v0.3.0
======

* Using HTTPClient to get support for persistent connections (like in get_updates).

v0.2.0
======

* Simplified internals for send operations to reuse as much as possible.

v0.1.0
======

* Fixing coercion in Telegrammer::DataTypes::Channel.
* Fixed some Telegram data types.
* Better error handling when Telegram API servers are down.
* Improved documentation.

v0.0.3
======

* Set default values in ReplyKeyboardHide, ReplyKeyboardMarkup and ForceReply objects so they match official documentation.

v0.0.2
======

* Nothing changed, just uploading again to rubygems.org with all the docs updated.

v0.0.1
======

* Initial release.
