v0.8.0
======

* Support for collecting inline feedback
* Gem is now up to date with API version 2016-01-20 (https://core.telegram.org/bots/api-changelog#january-20-2016).

v0.7.1
======

* Fixed order loading Telegrammer classes for inline mode (reported by markkuit in #17).
* Better examples in the docs for get_updates & answer_inline_query methods.

v0.7.0
======

* Added support for supergroups (https://telegram.org/blog/supergroups).
* Added support for the new inline mode (https://core.telegram.org/bots/inline).
* Gem is now up to date with API version 2016-01-04 (https://core.telegram.org/bots/api-changelog#january-4-2016).

v0.6.2
======

* Fixed user profile photos array with a custom datatype. Thanks to noma4i!

v0.6.1
======

* Updated operations that are using chat_id to also support "@channel" format (reported by rkpasia in #15).

v0.6.0
======

* New File & Chat datatypes.
* Implemented get_file operation.
* Gem is now up to date with API version 2015-10-08 (https://core.telegram.org/bots/api-changelog#october-8-2015).

v0.5.1
======

* Fixed an error raising some exceptions (reported by nkaviani in #13)

v0.5.0
======

* Option to fail silently on get_updates method. Thanks to TheZ3ro!

v0.4.1
======

* Added voice datatype to the required files by the gem.

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
